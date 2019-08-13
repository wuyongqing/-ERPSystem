package com.neusoft.services.impl.ED;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.impl.EA.EA0801ServicesImpl;
import com.neusoft.system.tools.Tools;

public class ED06ServicesImpl extends EDServicesSupport 
{
	@Override
	public boolean update(String utype) throws Exception 
	{
		if(utype.equalsIgnoreCase("addCertificateRecord"))
		{
			return addCertificateRecord();
		}
		else if(utype.equalsIgnoreCase("delCertificateById")) 
		{
			return this.delCertificateById();
		}
		else if(utype.equalsIgnoreCase("modifyCertificate")) 
		{
			return modifyCertificate();
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
    			.append("select a.aab102, a.aab103, b.aab1302,")
    			.append("       b.aab1303, b.aab1304, b.aab1305 ")
    			.append("  from ab01 a, ab13 b")
    			.append(" where a.aab101=b.aab101 and b.aab1301=?")
    			;
    	//执行查询
    	return this.queryForMap(sql.toString(), this.get("aab1301"));
	}
	
	private boolean batchDelete() throws Exception
	{
		//1.定义SQL语句
    	String sql="delete from ab13 where aab1301=?";
    	//2.获取页面idlist数组
    	String idlist[]=this.getIdList("idlist");
    	//3.执行
		boolean tag = this.batchUpdate(sql, idlist);
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "批处理删除证书发放记录";
			String remark = "批处理删除证书发放记录成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	private boolean delCertificateById() throws Exception
	{
		String sql="delete from ab13 where aab1301=?";
		boolean tag = this.executeUpdate(sql, this.get("aab1301"))>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "删除流水号为[ "+this.get("aab1301")+" ]的证书发放记录";
			String remark = "删除证书发放记录成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	private boolean modifyCertificate() throws Exception
	{
		StringBuilder sql=new StringBuilder()
    			.append("update ab13 a")
    			.append("   set a.aab1302=?,a.aab1303=?,a.aab1304=?,a.aab1305=?")
    			.append(" where a.aab1301=?")
    			;
    	Object args[]={
    			this.get("aab1302"),
    			this.get("aab1303"),
    			this.get("aab1304"),
    			this.get("aab1305"),
    			this.get("aab1301")
    	};
		boolean tag = this.executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "修改流水号为[ "+this.get("aab1301")+" ]的证书发放记录";
			String remark = "修改证书发放记录成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	public List<Map<String,String>> query()throws Exception
	{
		//还原页面查询条件
		Object aab102=this.get("qaab102");       //姓名  模糊查询
  		Object aab103=this.get("qaab103");     	 //学号
  		Object aab1302=this.get("qaab1302");     //证书名称 模糊查询
  		Object aab1304=this.get("qaab1304");     //发放单位 模糊查询
  		Object baab1303=this.get("baab1303");    //日期B
  		Object eaab1303=this.get("eaab1303");    //日期E
  		Object aae101=this.get("user");    	 //教师流水号
  		
  		//定义SQL主体
  		StringBuilder sql=new StringBuilder()
  				.append("select a.aab101, a.aab102, a.aab103, b.aab1301, ")
  				.append("b.aab1302, b.aab1303, b.aab1304, b.aab1305 ")
  				.append("  from ab01 a, ab13 b, ab03 c")
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
  			sql.append(" and a.aab102 like ?");
  			paramList.add("%"+aab102+"%");
  		}
  		if(this.isNotNull(aab103))
  		{
  			sql.append(" and a.aab103=?");
  			paramList.add(aab103);
  		}
  		if(this.isNotNull(aab1302))
  		{
  			sql.append(" and b.aab1302 like ? ");
  			paramList.add("%"+aab1302+"%");
  		}
  		if(this.isNotNull(aab1304))
  		{
  			sql.append(" and b.aab1304 like ? ");
  			paramList.add("%"+aab1304+"%");
  		}
  		if(this.isNotNull(baab1303))
  		{
  			sql.append(" and b.aab1303>=?");
  			paramList.add(baab1303);
  		}
  		if(this.isNotNull(eaab1303))
  		{
  			sql.append(" and b.aab1303<=?");
  			paramList.add(eaab1303);
  		}
  		
  		sql.append(" order by b.aab1303");
  		return this.queryForList(sql.toString(), paramList.toArray());
	}
  
	
	private boolean addCertificateRecord() throws Exception
	{
		Map<String, String> ins=findStuNotById();
		if(ins==null)
		{
			return false;
		}
		StringBuilder sql=new StringBuilder()
				.append("INSERT INTO ab13 (aab101, aab1302, aab1303, aab1304, aab1305) ")
				.append("VALUES (?, ?, ?, ?, ?)")
				;
		Object[] args={
			ins.get("aab101"),
			this.get("aab1302"),
			this.get("aab1303"),
			this.get("aab1304"),
			this.get("aab1305")
		};
		boolean tag = executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "为流水号为[ "+ins.get("aab101")+" ]的的学生添加证书发放记录";
			String remark = "添加证书发放记录成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
}
