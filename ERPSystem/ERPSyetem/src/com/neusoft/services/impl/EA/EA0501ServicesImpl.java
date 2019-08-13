package com.neusoft.services.impl.EA;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.eclipse.jdt.internal.compiler.ast.ThrowStatement;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class EA0501ServicesImpl extends JdbcServicesSupport 
{

	public List<Map<String,String>> query()throws Exception
	{
		String[] idlist = this.getIdList("idlist");
		List<Map<String,String>> list = new ArrayList<>();
		StringBuilder sql = new StringBuilder()
				.append(" select aab301,aab302,aab303")
				.append("   from ab03")
				.append("  where aab301=?")
				;
		for(String id:idlist)
		{
			list.add(this.queryForMap(sql.toString(), id));
		}
		return list;
	}
	
	public List<Map<String,String>> queryForMem()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select x.aae101,x.aae102,x.aae103")
				.append("  from ae01 x")
				;
		return this.queryForList(sql.toString());
	}
	
	public List<Map<String,String>> queryForSelect()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select x.aab501,x.aab502,x.aab503")
				.append("  from ab05 x")
				;
		return this.queryForList(sql.toString());
	}
	
	private boolean mergeClass()throws Exception
	{
		int aab301=Tools.getSequence("aab301");
		String[] idlist = (String[])this.get("aab301");
		//查询出需要修改的学生流水号
		Map<String, List<Map<String, String>>> stulist = new HashMap<>();
		StringBuilder sql1 = new StringBuilder()
				.append(" select aab101")
				.append("   from ab01")
				.append("  where aab111=?")
				;
		for(String id:idlist) 
		{
			List<Map<String,String>> stu = this.queryForList(sql1.toString(), id);
			stulist.put(id, stu);
		}
		
		//读取课程编号
		Object course = this.get("course");
		Object coursenum = this.get("coursenum");
		System.out.println(course+":"+coursenum);
		StringBuilder sql2 = new StringBuilder()
				.append("  select aab501 from ab05")
				.append("   where aab502=? and aab503=?")
				;
		Object arg[]=
			{
				course,
				coursenum
			};
		Map<String,String> m = this.queryForMap(sql2.toString(), arg);
		String aab501 = m.get("aab501");
		if(!isNotNull(aab501))
		{
			return false;
		}
		this.put("aab303", Tools.getClassNumber());
		
		//添加新的班级信息
		StringBuilder sql3 = new StringBuilder()
				.append(" insert into ab03(aab302,aab303,aab306,aab307,aab501,")
				.append("                  aae101,ae0_aae101,aab308,aab309,aab3010,")
				.append("                  aab3011,aab301)")
				.append("           values(?,?,?,current_timestamp,?,")
				.append("                  ?,?,0,?,?,")
				.append("                  ?,?)")
				;
		Object args1[]=
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
		this.appendSql(sql3.toString(), args1);
		
		//修改原班级的结束日期为当前时间
		String sql4 = " update ab03 set aab3010=current_date,aab308=0 where aab301=?";
		this.appendBatch(sql4, idlist);
		
		//修改学生班级流水号
		String sql5 = " update ab01 set aab111=? where aab111=?";
		this.appendBatch(sql5.toString(), aab301, idlist);
		
		//添加班级变更记录
		StringBuilder sql6 = new StringBuilder()
				.append(" insert into ab04(aab402,aab403,aab404,aab405,aab406,")
				.append("                  aab407,aab101)")
				.append("           values(?,?,?,?,current_timestamp,")
				.append("                  2,?)")
				;
		//新班级人数修改
		String sql7 = "update ab03 set aab308=aab308+1 where aab301=?";
		for(String id:idlist) 
		{
			List<Map<String,String>> stu = stulist.get(id);
			List<String> stuaab101 = new ArrayList<>();
			for(Map<String,String> s:stu)
			{
				stuaab101.add(s.get("aab101"));
				//新班级人数修改
				this.appendSql(sql7, aab301);
			}
			Object args2[]=
				{
					id,
					aab301,
					this.get("aab404"),
					this.get("aab405")
				};
			this.appendBatch(sql6.toString(), args2, stuaab101.toArray());
		}
		
		boolean tag = this.executeTransaction();
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "将流水号为[ "+Tools.joinArray(idlist)+" ]的班级合并为流水号为[ "+aab301+" ]的班级";
			String remark = "合并班级";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
}
