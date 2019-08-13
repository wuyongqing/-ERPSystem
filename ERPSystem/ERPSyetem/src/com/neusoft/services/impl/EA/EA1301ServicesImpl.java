package com.neusoft.services.impl.EA;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class EA1301ServicesImpl extends JdbcServicesSupport 
{
	private boolean agreeTeachPlan() throws Exception
	{
		String sql="UPDATE ac03 SET aac303 = 1 WHERE aac301 = ?";
		Object[] args={
				this.get("uaac301")
		};
		boolean tag = executeUpdate(sql, args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "批准流水号为[ "+this.get("uaac301")+" ]的教研方案成功";
			String remark = "批准教研方案成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	private boolean rejectTeachPlan() throws Exception
	{
		String sql="UPDATE ac03 SET aac303 = 3 WHERE aac301 = ?";
		Object[] args={
				this.get("uaac301")
		};
		boolean tag = executeUpdate(sql, args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "驳回流水号为[ "+this.get("uaac301")+" ]的教研方案";
			String remark = "驳回教研方案成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	public List<Map<String,String>> query()throws Exception
	{
		Object aac301 = this.get("qaac301");
		Object aac302 = this.get("qaac302");
		Object aae102 = this.get("qaae102");
		Object qfvalue = this.get("qfvalue");
		StringBuilder sql=new StringBuilder()
				.append(" select a.aac301,a.aac302,a.aac303,a.aae101,c.fvalue,b.aae102,a.aac304 ")
				.append("   from ac03 a,ae01 b,syscode c")
				.append("   where a.aae101 = b.aae101")
			    .append("   and c.fname = 'aac303' and a.aac303 = c.fcode");
		List<Object> paramlist = new ArrayList<>();
		if(this.isNotNull(aac301))
		{
			sql.append(" and a.aac301=?");
			paramlist.add(aac301);
		}
		if(this.isNotNull(aac302))
		{
			sql.append(" and a.aac302 like ? ");
			paramlist.add("%"+aac302+"%");
		}
		if(this.isNotNull(aae102))
		{
			sql.append(" and b.aae102 like ? ");
			paramlist.add("%"+aae102+"%");
		}
		if(this.isNotNull(qfvalue))
		{
			sql.append(" and a.aac303=?");
			paramlist.add(qfvalue);
		}
		
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
		if(this.isNotNull(this.get("uaac301")))
		{
			paramlist.add(this.get("uaac301"));
		}
		else
		{
			paramlist.add(Tools.getSequence("aac301"));
		}
		
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
			sql.append(" and b.aac403 like ? ");
			paramlist.add("%"+qaac403+"%");	
		}
		if(this.isNotNull(qaae102))
		{
			sql.append(" and d.aae102 like ? ");
			paramlist.add("%"+qaae102+"%");
		}
		return this.queryForList(sql.toString(), paramlist.toArray());
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
}
