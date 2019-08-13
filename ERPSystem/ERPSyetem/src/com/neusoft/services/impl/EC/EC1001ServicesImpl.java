package com.neusoft.services.impl.EC;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;

/**
 * @author susheng
 * @date 2019年7月12日
 * @time 上午10:15:20
 * 经费申请服务实现类
 */
public class EC1001ServicesImpl extends JdbcServicesSupport 
{
	private boolean batchDelete() throws Exception
	{
		String sql = "delete from ac05 where aac501=?";
		String[] idlist = this.getIdList("idlist");
	    boolean tag =  this.batchUpdate(sql, idlist);
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "批量删除经费申请";
			String remark = "批量删除成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	private boolean cancelRequest() throws Exception
	{
		String sql= "update ac05 set aac505=1 where aac501=?";
		 boolean tag = this.executeUpdate(sql, this.get("uaac501"))>0;
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "撤销流水号为[ "+this.get("uaac501")+" ]的经费申请";
				String remark = "撤销成功";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag;
	}
	private boolean deleteById() throws Exception
	{
		String sql="delete from ac05 where aac501=?";
		 boolean tag = this.executeUpdate(sql, this.get("uaac501"))>0;
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "删除流水号为[ "+this.get("uaac501")+" ]的经费申请";
				String remark = "删除成功";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag;
	}
	private boolean modifyRequest() throws Exception
	{
		double number = Double.parseDouble(this.get("aac503").toString());
		if(number>99999999.99)
		{
			return false;
		}
		StringBuilder sql = new StringBuilder()
				.append("update ac05 set aac502=?, aac503=?, aac504=? ,aac505=?, aac506=?,aac508=?")
				.append("  where aac501= ?");
		Object [] args= {
				this.get("aac502"),
				number,
				new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()),
				"1",
				this.get("aac506"),
				this.get("aac501"),
				this.get("aac508")
		};
		 boolean tag =executeUpdate(sql.toString(), args)>0;
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "修改流水号为[ "+this.get("uaac501")+" ]的经费申请";
				String remark = "修改成功";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag;
	}
	public Map<String,String> findById() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select a.aac501,a.aac502,a.aac503,a.aac504,a.aac508,")
				.append(" c.fvalue,a.aac506,a.aac507,b.aae102,b.aae103")
				.append("  from ac05 a,ae01 b,syscode c")
				.append("  where c.fname='aac505' and c.fcode=a.aac505")
				.append("  and a.aac501=?");
		return this.queryForMap(sql.toString(), this.get("uaac501"));
		
	}
	private boolean addRequest() throws Exception
	{
		double number = Double.parseDouble(this.get("aac503").toString());
		if(number>99999999.99)
		{
			return false;
		}
			StringBuilder sql2 = new StringBuilder()
					.append("insert into ac05 (aac502,aac503,aac504,aac505,aac506,aac507,aac508,aae101)")
					.append("  values(?,?,?,2,?,0,?,?)");
			Object args2[]= {
					this.get("aac502"),
					number,
					new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()),
					this.get("aac506"),
					this.get("aac508"),
					this.get("user")
			};
			 boolean tag = this.executeUpdate(sql2.toString(), args2)>0;
				if(tag==true)
				{
					EA0801ServicesImpl service = new EA0801ServicesImpl();
					String content = "添加新的经费申请";
					String remark = "添加成功";
					service.addWorkRecord(content, this.get("user"), remark);
				}
				return tag;
	}
     public List<Map<String,String>> query() throws Exception
     {
    	 Object qaac508 = this.get("qaac508");
    	 Object baac504 = this.get("baac504");
    	 Object eaac504 = this.get("eaac504");
    	 Object qaac505 = this.get("qaac505");
    	 StringBuilder sql = new StringBuilder()
    			 .append("select a.aac501, b.aae102,b.aae103,a.aac503,a.aac504,a.aac505,a.aac508,c.fvalue,d.fvalue type ")
    			 .append("  from ac05 a, ae01 b,syscode c,syscode d")
    			 .append("  where a.aae101=b.aae101")
    			 .append("  and c.fname='aac505' and c.fcode= a.aac505")
    	         .append("  and d.fname='aac508' and d.fcode= a.aac508")
    	         .append("  and a.aae101=?");
    	  List<Object> paramlist =new ArrayList<>();
    	  paramlist.add(this.get("user"));
    	  if(this.isNotNull(qaac508))
    	  {
    		  sql.append(" and a.aac508=?");
    		  paramlist.add(qaac508);
    	  }
    	  if(this.isNotNull(baac504))
    	  {
    		  sql.append(" and a.aac504 >=?");
    		  paramlist.add(baac504);
    	  }
    	  if(this.isNotNull(eaac504))
    	  {
    		  sql.append(" and a.aac504 <=?");
    		  paramlist.add(eaac504);
    	  }
    	  if(this.isNotNull(qaac505))
    	  {
    		  sql.append(" and a.aac505=?");
    		  paramlist.add(qaac505);
    	  }
    	      sql.append(" order by a.aac505 ASC,a.aac504");
    	 return this.queryForList(sql.toString(), paramlist.toArray());
     }
}
