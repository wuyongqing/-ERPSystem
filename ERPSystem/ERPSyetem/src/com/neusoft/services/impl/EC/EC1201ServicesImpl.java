package com.neusoft.services.impl.EC;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;
import com.neusoft.system.tools.Tools;

public class EC1201ServicesImpl extends JdbcServicesSupport 
{
	private boolean requestToLookResult() throws Exception
	{
		Object[] args={
				this.get("user"),
				this.get("uaac1001")
		};
		String sql1="select aac201 from ac02 where aae101=? and aac1001=? ";
		Map<String, String> ins = this.queryForMap(sql1, args);
		if(ins==null)
		{
			StringBuilder sql2=new StringBuilder()
					.append("insert into ac02(aae101,aac1001,aac203,aac204,aac205)")
					.append(" values(?,?,3,'他人文档',now())")
					;
			boolean tag = executeUpdate(sql2.toString(), args)>0;
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "流水号为[ "+this.get("user")+" ]的教师提交了成果查看申请";
				String remark = "提交成果查看申请成功";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag;
		}
		else
		{
			System.out.println(ins.get("aac201"));
			String sql3="UPDATE ac02 SET aac203 = 3 WHERE (aac201 = ?)";
			Object[] args2={
					ins.get("aac201")
			};
			boolean tag = executeUpdate(sql3, args2)>0;
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "流水号为[ "+this.get("user")+" ]的教师提交了成果查看申请";
				String remark = "提交成果查看申请成功";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag;
		}
		
	}
	public Map<String,String> findById()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select b.aae101,a.aac1001,a.aac1002,")
				.append(" substring_index(a.aac1003,'\\\\',-1) as aac1003, ")
				.append(" substring_index(a.aac1003,'_',-1) as realFileName, ")
				.append(" a.aac1004,a.aac1005,b.aae101,b.aae102,b.aae103")
				.append("  from ac10 a,ae01 b ")
				.append("  where a.aae101 = b.aae101")
				.append("  and aac1001=?");
		return this.queryForMap(sql.toString(), this.get("uaac1001"));
	}
	public List<Map<String,String>> query()throws Exception
	{
		Object aae101 = this.get("user");
		Object aae102 = this.get("qaae102");
		Object aae103 = this.get("qaae103");
		Object baac1002 = this.get("baac1002");
		Object eaac1002 = this.get("eaac1002");
		Object aac203 = this.get("qaac203");
		StringBuilder sql=new StringBuilder()
				.append(" select c.aac1001 as thisaac1001,a.aac1002, ")
				.append(" c.aae101 as thisaae101,b.aae102,a.aac1005, ")
				.append(" (ifnull((select z.aac203 from ac02 z ")
				.append(" where z.aae101= ")
				.append(aae101.toString())
				.append(" and z.aac1001=thisaac1001),1)) fakeaac203 ")
				.append(" from ac10 a,ae01 b,ac02 c ")
				.append(" where a.aae101 = b.aae101 and a.aae101=c.aae101")
				.append(" and c.aac1001=a.aac1001 ")
				;
		List<Object> paramlist = new ArrayList<>();
		if(this.isNotNull(aae103))
		{
			sql.append(" and b.aae103 = ?");
			paramlist.add(aae103);
		}
		if(this.isNotNull(aae102))
		{
			sql.append(" and b.aae102 like ?");
			paramlist.add("%"+aae102+"%");
		}
		if(this.isNotNull(baac1002))
		{
			sql.append(" and a.aac1002 >= ?");
			paramlist.add(baac1002);
		}
		if(this.isNotNull(eaac1002))
		{
			sql.append(" and a.aac1002 <= ?");
			paramlist.add(eaac1002);
		}
		if(this.isNotNull(aac203))
		{
			sql.append(" having fakeaac203=?");
			paramlist.add(aac203);
		}
		sql.append(" order by aac1002");
		return  this.queryForList(sql.toString(), paramlist.toArray());
	}
	
	private boolean addResult() throws Exception
    {
    	Object [] args={
    				this.get("aae102"),
    				this.get("aae103")
    		};
    	System.out.println(this.get("aae102"));
    	String sql = "select a.aae101 from ae01 a where a.aae102=? and aae103= ?";
    	Map<String,String> ins = this.queryForMap(sql, args);
    	if(this.isNotNull(ins))
    	{
    		int aac1001=Tools.getSequence("aac1001");
    		String sql1 ="insert into ac10 (aae101,aac1001,aac1002,aac1003,aac1004,aac1005) values(?,?,?,?,?,?)";
        	Object[] args1= {
        			ins.get("aae101"),
        			aac1001,
        			new SimpleDateFormat("yyyy-MM-dd hh-mm-ss").format(new java.util.Date()),
        			this.get("filepath"),
        			this.get("aac1004"),
        			this.get("aac1005")
        	};
        	this.appendSql(sql1, args1);
        	StringBuilder sql2=new StringBuilder()
        			.append("insert into ac02(aae101,aac1001,aac203,aac204,aac205)")
        			.append( " values(?,?,2,'本人文档',now())")
        			;
        	Object[] args2={
        			ins.get("aae101"),
        			aac1001
        	};
        	this.appendSql(sql2.toString(), args2);
    		boolean tag = this.executeTransaction();
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "流水号为[ "+ins.get("aae101")+" ]的教师提交了教研成果";
				String remark = "提交成果成功";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag;
    	}
    	else
    	{
    		return false;
    	}
    	
    }
}
