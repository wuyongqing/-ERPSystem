package com.neusoft.services.impl.EA;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class EA0901ServicesImpl extends JdbcServicesSupport 
{
	public Map<String,String> findById()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("  select aaf401,aaf402,aaf403,aaf404,aaf405,")
				.append("         aaf406,aaf407,aaf408,aaf409,y.aae101,")
				.append("         y.aae102,y.aae103")
				.append("    from af04 x,ae01 y")
				.append("   where x.aae101=y.aae101")
				.append("     and aaf401=?")
				;
		Object args[]=
			{
				this.get("aaf401")
			};
		return this.queryForMap(sql.toString(), args);
	}
	
	/**
	 * 根据访客登记信息的流水号,删除对应的访客登记记录
	 * @return
	 * @throws Exception
	 */
	private boolean deleteById()throws Exception
	{
		String sql = "delete from af04 where aaf401=?";
		Object aaf401 = this.get("aaf401");
		boolean tag = this.executeUpdate(sql, aaf401)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "删除流水号为[ "+this.get("aaf401")+" ]的访客登记记录";
			String remark = "删除访客登记记录";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	private boolean batchDelete()throws Exception
	{
		String sql = "delete from af04 where aaf401=?";
		String idlist[] = this.getIdList("idlist");
		boolean tag = this.batchUpdate(sql, idlist);
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "批量删除流水号为[ "+Tools.joinArray(idlist)+" ]的访客登记记录";
			String remark = "批量删除访客登记记录";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	/**
	 * 根据条件查询访客登记表中的信息,同时查询对应的记录人的信息
	 */
	public List<Map<String,String>> query()throws Exception
	{
		Object qaaf402=this.get("qaaf402");
		Object qaaf407=this.get("qaaf407");
		Object baaf403=this.get("baaf403");
		Object eaaf403=this.get("eaaf403");
		Object baaf404=this.get("baaf404");
		Object eaaf404=this.get("eaaf404");
		
		StringBuilder sql = new StringBuilder()
				.append("		select aaf401,x.aae101,aaf402,aaf403,aaf404,")
				.append("			   aaf407, y.aae102")
				.append("          from af04 x, ae01 y")
				.append("		  where y.aae101=x.aae101")
				;
		List<Object> paramList = new ArrayList<>();
		if(isNotNull(qaaf402))
		{
			sql.append("            and aaf402 like ? ");
			paramList.add("%"+qaaf402+"%");
		}
		if(isNotNull(qaaf407))
		{
			sql.append("            and aaf407 like ? ");
			paramList.add("%"+qaaf407+"%");
		}
		if(isNotNull(baaf403))
		{
			sql.append("            and aaf403>=? ");
			paramList.add(baaf403);
		}
		if(isNotNull(eaaf403))
		{
			sql.append("            and aaf403<=? ");
			paramList.add(eaaf403);
		}
		if(isNotNull(baaf404))
		{
			sql.append("            and aaf404>=? ");
			paramList.add(baaf404);
		}
		if(isNotNull(eaaf404))
		{
			sql.append("            and aaf404<=? ");
			paramList.add(eaaf404);
		}
		
		return this.queryForList(sql.toString(),paramList.toArray());
	}
	

	/**
	 * 添加访客登记信息进入访客登记表
	 * @return
	 * @throws Exception
	 */
	private boolean addVisitor()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append(" insert into af04(aaf402,aaf403,aaf404,aaf405,aaf406,")
				.append("                  aaf407,aaf408,aaf409,aae101)")
				.append("           values(?,?,?,?,?,")
				.append("                  ?,?,?,?)")
				;
		Object args[]=
			{
				this.get("aaf402"),
				this.get("aaf403"),
				this.get("aaf404"),
				this.get("aaf405"),
				this.get("aaf406"),
				this.get("aaf407"),
				this.get("aaf408"),
				this.get("aaf409"),
				this.get("user")
			};
		boolean tag = this.executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "添加姓名为[ "+this.get("aaf402")+" ]的访客登记记录";
			String remark = "添加访客登记记录";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
}
