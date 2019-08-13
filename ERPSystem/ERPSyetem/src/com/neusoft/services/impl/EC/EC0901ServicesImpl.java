package com.neusoft.services.impl.EC;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;
import com.neusoft.system.tools.Tools;

/**
 * @author susheng
 * @date 2019年7月5日
 * @time 上午10:31:37
 * 教研方案管理
 */
public class EC0901ServicesImpl extends JdbcServicesSupport
{
	private boolean batchDelete() throws Exception
	{
		String sql1 = "delete from ac11 where aac401=?";
		String sql2 = "delete from ac04 where aac401=?";
		this.appendBatch(sql1, this.getIdList("idlist"));
		this.appendBatch(sql2, this.getIdList("idlist"));
		 boolean tag = this.executeTransaction();
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "批量删除教研活动";
				String remark = "删除成功";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag;
	}
	private boolean modifyPlan() throws Exception
	{
		String sql="update ac03 a set a.aac302=?,a.aac303=2,a.aac304=? where a.aac301=?";
		 Object[] args= {
				 this.get("aac302"),
				 this.get("aac304"),
				 this.get("aac301")
		 };
		 boolean tag =this.executeUpdate(sql, args)>0;
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "修改流水号为[ "+this.get("aac301")+" ]的教研活动";
				String remark = "修改成功";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag;
	}
    private boolean addActivity() throws Exception
    {
    	Object [] args={
    				this.get("aae102"),
    				this.get("aae103")
    		};
    	String sql = "select a.aae101 from ae01 a where a.aae102=? and aae103= ?";
    	Map<String,String> ins = this.queryForMap(sql, args);
    	if(this.isNotNull(ins))
    	{
    		        int aac401= Tools.getSequence("aac401");
			    	String sql1 ="insert into ac04 (aac401,aae101,aac402,aac403,aac404) values(?,?,?,?,?)";
			    	Object[] args1= {
			    			aac401,
			    			ins.get("aae101"),
			    			this.get("aac402"),
			    			this.get("aac403"),
			    			this.get("aac404")
			    	};
			    	String sql2 = "insert into ac11(aac301,aac401) values(?,?)";
			    	Object[] args2=
			    		{
			    			 this.get("maac301"),
			    			 aac401
			    		};
			    	this.appendSql(sql1, args1);
			    	this.appendSql(sql2, args2);
			      boolean tag = this.executeTransaction();
					if(tag==true)
					{
						EA0801ServicesImpl service = new EA0801ServicesImpl();
						String content = "为流水号为[ "+this.get("maac301")+" ]的教研方案添加教研活动";
						String remark = "添加成功";
						service.addWorkRecord(content, this.get("user"), remark);
					}
					return tag;
    	 }
    	 else
    	 {
    		return false;
    	 }
    }
	 private boolean delByIdActivity() throws Exception
	 {
		 Object aac401 = this.get("aac401");
		 String  sql1 = "delete from ac11 where aac401=? ";
		 String  sql2 = "delete from ac04 where aac401=? ";
		 this.appendSql(sql1, aac401);
		 this.appendSql(sql2, aac401);
		  boolean tag = this.executeTransaction();
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "删除流水号为[ "+this.get("aac401")+" ]的教研活动";
				String remark = "删除成功";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag; 
	 }
	 private boolean modifyActivity() throws Exception
	 {
		 String sql1 = "select b.aae101 from ae01 b where b.aae102=?";
		Object aae101= this.queryForMap(sql1, this.get("aae102")).get("aae101");
		if(this.isNotNull(aae101))
		{
			StringBuilder sql = new StringBuilder()
					.append("update ac04 a , ae01 b ")
	    			.append("   set a.aae101= ?,a.aac402=?,a.aac403=?,a.aac404=?")
	    			.append("   where a.aac401=? ")
	    			;
			Object[] args= {
					aae101,
					this.get("aac402"),
					this.get("aac403"),
					this.get("aac404"),
					this.get("aac401"),
			        };
			  boolean tag =  this.executeUpdate(sql.toString(), args)>0;
				if(tag==true)
				{
					EA0801ServicesImpl service = new EA0801ServicesImpl();
					String content = "修改流水号为[ "+this.get("aac401")+" ]的教研活动";
					String remark = "修改成功";
					service.addWorkRecord(content, this.get("user"), remark);
				}
				return tag; 
			}
			else
			{
				return false;
			}
	 }
	 private boolean addPlan()throws Exception
	 {
		     int aac301=Tools.getSequence("aac301");
		     System.out.println(aac301);
			 String sql2="insert into ac03 (aac301,aac302,aae101,aac303) values(?,?,?,2)";
			 Object[] args2= {
					 aac301,
					 this.get("aac302"),
					 this.get("user")
			 };
			 boolean tag = this.executeUpdate(sql2, args2)>0;
				if(tag==true)
				{
					EA0801ServicesImpl service = new EA0801ServicesImpl();
					String content = "添加新的教研活动";
					String remark = "修改成功";
					service.addWorkRecord(content, this.get("user"), remark);
				}
				return tag; 
	 }
	 private boolean cancelPlan()throws Exception
	 {
		 Object aac301 = this.get("uaac301");
		 String sql = "update ac03 set aac303 = 4 where aac301=?";
		 boolean tag = this.executeUpdate(sql, aac301)>0;
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content =  "撤销流水号为[ "+this.get("aac401")+" ]的教研活动";
				String remark = "撤销成功";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag; 
	 }
	private boolean delById()throws Exception
	{
		Object aac301 = this.get("uaac301");
		String sql1="select c.aac401 from ac03 b,ac11 c where b.aac301 = c.aac301 and b.aac301 =?";
		List<Map<String,String>> rows = this.queryForList(sql1, aac301);
		List<String> temps = new ArrayList<>();
		for(Map<String,String>ins : rows)
		{
			temps.add(ins.get("aac401"));
		}
		int length= temps.size();
		String [] idlist = new String[length]  ;
        for(int i = 0;i<length;i++)
        {
        	idlist[i] = temps.get(i);
        }
		String sql2= "delete from ac11 where aac301=?";
		this.appendSql(sql2, aac301);
		String sql3 = "delete from ac04 where aac401=?";
		this.appendBatch(sql3, idlist);
		String sql4 = "delete from ac03 where aac301=?";
		this.appendSql(sql4, aac301);
		boolean tag = this.executeTransaction();
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content =  "删除流水号为[ "+this.get("aac401")+" ]的教研活动";
			String remark = "删除成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
   
	public Map<String,String> findById()throws Exception
	{
		//1.编写SQL语句
		StringBuilder sql=new StringBuilder()
				.append(" select a.aac301,a.aac302,a.aac303,b.aae102,b.aae103,c.fvalue,a.aac304 ")
				.append("   from ac03 a,ae01 b,syscode c")
				.append("   where a.aae101 = b.aae101")
				.append("   and c.fname = 'aac303' and a.aac303 = c.fcode")
		        .append("   and a.aac301=?");
    	//执行查询
		
		if(!this.isNotNull(this.get("uaac301")))
		{
			return this.queryForMap(sql.toString(), Tools.getSequence("aac301"));
		}
		else
		{
    	   return this.queryForMap(sql.toString(), this.get("uaac301"));
		}
	}
	public Map<String,String> findByIdSub()throws Exception
	{
		//1.编写SQL语句
		StringBuilder sql=new StringBuilder()
				.append(" select d.aac301,a.aac401 ,b.aae103,b.aae102,a.aac402,a.aac403,a.aac404")
				.append("   from ac04 a ,ae01 b,ac11 c ,ac03 d")
				.append("   where a.aae101=b.aae101 and d.aac301=c.aac301 and a.aac401=c.aac401")
		        .append("   and a.aac401=?");
    	//执行查询
    	return this.queryForMap(sql.toString(), this.get("aac401"));
	}
	public List<Map<String,String>> query()throws Exception
	{
		Object aac302 = this.get("qaac302");
		Object aae102 = this.get("qaae102");
		Object qfvalue = this.get("qfvalue");
		StringBuilder sql=new StringBuilder()
				.append(" select a.aac301,a.aac302,a.aac303,a.aae101,c.fvalue,b.aae102,a.aac304 ")
				.append("   from ac03 a,ae01 b,syscode c")
				.append("   where a.aae101 = b.aae101")
			    .append("   and c.fname = 'aac303' and a.aac303 = c.fcode")
			    .append(" and a.aae101=? ");
		List<Object> paramlist = new ArrayList<>();
		paramlist.add(this.get("user"));
		if(this.isNotNull(aac302))
		{
			sql.append(" and a.aac302 like ?");
			paramlist.add("%"+aac302+"%");
		}
		if(this.isNotNull(aae102))
		{
			sql.append(" and b.aae102=?");
			paramlist.add(aae102);
		}
		if(this.isNotNull(qfvalue))
		{
			sql.append(" and a.aac303=?");
			paramlist.add(qfvalue);
		}
		sql.append(" order by a.aac303");
		return  this.queryForList(sql.toString(), paramlist.toArray());
	}
	public List<Map<String,String>> querySub()throws Exception
	{
		Object baac402 = this.get("baac402");
		Object eaac402 = this.get("eaac402");
		Object qaac403 = this.get("qaac403");
		Object qaae102 = this.get("qaae102");
		StringBuilder  sql = new StringBuilder()
				.append("select b.aac401,d.aae102,b.aac402,b.aac403,b.aac404")
				.append("    from ac03 a,ac04 b,ac11 c,ae01 d")
				.append("    where a.aac301 = c.aac301 and b.aac401 = c.aac401 and b.aae101 = d.aae101")
				.append("     and a.aac301 = ?");
		List<Object> paramlist = new ArrayList<>();
	    paramlist.add(this.get("uaac301"));
		if(this.isNotNull(baac402))
		{
			sql.append(" and b.aac402 >= ?");
			paramlist.add(baac402);
		}
		if(this.isNotNull(eaac402))
		{
			sql.append(" and b.aac402 <= ?");
			paramlist.add(eaac402);
		}
		if(this.isNotNull(qaac403))
		{
			sql.append(" and b.aac403 = ?");
			paramlist.add(qaac403);	
		}
		if(this.isNotNull(qaae102))
		{
			sql.append(" and d.aae102 = ?");
			paramlist.add(qaae102);
		}
		return this.queryForList(sql.toString(), paramlist.toArray())	;
	}
}
