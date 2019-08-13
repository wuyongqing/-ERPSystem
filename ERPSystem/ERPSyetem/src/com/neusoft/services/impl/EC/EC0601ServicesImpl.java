package com.neusoft.services.impl.EC;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Date;
import java.text.SimpleDateFormat;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;

public class EC0601ServicesImpl extends JdbcServicesSupport 
{
	public boolean deleteById()throws Exception
    {
		//编写SQL语句
    	String sql="delete from ac07 where aac701=?";
    	//System.out.println("1");
    	//执行
    	boolean tag =this.executeUpdate(sql, this.get("aac701"))>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "删除流水号为[ "+this.get("aac701")+" ]的课题";
			String remark = "删除成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
    }
    
    private boolean modifySubject()throws Exception
    {
    	String sql1="select aae101 from ae01 where aae103=?";
    	Map<String, String> aMap=this.queryForMap(sql1, this.get("aae103"));
    	//编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("update ac07 ")
    			.append("   set aae101=?,aac702=?,aac703=?,aac704=?,aac705=?,")
    			.append("       aac706=?,aac707=?")
    			.append(" where aac701=?")
    			;
    	//编写参数数组
    	Object args[]={
    			aMap.get("aae101"),
    			Tools.getSubjectNumber(),
    			this.get("aac703"),
    			this.get("aac704"),
    			1,
    			this.get("aac706"),
    			this.get("aac707"),
    			this.get("aac701")
    	};
    	//执行
    	 boolean tag =this.executeUpdate(sql.toString(), args)>0;
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "修改流水号为[ "+this.get("aac701")+" ]的课题信息";
				String remark = "修改成功";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag;
    }
    
    public boolean addSubject()throws Exception
    {  
    	//获取负责人编号
    	String sql1="select aae101 from ae01 where aae103=?";
    	Map<String, String> aMap=this.queryForMap(sql1, this.get("aae103"));
    	//获取课题编号
    	
//    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ac07(aae101,aac702,aac703,aac704,aac705,")
    			.append("                 aac706,aac707)")
    			.append("          values(?,?,?,?,?,")
    			.append("                 ?,?)")
    			;
    	//2.编写参数数组
    	Object args[]={
    			aMap.get("aae101"),
    			Tools.getSubjectNumber(),
    			this.get("aac703"),
    			this.get("aac704"),
    			"1",
    			this.get("aac706"),
    			this.get("aac707")
    	};
        boolean tag = this.executeUpdate(sql.toString(), args)>0;	
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "添加新的课题";
			String remark = "添加成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
    }

    //单一实例查询    
    public Map<String,String> findById()throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("select b.aae103,a.aac703,aac704,aac706,aac707")
    			.append("  from ac07 a,ae01 b")
    			.append(" where aac701=? and a.aae101=b.aae101")
    			;
    	//执行查询
    	return this.queryForMap(sql.toString(), this.get("aac701"));
    }
    
    
	/**
	* 不定条件查询
	* @return
	* @throws Exception
	*/
	public List<Map<String,String>> query()throws Exception
	{
	  	//还原页面查询条件
		Object aae103=this.get("aae103");     //负责人编号
		Object aae102=this.get("aae102");     //负责人姓名
		Object aac702=this.get("aac702");     //课题编号
		//定义SQL主体
		StringBuilder sql=new StringBuilder()
				.append("select a.aac701,b.aae103,a.aac702,a.aac703,a.aac704,")
				.append("       a.aac705,a.aac706,b.aae102")
				.append("  from ac07 a,ae01 b ")
				.append(" where a.aae101=b.aae101")
				;
		
		//参数列表
		List<Object> paramList=new ArrayList<>();
		//逐一判断查询条件是否录入,拼接AND条件
		
		if(this.isNotNull(aae103))
		{
			sql.append(" and aae103=?");
			paramList.add(aae103);
		}
		if(this.isNotNull(aae102))
		{
			sql.append(" and aae103 like ?");
			paramList.add("%"+aae102+"%");
		}
		if(this.isNotNull(aac702))
		{
			sql.append(" and aac702=?");
			paramList.add(aac702);
		}
		sql.append(" order by aac701");
		return this.queryForList(sql.toString(), paramList.toArray());
	}
}
