package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.catalina.startup.Tool;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class EC0101ServicesImpl extends JdbcServicesSupport 
{
    public boolean write()throws Exception
    {
    	//由编号获取流水号
    	
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ac01(aae101,aac102,aac103,aac104,aac105)")
    			.append(" values(?,?,?,?,?)");
    	//2.编写参数数组
    	
    	Object args[]={
    			this.get("user"),
    			this.get("aac102"),
    			this.get("aac103"),
    			"1",
    			this.get("aac105")
    	};
    	//System.out.println(sql.toString());
    	boolean tag = this.executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "添加新的教学日志";
			String remark = "添加成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
    }
	
    private boolean modifyJournal()throws Exception
    {
    	
    	StringBuilder sql=new StringBuilder()
    			.append("update ac01")
    			.append("   set aac102=?,aac103=?,aac105=?")
    			.append(" where aac101=? ")
    			;
    	Object args[]={
    			this.get("aac102"),
    			this.get("aac103"),
    			this.get("aac105"),
    			this.get("aac101")
    	};
    	System.out.println(this.get("aac101"));
    	 boolean tag = this.this.executeUpdate(sql.toString(), args)>0;
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content =  "修改流水号为[ "+this.get("aac101")+" ]的教学日志";
				String remark = "修改成功";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag;
    }
    
    public Map<String,String> findById()throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aac102,a.aac103,a.aac105,b.aae103")
    			.append("  from ac01 a,ae01 b")
    			.append(" where a.aac101=? and a.aae101=b.aae101")
    			;
    	System.out.println("3");
		//System.out.println(sql.toString());
    	//执行查询
    	return this.queryForMap(sql.toString(),this.get("aac101"));
    }
    
    /**
	* 不定条件查询
	* @return
	* @throws Exception
	*/
	public List<Map<String,String>> query()throws Exception
	{
	  	//还原页面查询条件
		Object aae103=this.get("qaae103");     //教师编号
		Object aae102=this.get("qaae102");     //教师姓名
		Object qaac102=this.get("qaac102");     //开始日期
		Object paac102=this.get("paac102");     //结束日期
		//定义SQL主体
		StringBuilder sql=new StringBuilder()
				.append("select y.aae102,y.aae103,x.aac102,x.aac104,x.aac101")
				.append("  from ac01 x, ae01 y")
				.append(" where x.aae101=y.aae101 ")
				;
		//System.out.println("1");
		//参数列表
		List<Object> paramList=new ArrayList<>();
		//逐一判断查询条件是否录入,拼接AND条件
		
		if(this.isNotNull(aae103))
		{
			sql.append(" and y.aae103=?");
			paramList.add(aae103);
		}
		if(this.isNotNull(aae102))
		{
			sql.append(" and y.aae102 like ?");
			paramList.add("%"+aae102+"%");
		}
		if(this.isNotNull(qaac102))
		{
			sql.append(" and x.aac102>=?");
			paramList.add(qaac102);
		}	
		if(this.isNotNull(paac102))
		{
			sql.append(" and x.aac102<=?");
			paramList.add(paac102);
		}
		sql.append(" order by x.aac102");
		return this.queryForList(sql.toString(), paramList.toArray());
	}
}