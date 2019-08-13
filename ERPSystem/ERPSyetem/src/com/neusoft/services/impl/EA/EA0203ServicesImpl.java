package com.neusoft.services.impl.EA;

import java.util.List;
import java.util.Map;

import com.sun.org.apache.xpath.internal.operations.And;

public class EA0203ServicesImpl extends EA02ServicesSupport 
{
	@Override
	public boolean update(String utype) throws Exception 
	{
		if(utype.equalsIgnoreCase("rejectChangeDorm"))
		{
			return this.rejectChangeDorm();
		}
		else if(utype.equalsIgnoreCase("agreeChangeDorm"))
		{
			return this.agreeChangeDorm();
		}
		else
		{
			throw new Exception("在EA0203ServicesImpl中调用了未定义的方法:["+utype+"]");
		}
	}
	
	private boolean rejectChangeDorm() throws Exception
	{
		System.out.println("即将驳回宿舍申请");
		String sql="UPDATE ab14 SET aab1407 = 3 WHERE aab1401 = ?";
		Object[] args={
				this.get("aab1401")
		};
		boolean tag = executeUpdate(sql, args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "驳回流水号为[ "+this.get("aab1401")+" ]的宿舍变更申请";
			String remark = "驳回宿舍变更申请成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	private boolean agreeChangeDorm() throws Exception
	{
		StringBuilder sql1=new StringBuilder()
				.append("select a.aab101,a.aab1402,a.aab1403,")
				.append(" b.aab1101 faab1101,c.aab1101 saab1101")
				.append(" from ab14 a,ab11 b,ab11 c ")
				.append(" where a.aab1401=? and b.aab1102=a.aab1402")
				.append(" and c.aab1102=a.aab1403")
				;
		Object[] args1={
				this.get("aab1401")
		};
		Map<String, String> ins=this.queryForMap(sql1.toString(), args1);
		StringBuilder sql2=new StringBuilder()
				.append("UPDATE ab10 SET aab1101 = ? WHERE aab101 = ? and aab1101=?")
				;
		Object[] args2={
				ins.get("saab1101"),
				ins.get("aab101"),
				ins.get("faab1101")
		};
		if(this.executeUpdate(sql2.toString(), args2)>0)//此人原宿舍是否填写正确
		{	
			//审批状态设为已审批
			String sql="UPDATE ab14 SET aab1407 = 2 WHERE aab1401 = ?";
			Object[] args={
					this.get("aab1401")
			};
			this.appendSql(sql, args);
			//原宿舍人数-1
			String sql3="UPDATE ab11 SET aab1105 = aab1105+1 WHERE aab1101 = ?";
			Object[] args3={
					this.get("faab1101")
			};
			this.appendSql(sql3, args3);
			//新宿舍人数+1
			String sql4="UPDATE ab11 SET aab1105 = aab1105-1 WHERE aab1101 = ?";
			Object[] args4={
					this.get("saab1101")
			};
			this.appendSql(sql4, args4);
			
			boolean tag = this.executeTransaction();
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "批准流水号为[ "+this.get("aab1401")+" ]的宿舍变更申请";
				String remark = "批准宿舍变更申请成功";
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
    			.append("select a.aab102,a.aab103,b.aab1402,b.aab1403,")
				.append("		b.aab1404,b.aab1406,b.aab1401 ")
				.append("	 from ab01 a,ab14 b ")
				.append(" where a.aab101=b.aab101 and b.aab1401=?")
    			;
    	//执行查询
    	return this.queryForMap(sql.toString(), this.get("aab1401"));
    }
	
	public List<Map<String, String>> query() throws Exception
	{
		System.out.println("调用了EA0203的query方法");
		StringBuilder sql=new StringBuilder()
				.append("select a.aab102,a.aab103,b.aab1402,b.aab1403,")
				.append("		b.aab1405,b.aab1404,b.aab1407,b.aab1401 ")
				.append("	 from ab01 a,ab14 b ")
				.append("where a.aab101=b.aab101 ")
				.append("order by b.aab1407 ASC,b.aab1406 DESC")
				;
		return this.queryForList(sql.toString());
	}
}
