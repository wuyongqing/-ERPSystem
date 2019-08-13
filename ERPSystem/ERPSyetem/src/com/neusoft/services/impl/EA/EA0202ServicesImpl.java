package com.neusoft.services.impl.EA;

import java.util.List;
import java.util.Map;

public class EA0202ServicesImpl extends EA02ServicesSupport 
{
	@Override
	public boolean update(String utype) throws Exception 
	{
		if(utype.equalsIgnoreCase("agreeChangeStatus"))
		{
			return this.agreeChangeStatus();
		}
		else if(utype.equalsIgnoreCase("rejectChangeStatus"))
		{
			return this.rejectChangeStatus();
		}
		else
		{
			throw new Exception("");
		}
	}
	
	private boolean rejectChangeStatus() throws Exception
	{
		String sql="UPDATE ab02 SET aab207 = 3 WHERE aab201 = ?";
		Object[] args={
				this.get("aab201")
		};
		boolean tag = executeUpdate(sql, args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "对流水号为[ "+this.get("aab201")+" ]的学生状态变更申请进行驳回";
			String remark = "驳回学生状态变更申请成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}

	private boolean agreeChangeStatus() throws Exception
	{
		StringBuilder sql1 =new StringBuilder()
				.append("select a.aab101,a.aab202,a.aab203,b.aab111")
				.append(" from ab02 a,ab01 b")
				.append(" where a.aab201=? and a.aab101=b.aab101")
				;
		Object[] args1={
				this.get("aab201")
		};
		Map<String, String> ins =this.queryForMap(sql1.toString(), args1);
		
		String sql2="UPDATE ab01 SET aab115 = ? WHERE aab101 = ? and aab115=?";
		Object[] args2={
				ins.get("aab203"),
				ins.get("aab101"),
				ins.get("aab202")
		};
		if(this.executeUpdate(sql2, args2)>0)
		{
			String sql3="UPDATE ab02 SET aab207 = 2 WHERE aab201 = ?";
			Object[] args3={
					this.get("aab201")
			};
			this.appendSql(sql3, args3);
			
			if(ins.get("aab203").toString().equals("3"))
			{
				String sql4="UPDATE ab03 SET aab308 = aab308-1 WHERE aab301 = ?";
				Object[] args4={
						ins.get("aab111")
				};
				this.appendSql(sql4, args4);
			}
			boolean tag = this.executeTransaction();
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "批准流水号为[ "+ins.get("aab101")+" ]的学生提出的状态变更申请";
				String remark = "批准学生状态变更申请成功";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag;
		}
		return false;
	}
	
	public Map<String,String> findById()throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("select b.aab201,a.aab102,a.aab103,b.aab202,")
				.append("       b.aab203,b.aab205,b.aab206,b.aab207,b.aab204 ")
				.append("    from ab01 a,ab02 b ")
				.append(" where a.aab101=b.aab101 and b.aab201=?")
    			;
    	//执行查询
    	return this.queryForMap(sql.toString(), this.get("aab201"));
    }
	public List<Map<String, String>> query() throws Exception
	{
		System.out.println("调用了EA0202的query方法");
		StringBuilder sql=new StringBuilder()
				.append("select b.aab201,a.aab102,a.aab103,b.aab202,")
				.append("       b.aab203,b.aab205,b.aab206,b.aab207,b.aab204 ")
				.append("    from ab01 a,ab02 b ")
				.append("where a.aab101=b.aab101 ")
				.append("order by b.aab207 ASC,b.aab206 DESC")
				;
		return this.queryForList(sql.toString());
	}
}