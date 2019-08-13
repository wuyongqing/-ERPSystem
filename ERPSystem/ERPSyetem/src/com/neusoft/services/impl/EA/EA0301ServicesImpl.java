package com.neusoft.services.impl.EA;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class EA0301ServicesImpl extends JdbcServicesSupport 
{
	/**
	 * sql1:
	 * select a.aab301,a.aab302,a.aab303,a.aab306,a.aab308,
	 * 		  a.aab309,if(d.aab101 is not null,count(a.aab301),0) scount,a.aab3010,a.aab3011,b.aab502 course,
	 *        c.aae102 teacher, z.aae102 headmaster
	 *   from (ab03 a, ab05 b, ae01 c, ae01 z)
	 *   left join ab01 d
	 *     on a.aab301 = d.aab111
	 *  where a.aab501 = b.aab501
	 *    and a.aae101 = c.aae101
	 *    and a.ae0_aae101 = z.aae101
	 *  group by a.aab302
	 * 		
	 * 
	 * sql2:
	 * select a.aab301,a.aab302,a.aab303,a.aab306,a.aab308,
	 *        a.aab309,if(d.aab101 is not null,count(a.aab301),0) scount,
     *        a.aab3010,a.aab3011,b.aab502 course,
     *        c.aae102 teacher, z.aae102 headmaster
  	 *   from ab03 a
  	 *	 left join ab01 d
  	 *	   on a.aab301 = d.aab111
  	 *	 left join ab05 b
  	 *	   on a.aab501 = b.aab501
  	 *	 left join ae01 c
  	 *	   on a.aae101 = c.aae101
  	 *	 left join ae01 z
  	 *	   on a.ae0_aae101 = z.aae101
  	 *	where true
  	 *	group by a.aab302
	 *   	   
	 */
	public List<Map<String,String>> query()throws Exception
	{
		Object qaab302 = this.get("qaab302");
		Object qaab303 = this.get("qaab303");
		Object qteacher = this.get("qteacher");
		Object qheadmaster = this.get("qheadmaster");
		Object qcourse = this.get("qcourse");
		Object qaab3011 = this.get("qaab3011");
		Object baab306 = this.get("baab306");
		Object eaab306 = this.get("eaab306");
		
		StringBuilder sql = new StringBuilder()
				.append("select a.aab301,a.aab302,a.aab303,a.aab306,a.aab308,")
				.append("	   a.aab309,if(d.aab101 is not null,count(a.aab301),0) scount,")
				.append("       a.aab3010,a.aab3011,b.aab502 course,b.aab504,")
				.append("       datediff(a.aab3010,a.aab306) time,c.aae102 teacher, z.aae102 headmaster")
				.append("  from ab03 a")
				.append("  left join ab01 d")
				.append("  on a.aab301 = d.aab111")
				.append("  left join ab05 b")
				.append("  on a.aab501 = b.aab501")
				.append("  left join ae01 c")
				.append("  on a.aae101 = c.aae101")
				.append("  left join ae01 z")
				.append("  on a.ae0_aae101 = z.aae101")
				.append("  where true")
				;
		List<Object> paramList = new ArrayList<>();
		if(isNotNull(qaab302))
		{
			sql.append("    and a.aab302 like ?");
			paramList.add("%"+qaab302+"%");
		}
		if(isNotNull(qaab303))
		{
			sql.append("    and a.aab303=?");
			paramList.add(qaab303);
		}
		if(isNotNull(qteacher))
		{
			sql.append("    and c.aae102 like ?");
			paramList.add("%"+qteacher+"%");
		}
		if(isNotNull(qheadmaster))
		{
			sql.append("    and z.aae102 like ?");
			paramList.add("%"+qheadmaster+"%");
		}
		if(isNotNull(qcourse))
		{
			sql.append("    and b.aab502 like ?");
			paramList.add("%"+qcourse+"%");
		}
		if(isNotNull(qaab3011))
		{
			sql.append("    and a.aab3011=?");
			paramList.add(qaab3011);
		}
		if(isNotNull(baab306))
		{
			sql.append("    and a.aab306>=?");
			paramList.add(baab306);
		}
		if(isNotNull(eaab306))
		{
			sql.append("    and a.aab306<=?");
			paramList.add(eaab306);
		}
		sql.append("  group by a.aab302")
		   .append("  order by aab303 desc");
		return this.queryForList(sql.toString(),paramList.toArray());
	}
	
	
	
	private boolean batchDelete()throws Exception
	{
		String sql = "delete from ab03 where aab301=?";
		String idlist[] = this.getIdList("idlist");
		
		boolean tag = this.batchUpdate(sql, idlist);
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "批量停用账号";
			String remark = "停用账号";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		
		return tag;
	}
	
	private boolean deleteById()throws Exception
	{
		StringBuilder sql1 = new StringBuilder()
				.append("select aab601 from ab06")
				.append("       where aab301=?")
				;
		List<Map<String,String>> map = this.queryForList(sql1.toString(), this.get("aab301"));
		if(map.size()!=0)
		{
			return false;
		}
		
		String sql = "delete from ab03 where aab301=?";
		Object args[] = 
			{
				this.get("aab301")
			};
		
		boolean tag = this.executeUpdate(sql,args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "删除流水号为[ "+this.get("aab301")+" ]的班级";
			String remark = "删除班级成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		
		return tag;
	}
	
}
