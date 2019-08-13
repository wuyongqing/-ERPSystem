package com.neusoft.services.impl.ED;

import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;
import com.sun.org.apache.xerces.internal.util.SynchronizedSymbolTable;

public class ED05ServicesImpl extends EDServicesSupport 
{
	@Override
	public boolean update(String utype) throws Exception
	{
		if(utype.equalsIgnoreCase("addChangeDormRec"))
		{
			return this.addChangeDormRec();
		}
		else if(utype.equalsIgnoreCase("delDorRecById"))
		{
			System.out.println("调用了delDorRecById");
			return this.delDorRecById();
		}
		else
		{
			throw new Exception("在ED05ServicesImpl中调用了未定义的方法:["+utype+"]");
		}
	}
	private Map<String, String> ifDormExist(Object[] args) throws Exception
	{
		String sql="select aab1102 from ab11 where aab1102=?";
		return this.queryForMap(sql, args);
	}	
	private boolean addChangeDormRec()throws Exception
	{
		Map<String, String> ins=this.findStuNotById();
		Object args1[]={this.get("aab1402")};
		Map<String, String> ins1=this.ifDormExist(args1);
		Object args2[]={this.get("aab1403")};
		Map<String, String> ins2=this.ifDormExist(args2);
		if(ins==null || ins2==null)
		{
			return false;
		}
		StringBuilder sql=new StringBuilder()
				.append("INSERT INTO ab14 ")
				.append("(aab101, aab1402, aab1403, aab1404,")
				.append(" aab1405, aab1406, aab1407) ")
				.append("VALUES ( ?, ?, ?, ?, now(), ?, 1)")
				;
		Object args[]={
    			ins.get("aab101"),
    			ins1.get("aab1102"),
    			ins2.get("aab1102"),
    			this.get("aab1404"),
    			this.get("aab1406"),
    	};
		boolean tag = executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "为流水号为[ "+ins.get("aab101")+" ]的学生添加宿舍变更申请";
			String remark = "添加宿舍变更申请成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	

	public boolean delDorRecById() throws Exception
	{
		String sql="delete from ab14 where aab1401=?";
		boolean tag = this.executeUpdate(sql, this.get("aab1401"))>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "取消流水号为[ "+this.get("aab1401")+" ]的宿舍变更申请";
			String remark = "取消宿舍变更申请成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	public List<Map<String, String>> query() throws Exception
	{
		System.out.println("调用了ED05的query方法");
		StringBuilder sql=new StringBuilder()
				.append("select a.aab102,a.aab103,b.aab1402,b.aab1403,")
				.append("		b.aab1405,b.aab1404,b.aab1407,b.aab1401 ")
				.append("	 from ab01 a,ab14 b,ab03 c ")
				.append(" where a.aab101=b.aab101 and a.aab111=c.aab301 ")
				.append(" and c.ae0_aae101=? ")
				.append(" order by b.aab1407 ASC,b.aab1406 DESC")
				;
		Object args[]={
    			this.get("user")
    	};
		return this.queryForList(sql.toString(), args);
	}
}
