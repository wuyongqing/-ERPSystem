package com.neusoft.services.impl.EA;

import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class EA1002ServicesImpl extends JdbcServicesSupport
{
	/**
	 * 根据房间流水号查询房间信息
	 */
	public Map<String, String> findById()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select aab1101,aab1102,aab1103,aab1104,aab1105")
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
	 * 查询房间的住宿情况
	 */
	public List<Map<String,String>> query()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select x.aab1101,y.aab101,y.aab102,y.aab103,y.aab104,")
				.append("       y.aab109,y.aab110,x.aab1001")
				.append("  from ab10 x,ab01 y")
				.append(" where x.aab101=y.aab101")
				.append("   and x.aab1101=?")
				;
		Object args[]=
			{
					this.get("aab1101")
			};
		return this.queryForList(sql.toString(), args);
	}
	
	/**
	 * 删除学生的入住信息
	 * @return
	 * @throws Exception
	 */
	private boolean deleteById()throws Exception
	{
		StringBuilder sql1 = new StringBuilder()
				.append("delete from ab10 ")
				.append("      where aab1001=?")
				;
		Object args1[]=
			{
				this.get("aab1001")
			};
		StringBuilder sql2 = new StringBuilder()
				.append("update ab11 ")
				.append("   set aab1105=aab1105-1")
				.append(" where aab1101=?")
				;
		Object args2[]=
			{
				this.get("aab1101")
			};
		this.appendSql(sql1.toString(), args1);
		this.appendSql(sql2.toString(), args2);
		
		boolean tag = this.executeTransaction();
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "删除流水号为[ "+this.get("aab1101")+" ]的学生住宿信息";
			String remark = "删除学生住宿信息";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
}
