package com.neusoft.services.impl.ED;

import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class EDServicesSupport extends JdbcServicesSupport 
{
	public Map<String,String> findStuNotById() throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select a.aab101 from ab01 a ")
				.append("where a.aab102=? and a.aab103=? and a.aab111=?")
				;
		Object args1[]={this.get("user")};
		String sql1="select aab301 from ab03 where ae0_aae101=?";
		Map<String, String> ins=this.queryForMap(sql1, args1);
		System.out.println(ins==null);
		if(ins==null)
		{
			return null;
		}
		Object args[]={
    			this.get("aab102"),
    			this.get("aab103"),
    			ins.get("aab301")
    			};
		return this.queryForMap(sql.toString(), args);
	}
	public Map<String, String> ifClassExist(Object[] args) throws Exception
	{
		String sql="select aab301,ae0_aae101 from ab03 where aab303=?";
		return this.queryForMap(sql, args);
	}
}
