package com.neusoft.services.impl.EA;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class EA1001ServicesImpl extends JdbcServicesSupport 
{
	/**
	 * 查询宿舍信息
	 */
	public List<Map<String,String>> query()throws Exception
	{
		Object aab1102 = this.get("qaab1102");
		Object aab1103 = this.get("qaab1103");
		Object aab1104 = this.get("qaab1104");
		Object aab1105 = this.get("qaab1105");
		StringBuilder sql = new StringBuilder()
				.append("select aab1101,aab1102,aab1103,aab1104,aab1105,")
				.append("       aab1107")
				.append("  from ab11")
				.append(" where true")
				;
		List<Object> paramList = new ArrayList<>();
		if(isNotNull(aab1102))
		{
			sql.append(" and aab1102 like ?");
			paramList.add("%"+aab1102+"%");
		}
		if(isNotNull(aab1103))
		{
			sql.append(" and aab1103=?");
			paramList.add(aab1103);
		}
		if(isNotNull(aab1104))
		{
			sql.append(" and aab1104=?");
			paramList.add(aab1104);
		}
		if(isNotNull(aab1105))
		{
			sql.append(" and aab1105=?");
			paramList.add(aab1105);
		}
		
		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	 * 宿舍流水号查询单一宿舍信息
	 */
	public Map<String,String> findById()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select aab1101,aab1102,aab1103,aab1104,aab1105,")
				.append("       aab1107,aab1106 ")
				.append("  from ab11")
				.append(" where aab1101=?")
				;
		Object args[]=
			{
					this.get("aab1101")
			};
		return this.queryForMap(sql.toString(), args);
	}
	
	/**
	 * 添加宿舍信息
	 * @return
	 * @throws Exception
	 */
	private boolean addDormitory()throws Exception
	{
		double number = Double.parseDouble(this.get("aab1107").toString());
		if(number>99999999.99)
		{
			return false;
		}
		int number2 = Integer.parseInt(this.get("aab1104").toString());
		if(number2>20)
		{
			return false;
		}
		StringBuilder sql = new StringBuilder()
				.append("insert into ab11(aab1102,aab1103,aab1104,aab1105,aab1106,")
				.append("                 aab1107)")
				.append("          values(?,?,?,0,?,")
				.append("      			  ?)")
				;
		Object args[]=
			{
				this.get("aab1102"),
				this.get("aab1103"),
				this.get("aab1104"),
				this.get("aab1106"),
				this.get("aab1107")
			};
		boolean tag = this.executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "添加宿舍[ "+this.get("aab1103")+this.get("aab1102")+" ]的宿舍信息";
			String remark = "添加宿舍信息";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	private boolean modifyDormitory()throws Exception
	{
		double number = Double.parseDouble(this.get("aab1107").toString());
		if(number>99999999.99)
		{
			return false;
		}
		int number2 = Integer.parseInt(this.get("aab1104").toString());
		if(number2>20)
		{
			return false;
		}
		StringBuilder sql = new StringBuilder()
				.append("update ab11")
				.append("   set aab1102=?,aab1103=?,aab1104=?,aab1106=?,aab1107=?")
				.append(" where aab1101=?")
				;
		Object args[]=
			{
				this.get("aab1102"),
				this.get("aab1103"),
				this.get("aab1104"),
				this.get("aab1106"),
				this.get("aab1107"),
				this.get("aab1101")
			};
		boolean tag = this.executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "修改宿舍[ "+this.get("aab1103")+this.get("aab1102")+" ]的宿舍信息";
			String remark = "修改宿舍信息";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	private boolean deleteById()throws Exception
	{
		StringBuilder sql1 = new StringBuilder()
				.append("select aab1001 from ab10")
				.append("       where aab1101=?")
				;
		List<Map<String,String>> map = this.queryForList(sql1.toString(), this.get("aab1101"));
		if(map.size()!=0)
		{
			return false;
		}
		
		String sql = "delete from ab11 where aab1101=?";
		Object args[]=
			{
				this.get("aab1101")
			};
		boolean tag = this.executeUpdate(sql, args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "删除流水号为[ "+this.get("aab1101")+" ]的宿舍信息";
			String remark = "删除宿舍信息";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	private boolean batchDelete()throws Exception
	{
		String sql = "delete from ab11 where aab1101=?";
		String idlist[]=this.getIdList("idlist");
		boolean tag = this.batchUpdate(sql, idlist);
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "批量删除流水号为[ "+Tools.joinArray(idlist)+" ]的宿舍信息";
			String remark = "批量删除宿舍信息";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
}
