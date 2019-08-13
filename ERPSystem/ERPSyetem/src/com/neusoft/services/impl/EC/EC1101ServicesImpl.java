package com.neusoft.services.impl.EC;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;
import com.neusoft.system.tools.Tools;

/**
 * @author susheng
 * @date 2019年7月10日
 * @time 下午4:18:39
 * 教研底稿管理
 */
public class EC1101ServicesImpl extends JdbcServicesSupport 
{
	public boolean batchDelete()throws Exception
	{
		String sql="delete from ac09 where aac901=?";
	    String[] idlist = this.getIdList("idlist");
	    boolean tag =  this.batchUpdate(sql, idlist);
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "批量删除教研底稿";
			String remark = "批量删除成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	private boolean modifyDraft() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("update ac09 a set a.aac902=? , a.aac903=?,")
				.append(" a.aac904=? where a.aac901=?");
		Object[] args= {
				new SimpleDateFormat("yyyy-MM-dd hh-mm-ss").format(new java.util.Date()),
				this.get("aac903"),
				this.get("aac904"),
				this.get("aac901")
		};
		 boolean tag =this.executeUpdate(sql.toString(), args)>0;
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "修改流水号为[ "+this.get("aac901")+" ]的教研底稿";
				String remark = "修改成功";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag;
	}
	private boolean delById () throws Exception
	{
		Object aac901 = this.get("aac901");
		String sql = "delete from ac09 where aac901=?";
		boolean tag =this.executeUpdate(sql, aac901)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "删除流水号为[ "+this.get("aac901")+" ]的教研底稿";
			String remark = "删除成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	public Map<String,String> findById()throws Exception
	{
		//1.编写SQL语句
		StringBuilder sql=new StringBuilder()
				.append(" select a.aac901,DATE_FORMAT(a.aac902,'%Y-%m-%d %T') aac902,b.aae102,b.aae103,a.aac903,a.aac904 ")
				.append("   from ac09 a,ae01 b")
				.append("   where a.aae101 = b.aae101")
		        .append("   and a.aac901=?");
    	
    	return this.queryForMap(sql.toString(), this.get("aac901"));
	}
	public List<Map<String,String>> query()throws Exception
	{
		Object aac904 = this.get("qaac904");
		Object baac902 = this.get("baac902");
		Object eaac902 = this.get("eaac902");
		StringBuilder sql=new StringBuilder()
				.append(" select a.aac901,DATE_FORMAT(a.aac902,'%Y-%m-%d %T') aac902,a.aae101,b.aae102,a.aac903,a.aac904 ")
				.append("   from ac09 a,ae01 b")
				.append("   where a.aae101 = b.aae101")
				.append("   and a.aae101=?");
		List<Object> paramlist = new ArrayList<>();
		paramlist.add(this.get("user"));
		if(this.isNotNull(aac904))
		{
			sql.append(" and a.aac904 like ?");
			paramlist.add(" %"+aac904+"%");
		}
		if(this.isNotNull(baac902))
		{
			sql.append(" and a.aac902 >= ?");
			paramlist.add(baac902);
		}
		if(this.isNotNull(eaac902))
		{
			sql.append(" and a.aac902 <= ?");
			paramlist.add(eaac902);
		}
		return  this.queryForList(sql.toString(), paramlist.toArray());
	}
	
	private boolean addDraft() throws Exception
    {
    		String sql1 ="insert into ac09 (aae101,aac902,aac903,aac904) values(?,?,?,?)";
        	Object[] args1= {
        			this.get("user"),
        			new SimpleDateFormat("yyyy-MM-dd hh-mm").format(new java.util.Date()),
        			this.get("aac903"),
        			this.get("aac904")
        	};
          boolean tag = this.executeUpdate(sql1, args1)>0;
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "添加新的教研底稿";
				String remark = "添加成功";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag;
    }
}
