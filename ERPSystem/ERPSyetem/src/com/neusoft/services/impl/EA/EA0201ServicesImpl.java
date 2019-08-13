package com.neusoft.services.impl.EA;

import java.util.List;
import java.util.Map;

public class EA0201ServicesImpl extends EA02ServicesSupport 
{
	@Override
	public boolean update(String utype) throws Exception 
	{
		if(utype.equalsIgnoreCase("agreeChangeClass"))
		{
			return this.agreeChangeClass();
		}
		else if(utype.equalsIgnoreCase("rejectChangeClass"))
		{
			return this.rejectChangeClass();
		}
		else
		{
			throw new Exception("在EA0201ServicesImpl中调用了未定义的行为:["+utype+"]");
		}
	}
	
	private boolean agreeChangeClass() throws Exception
	{
		String sql2 ="select a.aab101,a.aab402,a.aab403 from ab04 a where a.aab401=?";
		Object[] args2={
				this.get("aab401")
		};
		Map<String, String> ins =this.queryForMap(sql2, args2);
		String sql3="UPDATE ab01 SET aab111 = ? WHERE aab101 = ? and aab111=?";
		Object[] args3={
				ins.get("aab403"),
				ins.get("aab101"),
				ins.get("aab402")
		};
		if(this.executeUpdate(sql3, args3) > 0){
			String sql1="UPDATE ab04 SET aab407 = 2 WHERE aab401 = ?";
			Object[] args1={
					this.get("aab401")
			};
			this.appendSql(sql1, args1);
			
			String sql4="UPDATE ab03 SET aab308 = aab308-1 WHERE aab301 = ?";
			Object[] args4={
					ins.get("aab402")
			};
			this.appendSql(sql4, args4);
			
			String sql5="UPDATE ab03 SET aab308 = aab308+1 WHERE aab301 = ?";
			Object[] args5={
					ins.get("aab403")
			};
			this.appendSql(sql5, args5);
			
			boolean tag = this.executeTransaction();
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "为流水号为[ "+ins.get("aab101")+" ]的学生进行班级调转";
				String remark = "班级调转成功";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag;
		}
		return false;
	}
	
	private boolean rejectChangeClass() throws Exception
	{
		String sql="UPDATE ab04 SET aab407 = 3 WHERE aab401 = ?";
		Object[] args={
				this.get("aab401")
		};
		boolean tag = executeUpdate(sql, args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "对流水号为[ "+this.get("aab401")+" ]的班级调转申请进行驳回";
			String remark = "班级调转驳回成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	public Map<String,String> findById()throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aab102,a.aab103,c1.aab303 aab402,")
				.append("b.aab405,b.aab401,b.aab404,c2.aab303 aab403")
				.append("	 from ab01 a,ab04 b,ab03 c1,ab03 c2 ")
    			.append(" where a.aab101=b.aab101 and b.aab401=? ")
    			.append(" and b.aab402=c1.aab301 and b.aab403=c2.aab301 ")
    			;
    	//执行查询
    	return this.queryForMap(sql.toString(), this.get("aab401"));
    }
	
	public List<Map<String, String>> query() throws Exception
	{
		System.out.println("调用了EA0201的query方法");
		StringBuilder sql=new StringBuilder()
				.append("select a.aab102,a.aab103,b.aab402,b.aab403,")
				.append("		b.aab405,b.aab406,b.aab407,b.aab401,")
				.append("		c1.aab303 faab303,c2.aab303 saab303 ")
				.append("	 from ab01 a,ab04 b,ab03 c1,ab03 c2 ")
				.append("where a.aab101=b.aab101 ")
				.append("and b.aab402=c1.aab301 and b.aab403=c2.aab301 ")
				.append("order by b.aab407 ASC,b.aab406 DESC")
				;
		return this.queryForList(sql.toString());
	}
}
