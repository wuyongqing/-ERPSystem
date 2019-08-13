package com.neusoft.services.impl.ED;

import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;

public class ED04ServicesImpl extends EDServicesSupport 
{
	@Override
	public boolean update(String utype) throws Exception
	{
		if(utype.equalsIgnoreCase("delClassRecordsById"))
		{
			return this.delClassRecordsById();
		}
		else if(utype.equalsIgnoreCase("addChangeClassRec"))
		{
			return this.addChangeClassRec();
		}
		else
		{
			throw new Exception("在ED04ServicesImpl中调用了未定义的方法:["+utype+"]");
		}
	}

	private boolean addChangeClassRec()throws Exception
	{
		Map<String, String> ins=this.findStuNotById();
		Object args1[]={this.get("aab402")};
		Map<String, String> ins1=this.ifClassExist(args1);
		if(!ins1.get("ae0_aae101").equals(this.get("user")))
		{
			return false;
		}
		Object args2[]={this.get("aab403")};
		Map<String, String> ins2=this.ifClassExist(args2);
		if(ins==null || ins2==null)
		{
			return false;
		}
		StringBuilder sql=new StringBuilder()
				.append("INSERT INTO ab04 ")
				.append("(aab101, aab402, aab403, aab404,")
				.append(" aab405, aab406, aab407) ")
				.append("VALUES ( ?, ?, ?, ?, ?, now(), 1)")
				;
		Object args[]={
    			ins.get("aab101"),
    			ins1.get("aab301"),
    			ins2.get("aab301"),
    			this.get("aab404"),
    			this.get("aab405"),
    	};
		boolean tag = this.executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "为流水号为[ "+ins.get("aab101")+" ]的学生提交班级变更申请";
			String remark = "提交班级变更申请成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	

	public boolean delClassRecordsById() throws Exception
	{
		String sql="delete from ab04 where aab401=?";
		boolean tag = this.executeUpdate(sql, this.get("aab401"))>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "取消流水号为[ "+this.get("aab401")+" ]的班级变更申请";
			String remark = "取消班级变更申请成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	public List<Map<String, String>> query() throws Exception
	{
		System.out.println("调用了ED04的query方法");
		StringBuilder sql=new StringBuilder()
				.append("select a.aab102,a.aab103,b.aab402,b.aab403,")
				.append("		b.aab405,b.aab406,b.aab407,b.aab401,")
				.append("		c1.aab303 faab303,c2.aab303 saab303 ")
				.append("	 from ab01 a,ab04 b,ab03 c1,ab03 c2 ")
				.append("where a.aab101=b.aab101 ")
				.append("and b.aab402=c1.aab301 and b.aab403=c2.aab301 ")
				.append(" and c1.ae0_aae101=? ")
				.append(" order by b.aab407 ASC,b.aab406 DESC")
				;
		Object args[]={
    			this.get("user")
    	};
		return this.queryForList(sql.toString(), args);
	}
}
