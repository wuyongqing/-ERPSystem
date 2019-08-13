package com.neusoft.services.impl.EA;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class EA0701ServicesImpl extends JdbcServicesSupport 
{
	/**
	 * 批量删除员工违纪记录
	 * @return
	 * @throws Exception
	 */
	private boolean batchDelete()throws Exception
	{
		String sql = "delete from af02 where aaf201=?";
		String idlist[]=this.getIdList("idlist");
		boolean tag = this.batchUpdate(sql, idlist);
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "批量删除流水号为[ "+Tools.joinArray(idlist)+" ]的员工违纪记录";
			String remark = "批量删除员工违纪记录";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}

	/**
	 * 单一实例删除员工违纪记录
	 * @return
	 * @throws Exception
	 */
	private boolean deleteById()throws Exception 
	{
		StringBuilder sql = new StringBuilder()
				.append("delete from af02")
				.append(" where aaf201=?")
				;
				
		Object args[]=
			{
				this.get("aaf201")
			};
		boolean tag = this.executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "删除流水号为[ "+this.get("aaf201")+" ]的员工违纪记录";
			String remark = "删除员工违纪记录";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}

	/**
	 * 添加一项违纪记录,需要根据提供的员工姓名与编号等值查询出违纪人与记录人,
	 * 如果都存在再一同录入违纪记录表
	 * @return
	 * @throws Exception
	 */
	private boolean addViolation()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select x.aae101 as mem,y.aae101 as record")
				.append("  from ae01 x,ae01 y")
				.append(" where x.aae102=? and x.aae103=? and y.aae102=? and y.aae103=?")
				;
		Object args[]=
			{
				this.get("maae102"),
				this.get("maae103"),
				this.get("raae102"),
				this.get("raae103")
			};
		Map<String,String> map = this.queryForMap(sql.toString(), args);
		//如果姓名学号不匹配则添加失败
		if(map==null)
		{
			return false;
		}
		String mem = map.get("mem");
		String rec = map.get("record");
		if(isNotNull(mem)&&isNotNull(rec))
		{
			StringBuilder sql2 = new StringBuilder()
					.append("insert into af02(aae101,af0_aae101,aaf202,aaf203,aaf204)")
					.append("		   values(?,?,?,?,?)");
			Object arg[]=
				{
					mem,
					rec,
					this.get("aaf202"),
					this.get("aaf203"),
					this.get("aaf204")
				};
			boolean tag = this.executeUpdate(sql2.toString(), arg)>0;
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "添加员工流水号为[ "+mem+" ]的员工的违纪记录";
				String remark = "添加员工违纪记录";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag;
		}
		return false;
	}
	
	/**
	 * 根据违纪流水号修改里面对应的内容
	 * @return
	 * @throws Exception
	 */
	private boolean modifyViolation()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append(" update af02")
				.append("    set aaf202=?,aaf203=?,aaf204=?")
				.append("  where aaf201=?")
				;
		Object args[]=
			{
				this.get("aaf202"),
				this.get("aaf203"),
				this.get("aaf204"),
				this.get("aaf201")
			};
		boolean tag = this.executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "修改流水号为[ "+this.get("aaf201")+" ]的员工违纪记录";
			String remark = "修改员工违纪记录";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	/**
	 * 根据条件查询员工的违纪记录
	 */
	public List<Map<String,String>> query()throws Exception
	{
		Object qaae102 = this.get("qaae102");
		Object qaae103 = this.get("qaae103");
		Object baaf202 = this.get("baaf202");
		Object eaaf202 = this.get("eaaf202");
		
		StringBuilder sql = new StringBuilder()
				.append("select x.aaf201,y.aae102,y.aae103,z.aae102 as record,x.aaf202,")
				.append("	    x.aaf203,x.aaf204 ")
				.append("  from af02 x, ae01 y, ae01 z ")
				.append(" where x.aae101=y.aae101 ")
				.append("   and x.af0_aae101=z.aae101")
				;
		List<Object> paramList = new ArrayList<>();
		if(isNotNull(qaae102))
		{
			sql.append("   and y.aae102 like ?");
			paramList.add("%"+qaae102+"%");
		}
		if(isNotNull(qaae103))
		{
			sql.append("   and y.aae103=?");
			paramList.add(qaae103);
		}
		if(isNotNull(baaf202))
		{
			sql.append("   and x.aaf202>=?");
			paramList.add(baaf202);
		}
		if(isNotNull(eaaf202))
		{
			sql.append("   and x.aaf202<=?");
			paramList.add(eaaf202);
		}
		sql.append("  order by x.aaf202 desc ");
		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	 * 单一实例查询
	 */
	public Map<String,String> findById()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select x.aaf201,y.aae102,y.aae103,z.aae102 as record,x.aaf202,")
				.append("	    x.aaf203,x.aaf204,z.aae103 as recordnum ")
				.append("  from af02 x, ae01 y, ae01 z ")
				.append(" where x.aae101=y.aae101 ")
				.append("   and x.af0_aae101=z.aae101")
				.append("   and x.aaf201=?")
				;
		Object args[]=
			{
				this.get("aaf201"),
			};
		return this.queryForMap(sql.toString(),args);
	}
	
	
	/*
	 * 测试
	 */
//	public static void main(String[] args) 
//	{
//		EA0701ServicesImpl ea = new EA0701ServicesImpl();
//		Map<String,Object> dto = new HashMap<>();
//		dto.put("maae102", "唐振霆");
//		dto.put("maae103", "20160001");
//		dto.put("raae102", "唐振霆");
//		dto.put("raae103", "20160001");
//		dto.put("aaf202", "2016-01-01");
//		dto.put("aaf203", "乱加数据");
//		dto.put("aaf204", "继续添加");
//		ea.setMapDto(dto);
//		try {
//			ea.addViolation();
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
}
