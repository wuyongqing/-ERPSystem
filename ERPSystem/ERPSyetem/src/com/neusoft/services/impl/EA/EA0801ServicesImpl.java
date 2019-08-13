package com.neusoft.services.impl.EA;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class EA0801ServicesImpl extends JdbcServicesSupport
{
	/**
	 * 添加工作记录
	 * @param content ---操作的具体内容
	 * @param user ---操作人的流水号
	 * @param remark ---操作的简要内容
	 * @throws Exception
	 */
	public void addWorkRecord(Object content,Object user,Object remark)throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("   insert into af03(aaf302,aaf303,aaf304,aae101)")
				.append("             values(?,current_timestamp,?,?)")
				;
		Object args[]=
			{
				content,
				remark,
				user
			};
		this.executeUpdate(sql.toString(), args);
	}
	
	/**
	 * 查询个人工作记录.
	 */
	public List<Map<String,String>> query()throws Exception
	{
		Object baaf303 = this.get("baaf303");
		Object eaaf303 = this.get("eaaf303");
		
		String role = (String)this.get("role");
		String user = (String)this.get("user");
		StringBuilder sql = new StringBuilder()
				.append("  select aaf301,x.aae101,aaf302,aaf303,aaf304,")
				.append("         y.aae102,y.aae103")
				.append("    from af03 x, ae01 y")
				.append("   where x.aae101 = y.aae101")
				;
		List<Object> paramList = new ArrayList<>();
		//System.out.println(role);
		//System.out.println(user);
		if(role!=null && !role.equals("0"))
		{
			sql.append("  	and x.aae101=?");
			paramList.add(user);
		}
		if (isNotNull(baaf303)) 
		{
			sql.append("   and x.aaf303>=?");
			paramList.add(baaf303+" 00:00:00.0");
		}
		if(isNotNull(eaaf303))
		{
			sql.append("   and x.aaf303<=?");
			paramList.add(eaaf303+" 23:59:59.99");
		}
		sql.append(" order by aaf303 desc");
		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	public Map<String,String> findById()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("  select aaf301,x.aae101,aaf302,aaf303,aaf304,")
				.append("         y.aae102,y.aae103")
				.append("    from af03 x, ae01 y")
				.append("   where x.aae101 = y.aae101")
				.append("  	  and x.aaf301=?")
				;
		return this.queryForMap(sql.toString(), this.get("aaf301"));
	}
}
