package com.neusoft.services.impl.ED;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.impl.EA.EA0801ServicesImpl;

public class ED07ServicesImpl extends EDServicesSupport 
{
	@Override
	public boolean update(String utype) throws Exception 
	{
		if(utype.equalsIgnoreCase("addRewAndPunRecord"))
		{
			return addRewAndPunRecord();
		}
		else if(utype.equalsIgnoreCase("delRewAndPunById")) 
		{
			return this.delRewAndPunById();
		}
		else if(utype.equalsIgnoreCase("modifyRewAndPun")) 
		{
			return modifyRewAndPun();
		}
		else if(utype.equalsIgnoreCase("batchDelete"))
		{
			return batchDelete(); 
		}
		else
		{
			throw new Exception("在ED06ServicesImpl中调用了未定义的方法:["+utype+"]");
		}
	}
	
	public Map<String, String> findById() throws Exception
	{
		//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aab102, a.aab103, b.aab802,")
    			.append("       b.aab803, b.aab804, b.aab805 ")
    			.append("  from ab01 a, ab08 b")
    			.append(" where a.aab101=b.aab101 and b.aab801=?")
    			;
    	//执行查询
    	return this.queryForMap(sql.toString(), this.get("aab801"));
	}
	
	private boolean batchDelete() throws Exception
	{
		//1.定义SQL语句
    	String sql="delete from ab08 where aab801=?";
    	//2.获取页面idlist数组
    	String idlist[]=this.getIdList("idlist");
    	//3.执行
    	boolean tag = this.batchUpdate(sql, idlist);
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "批处理删除奖惩记录";
			String remark = "批处理删除奖惩记录成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	private boolean delRewAndPunById() throws Exception
	{
		String sql="delete from ab08 where aab801=?";
		boolean tag = this.executeUpdate(sql, this.get("aab801"))>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "删除流水号为[ "+this.get("aab801")+" ]的奖惩记录";
			String remark = "删除奖惩记录成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	private boolean modifyRewAndPun() throws Exception
	{
		StringBuilder sql=new StringBuilder()
    			.append("update ab08 a")
    			.append("   set a.aab802=?,a.aab803=?,a.aab804=?,a.aab805=?")
    			.append(" where a.aab801=?")
    			;
    	Object args[]={
    			this.get("aab802"),
    			this.get("aab803"),
    			this.get("aab804"),
    			this.get("aab805"),
    			this.get("aab801")
    	};
		boolean tag = this.executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "修改流水号为[ "+this.get("aab801")+" ]的奖惩记录";
			String remark = "修改奖惩记录成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	public List<Map<String,String>> query()throws Exception
	{
		//还原页面查询条件
		Object aab102=this.get("qaab102");       //姓名  模糊查询
  		Object aab103=this.get("qaab103");     	 //学号
  		Object qaab802=this.get("qaab802");      //奖惩性质
  		Object qaab803=this.get("qaab803");      //奖惩内容 模糊查询
  		Object baab805=this.get("baab805");      //日期B
  		Object eaab805=this.get("eaab805");      //日期E
  		Object aae101=this.get("user");    	 //教师流水号
  		
  		//定义SQL主体
  		StringBuilder sql=new StringBuilder()
  				.append("select a.aab101, a.aab102, a.aab103, b.aab801, ")
  				.append("b.aab802, b.aab803, b.aab804, b.aab805, b.aab806 ")
  				.append("  from ab01 a, ab08 b, ab03 c")
  				.append(" where a.aab101=b.aab101 and a.aab111=c.aab301 ")
  				;
  		
  		//参数列表
  		List<Object> paramList=new ArrayList<>();
  		//逐一判断查询条件是否录入,拼接AND条件
  		if(this.isNotNull(aae101))
  		{
  			sql.append(" and c.ae0_aae101 =? ");
  			paramList.add(aae101);
  		}
  		if(this.isNotNull(aab102))
  		{
  			sql.append(" and a.aab102 like ? ");
  			paramList.add("%"+aab102+"%");
  		}
  		if(this.isNotNull(aab103))
  		{
  			sql.append(" and a.aab103=? ");
  			paramList.add(aab103);
  		}
  		if(this.isNotNull(qaab802))
  		{
  			sql.append(" and b.aab802=? ");
  			paramList.add(qaab802);
  		}
  		if(this.isNotNull(qaab803))
  		{
  			sql.append(" and b.aab803 like ? ");
  			paramList.add("%"+qaab803+"%");
  	  		System.out.println(qaab803.toString());
  		}
  		if(this.isNotNull(baab805))
  		{
  			sql.append(" and b.aab805>=?");
  			paramList.add(baab805);
  		}
  		if(this.isNotNull(eaab805))
  		{
  			sql.append(" and b.aab805<=?");
  			paramList.add(eaab805);
  		}
  		
  		sql.append(" order by b.aab806 desc");
  		return this.queryForList(sql.toString(), paramList.toArray());
	}
  
	
	private boolean addRewAndPunRecord() throws Exception
	{
		Map<String, String> ins=findStuNotById();
		if(ins==null)
		{
			return false;
		}
		StringBuilder sql=new StringBuilder()
				.append("INSERT INTO ab08 (aab101, aab802, aab803, aab804, aab805 ,aab806) ")
				.append("VALUES (?, ?, ?, ?, ?, now())")
				;
		Object[] args={
			ins.get("aab101"),
			this.get("aab802"),
			this.get("aab803"),
			this.get("aab804"),
			this.get("aab805")
		};
		boolean tag = executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "为流水号为[ "+ins.get("aab101")+" ]的学生提交了奖惩记录";
			String remark = "提交奖惩记录成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
}
