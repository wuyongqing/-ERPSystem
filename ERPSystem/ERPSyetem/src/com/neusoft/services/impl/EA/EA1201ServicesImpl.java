package com.neusoft.services.impl.EA;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class EA1201ServicesImpl extends JdbcServicesSupport 
{
	private boolean passRequestToLook() throws Exception
	{
		String sql = "UPDATE ac02 SET aac203 = 2 WHERE (aac201 = ?)";
		Object[] args={
				this.get("uaac201")
		};
		boolean tag = this.executeUpdate(sql, args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "批准流水号为[ "+this.get("uaac201")+" ]的教学成果查看申请";
			String remark = "批准教学成果查看申请";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	private boolean rejectRequestToLook() throws Exception
	{
		String sql = "UPDATE ac02 SET aac203 = 1 WHERE (aac201 = ?)";
		Object[] args={
				this.get("uaac201")
		};
		boolean tag = this.executeUpdate(sql, args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "驳回流水号为[ "+this.get("uaac201")+" ]的教学成果查看申请";
			String remark = "驳回教学成果查看申请";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
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
		Object aae102 = this.get("qaae102");
		Object aae103 = this.get("qaae103");
		Object baac205 = this.get("baac205");
		Object eaac205 = this.get("eaac205");
		Object aac203 = this.get("qaac203");
		StringBuilder sql=new StringBuilder()
				.append(" select c.aac1001,c.aae101,c.aac203,c.aac205, ")
				.append(" c.aac201,b.aae102,b.aae103,a.aac1005 ")
				.append(" from ac10 a,ae01 b,ac02 c ")
				.append(" where c.aae101 = b.aae101 ")
				.append(" and c.aac1001=a.aac1001 ")
				.append(" and c.aac204='他人文档' ")
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
		if(this.isNotNull(baac205))
		{
			sql.append(" and c.aac205 >= ?");
			paramlist.add(baac205);
		}
		if(this.isNotNull(eaac205))
		{
			sql.append(" and c.aac205 <= ?");
			paramlist.add(eaac205);
		}
		if(this.isNotNull(aac203))
		{
			sql.append(" c.aac203=?");
			paramlist.add(aac203);
		}
		sql.append(" order by c.aac203 desc");
		return  this.queryForList(sql.toString(), paramlist.toArray());
	}
}
