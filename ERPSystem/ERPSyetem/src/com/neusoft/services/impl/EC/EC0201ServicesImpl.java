package com.neusoft.services.impl.EC;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Date;
import java.text.SimpleDateFormat;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;

public class EC0201ServicesImpl extends JdbcServicesSupport 
{
	public boolean deleteById()throws Exception
    {
		//编写SQL语句
    	String sql="delete from ab06 where aab601=?";
    	//System.out.println("1");
    	boolean tag =this.executeUpdate(sql, this.get("aab601"))>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "删除流水号为[ "+this.get("aab601")+" ]的考试信息";
			String remark = "删除成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
    }
    
    private boolean modifyExam()throws Exception
    {
    	String sql1="select aab301 from ab03 where aab303=?";
    	Map<String, String> a=this.queryForMap(sql1.toString(), this.get("aab303"));
    	//编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("update ab06")
    			.append("   set aab301=?,aab603=?,aab604=?,aab605=?,aab606=?,")
    			.append("       aab607=?,aab608=?")
    			.append(" where aab601=?")
    			;
    	//编写参数数组
    	String aab607=Tools.getCurrentDate();
    	Object args[]={
    			a.get("aab301"),
    			this.get("aab603"),
    			this.get("aab604"),
    			this.get("aab605"),
    			this.get("aab606"),
    			aab607,
    			this.get("aab608"),
    			this.get("aab601")
    	};
    	//执行
    	boolean tag =this.executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "修改流水号为[ "+this.get("aab601")+" ]的考试信息";
			String remark = "修改成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
    	
    }
    
    public boolean addExam()throws Exception
    {    	
    	String sql1="select aab301 from ab03 where aab303=?";
    	Map<String, String> a=this.queryForMap(sql1.toString(), this.get("aab303"));
    	
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ab06(aab301,aab602,aab603,aab604,aab605,")
    			.append("                 aab606,aab607,aab608)")
    			.append("          values(?,?,?,?,?,")
    			.append("                 ?,current_timestamp,?)")
    			;
    	//2.编写参数数组
    	Object args[]={
    			a.get("aab301"),
    			Tools.getExamNumber(),
    			this.get("aab603"),
    			this.get("aab604"),
    			this.get("aab605"),
    			this.get("aab606"),
    			this.get("aab608")
    	};
        boolean tag = this.executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "添加新的考试信息";
			String remark = "添加成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
    }

    private boolean batchDelete()throws Exception
    {
    	//1.定义SQL语句
    	String sql="delete from ab06 where aab601=?";
    	//2.获取页面idlist数组
    	String idlist[]=this.getIdList("idlist");
    	//3.执行
    	boolean tag =  this.batchUpdate(sql, idlist);
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "批量删除考试";
			String remark = "批量删除成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
    }

    
    
    public Map<String,String> findById()throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("select b.aab303,a.aab603,a.aab604,a.aab605,a.aab606,")
    			.append("       a.aab607,a.aab608")
    			.append("  from ab06 a,ab03 b")
    			.append(" where a.aab601=? and a.aab301=b.aab301")
    			;
    	//执行查询
    	return this.queryForMap(sql.toString(), this.get("aab601"));
    }
    
    
	/**
	* 不定条件查询
	* @return
	* @throws Exception
	*/
	public List<Map<String,String>> query()throws Exception
	{
	  	//还原页面查询条件
		
		Object aab303=this.get("qaab303");     //班级编号
		Object aab602=this.get("qaab602");     //考试编号
		Object qaab603=this.get("qaab603");    //开始日期
		Object paab603=this.get("paab603");    //结束日期
		Object aab604=this.get("qaab604");     //开始时间
		Object aab605=this.get("qaab605");     //结束时间
		//定义SQL主体
		StringBuilder sql=new StringBuilder()
				.append("select x.aab601,x.aab301,x.aab602,x.aab603,x.aab604,")
				.append("       x.aab605,x.aab606,x.aab608,y.aab303")
				.append("  from ab06 x,ab03 y")
				.append(" where x.aab301=y.aab301 ")
				;
		
		//参数列表
		List<Object> paramList=new ArrayList<>();
		//逐一判断查询条件是否录入,拼接AND条件
		
		if(this.isNotNull(aab303))
		{
			sql.append(" and y.aab303=?");
			paramList.add(aab303);
		}
		if(this.isNotNull(aab602))
		{
			sql.append(" and x.aab602=?");
			paramList.add(aab602);
		}
		if(this.isNotNull(qaab603))
		{
			sql.append(" and x.aab603>=?");
			paramList.add(qaab603);
		}
		if(this.isNotNull(paab603))
		{
			sql.append(" and x.aab603<=?");
			paramList.add(paab603);
		}
		if(this.isNotNull(aab604))
		{
			sql.append(" and x.aab604>=?");
			paramList.add(aab604);
		}
		if(this.isNotNull(aab605))
		{
			sql.append(" and x.aab605<=?");
			paramList.add(aab605);
		}
		
		sql.append(" order by x.aab603");
		return this.queryForList(sql.toString(), paramList.toArray());
	}
}
