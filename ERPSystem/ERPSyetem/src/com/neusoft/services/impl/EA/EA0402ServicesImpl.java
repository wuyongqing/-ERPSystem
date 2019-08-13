package com.neusoft.services.impl.EA;

import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class EA0402ServicesImpl extends JdbcServicesSupport 
{
	/**
	 * 查询所有员工信息以便在选择员工处进行下拉框显示
	 */
	public List<Map<String,String>> query()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select x.aae101,x.aae102,x.aae103")
				.append("  from ae01 x")
				;
		return this.queryForList(sql.toString());
	}
	
	/**
	 * 查询课程信息以供下拉框选择
	 */
	public List<Map<String,String>> queryForSelect()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select x.aab501,x.aab502,x.aab503")
				.append("  from ab05 x")
				;
		return this.queryForList(sql.toString());
	}
	
	private boolean addClass()throws Exception
	{
		Object course = this.get("course");
		Object coursenum = this.get("coursenum");
		System.out.println(course+":"+coursenum);
		StringBuilder sql1 = new StringBuilder()
				.append("  select aab501 from ab05")
				.append("   where aab502=? and aab503=?")
				;
		Object arg[]=
			{
				course,
				coursenum
			};
		Map<String,String> m = this.queryForMap(sql1.toString(), arg);
		String aab501 = m.get("aab501");
		if(!isNotNull(aab501))
		{
			return false;
		}
		this.put("aab303", Tools.getClassNumber());
		int aab301 = Tools.getSequence("aab301");
		StringBuilder sql2 = new StringBuilder()
				.append(" insert into ab03(aab302,aab303,aab306,aab307,aab501,")
				.append("                  aae101,ae0_aae101,aab308,aab309,aab3010,")
				.append("                  aab3011,aab301)")
				.append("           values(?,?,?,current_timestamp,?,")
				.append("                  ?,?,0,?,?,")
				.append("                  ?,?)")
				;
		Object args[]=
			{
				this.get("aab302"),
				this.get("aab303"),
				this.get("aab306"),
				aab501,
				this.get("teachernum"),
				this.get("headmasternum"),
				this.get("aab309"),
				this.get("aab3010"),
				this.get("aab3011"),
				aab301
			};
		
		boolean tag = this.executeUpdate(sql2.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "添加了课程流水号为[ "+aab501+" ]的班级[ "+aab301+" ]";
			String remark = "班级添加成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	/**
	 * 根据流水号查询对应的班级信息以及关联的班主任,教师以及课程信息.
	 */
	public Map<String,String> findById()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select a.aab301,a.aab302,a.aab303,a.aab306,a.aab308,")
				.append("	    a.aab309,a.aab3010,a.aab3011,b.aab502 course,b.aab503 coursenum,")
				.append("       c.aae102 teacher,c.aae103 teachernum,c.aae101 tl,")
				.append("       z.aae102 headmaster, z.aae103 headmasternum, z.aae101 hl")
				.append("  from ab03 a")
				.append("  left join ab05 b")
				.append("  on a.aab501 = b.aab501")
				.append("  left join ae01 c")
				.append("  on a.aae101 = c.aae101")
				.append("  left join ae01 z")
				.append("  on a.ae0_aae101 = z.aae101")
				.append("  where a.aab301=?")
				;
		Object args[]=
			{
				this.get("aab301")
			};
		return this.queryForMap(sql.toString(), args);
	}
	
	private boolean modifyClass()throws Exception
	{
		Object course = this.get("course");
		Object coursenum = this.get("coursenum");
		System.out.println(course+":"+coursenum);
		StringBuilder sql1 = new StringBuilder()
				.append("  select aab501 from ab05")
				.append("   where aab502=? and aab503=?")
				;
		Object arg[]=
			{
				course,
				coursenum
			};
		Map<String,String> m = this.queryForMap(sql1.toString(), arg);
		String aab501 = m.get("aab501");
		if(!isNotNull(aab501))
		{
			return false;
		}
		
		StringBuilder sql2 = new StringBuilder()
				.append(" update ab03")
				.append("    set aab306=?,aab309=?,aab3011=?,aae101=?,ae0_aae101=?,")
				.append("        aab501=?")
				.append("  where aab301=?")
				;
		
		Object args[]=
			{
				this.get("aab306"),
				this.get("aab309"),
				this.get("aab3011"),
				this.get("teachernum"),
				this.get("headmasternum"),
				aab501,
				this.get("aab301")
			};
		
		boolean tag = this.executeUpdate(sql2.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "修改流水号为[ "+this.get("aab301")+" ]的班级信息";
			String remark = "修改班级信息";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
}
