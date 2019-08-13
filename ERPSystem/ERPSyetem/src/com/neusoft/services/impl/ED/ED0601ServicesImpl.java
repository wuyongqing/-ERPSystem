package com.neusoft.services.impl.ED;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;

/**
 * @author susheng
 * @date 2019年7月16日
 * @time 下午6:37:27
 */
public class ED0601ServicesImpl extends JdbcServicesSupport
{
	public Map<String,String> findByIdSub() throws Exception
	{
		Map<String,String> data = new HashMap<>();
		Map<String,String> ins = new HashMap<>();
		Object year1 = this.get("year1");
		String season1=year1+"-01-01 00:00:00";
		String season2=year1+"-04-01 00:00:00";
		String season3=year1+"-07-01 00:00:00";
		String season4=year1+"-10-01 00:00:00";
		String season5=(Integer.parseInt(year1.toString())+1)+"-01-01 00:00:00";
		StringBuilder sqly11 = new StringBuilder()
				.append(" select sum(aad303) scost1 from ad03")
				.append(" where aad309 = 0")
				.append(" and aad304>=? and aad304<?");
		StringBuilder sqly12 = new StringBuilder()
				.append(" select sum(aad303) sincome1 from ad03")
				.append(" where aad309 = 1")
				.append(" and aad304>=? and aad304<?");
		Object[] sargs1= {
				season1,
				season2
		};
		StringBuilder sqly21 = new StringBuilder()
				.append(" select sum(aad303) scost2 from ad03")
				.append(" where aad309 = 0")
				.append(" and aad304>=? and aad304<?");
		StringBuilder sqly22 = new StringBuilder()
				.append(" select sum(aad303) sincome2 from ad03")
				.append(" where aad309 = 1")
				.append(" and aad304>=? and aad304<?");
		Object[] sargs2= {
				season2,
				season3
		};
		StringBuilder sqly31 = new StringBuilder()
				.append(" select sum(aad303) scost3 from ad03")
				.append(" where aad309 = 0")
				.append(" and aad304>=? and aad304<?");
		StringBuilder sqly32 = new StringBuilder()
				.append(" select sum(aad303) sincome3 from ad03")
				.append(" where aad309 = 1")
				.append(" and aad304>=? and aad304<?");
		Object[] sargs3= {
				season3,
				season4
		};
		StringBuilder sqly41 = new StringBuilder()
				.append(" select sum(aad303) scost4 from ad03")
				.append(" where aad309 = 0")
				.append(" and aad304>=? and aad304<?");
		StringBuilder sqly42 = new StringBuilder()
				.append(" select sum(aad303) sincome4 from ad03")
				.append(" where aad309 = 1")
				.append(" and aad304>=? and aad304<?");
		Object[] sargs4= {
				season4,
				season5
		};
		String year01=year1+"-01-01 00:00:00";
		String year02=(Integer.parseInt(year1.toString())+1)+"-01-01 00:00:00";
		Object[] yargs= {
		      year01,
		      year02
		};
		StringBuilder ysql1 = new StringBuilder()
				.append("select sum(aad303) yscost")
				.append(" from ad03 ")
				.append(" where aad302='学费'")
				.append(" and (aad304>=? and aad304<?)");
		StringBuilder ysql2 = new StringBuilder()
				.append("select sum(aad303) ylcost")
				.append(" from ad03 ")
				.append(" where aad302='住宿费'")
				.append(" and aad304>=? and aad304<?");
		StringBuilder ysql3 = new StringBuilder()
				.append("select sum(aad303) yrcost")
				.append(" from ad03 ")
				.append(" where aad302='经费结余'")
				.append(" and aad304>=? and aad304<?");
		StringBuilder ysql4 = new StringBuilder()
				.append("select sum(aad303) ytcost")
				.append(" from ad03 ")
				.append(" where aad302='教研经费'")
				.append(" and aad304>=? and aad304<?");
		StringBuilder ysql5 = new StringBuilder()
				.append("select sum(aad303) yacost")
				.append(" from ad03 ")
				.append(" where aad302='活动经费'")
				.append(" and aad304>=? and aad304<?");
		StringBuilder ysql6 = new StringBuilder()
				.append("select sum(aad303) ybcost")
				.append(" from ad03 ")
				.append(" where aad302='后勤经费'")
				.append(" and aad304>=? and aad304<?");
		/******************季度数据查询 ************************/
		Object year2 = this.get("year2");
		Object season = this.get("season");
		//确定季度
		String date1="";
		String date2="";
		String date3="";
		String date4="";
		switch (season.toString()) {
		   case "1": date1+=year2+"-01-01 00:00:00";
		                 date2+=year2+"-02-01 00:00:00";
		                 date3+=year2+"-03-01 00:00:00";
		                 date4+=year2+"-04-01 00:00:00";
		                  break;
		   case "2": date1+=year2+"-04-01 00:00:00";
		   			     date2+=year2+"-05-01 00:00:00";
		   			     date3+=year2+"-06-01 00:00:00";
		   			     date4+=year2+"-07-01 00:00:00";
		   			     break;
		   case "3": date1+=year2+"-07-01 00:00:00";
		   				 date2+=year2+"-08-01 00:00:00";
		   				 date3+=year2+"-09-01 00:00:00";
		   				 date4+=year2+"-10-01 00:00:00";
           				 break;
		   case "4": date1+=year2+"-10-01 00:00:00";
		   				 date2+=year2+"-11-01 00:00:00";
		   				 date3+=year2+"-12-01 00:00:00";
		   				 date4+=(Integer.parseInt(year2.toString())+1)+"-01-01 00:00:00";
           				 break;
		}
		//查询每个季度内每月的支出与收入
		StringBuilder sql1 = new StringBuilder()
				.append(" select sum(aad303) cost1 from ad03")
				.append(" where aad309 = 0")
				.append(" and aad304>=? and aad304<?");
		StringBuilder sql11 = new StringBuilder()
				.append(" select sum(aad303) income1 from ad03")
				.append(" where aad309 = 1")
				.append(" and aad304>=? and aad304<?");
		Object[] args1= {
				date1,
				date2,
		};
		StringBuilder sql2 = new StringBuilder()		
				.append(" select sum(aad303) cost2 from ad03")
				.append(" where aad309 = 0")
				.append(" and aad304>=? and aad304<?");
		StringBuilder sql21 = new StringBuilder()		
				.append(" select sum(aad303) income2 from ad03")
				.append(" where aad309 = 1")
				.append(" and aad304>=? and aad304<?");
		Object[] args2= {
				date2,
				date3,
		};
		StringBuilder sql3 = new StringBuilder()
				.append(" select sum(aad303) cost3 from ad03")
				.append(" where aad309 = 0")
				.append(" and aad304>=? and aad304<?");
		StringBuilder sql31 = new StringBuilder()
				.append(" select sum(aad303) income3 from ad03")
				.append(" where aad309 = 1")
				.append(" and aad304>=? and aad304<?");
		Object[] args3= {
				date3,
				date4,
		};
		//查询不同类型的总费用
		StringBuilder sql41 = new StringBuilder()
				.append("select sum(aad303) scost")
				.append(" from ad03 ")
				.append(" where aad302='学费'")
				.append(" and (aad304>=? and aad304<?)");
		StringBuilder sql42 = new StringBuilder()
				.append("select sum(aad303) lcost")
				.append(" from ad03 ")
				.append(" where aad302='住宿费'")
				.append(" and aad304>=? and aad304<?");
		StringBuilder sql43 = new StringBuilder()
				.append("select sum(aad303) rcost")
				.append(" from ad03 ")
				.append(" where aad302='经费结余'")
				.append(" and aad304>=? and aad304<?");
		StringBuilder sql44 = new StringBuilder()
				.append("select sum(aad303) tcost")
				.append(" from ad03 ")
				.append(" where aad302='教研经费'")
				.append(" and aad304>=? and aad304<?");
		StringBuilder sql45 = new StringBuilder()
				.append("select sum(aad303) acost")
				.append(" from ad03 ")
				.append(" where aad302='活动经费'")
				.append(" and aad304>=? and aad304<?");
		StringBuilder sql46 = new StringBuilder()
				.append("select sum(aad303) bcost")
				.append(" from ad03 ")
				.append(" where aad302='后勤经费'")
				.append(" and aad304>=? and aad304<?");
		Object[] args4={
			date1,
			date4
		};
		/************将查询到的数据整合返回****************/
		ins = this.queryForMap(sqly11.toString(), sargs1);	
		data.put("scost1",ins.get("scost1"));
		ins = this.queryForMap(sqly12.toString(), sargs1);	
		data.put("sincome1",ins.get("sincome1"));
		ins = this.queryForMap(sqly21.toString(), sargs2);	
		data.put("scost2",ins.get("scost2"));
		ins = this.queryForMap(sqly22.toString(), sargs2);	
		data.put("sincome2",ins.get("sincome2"));
		ins = this.queryForMap(sqly31.toString(), sargs3);	
		data.put("scost3",ins.get("scost3"));
		ins = this.queryForMap(sqly32.toString(), sargs3);	
		data.put("sincome3",ins.get("sincome3"));
		ins = this.queryForMap(sqly41.toString(), sargs4);	
		data.put("scost4",ins.get("scost4"));
		ins = this.queryForMap(sqly42.toString(), sargs4);	
		data.put("sincome4",ins.get("sincome4"));
		
		ins = this.queryForMap(ysql1.toString(), yargs);
		data.put("yscost", ins.get("yscost"));
		ins = this.queryForMap(ysql2.toString(), yargs);
		data.put("ylcost", ins.get("ylcost"));
		ins = this.queryForMap(ysql3.toString(), yargs);
		data.put("yrcost", ins.get("yrcost"));
		ins = this.queryForMap(ysql4.toString(), yargs);
		data.put("ytcost", ins.get("ytcost"));
		ins = this.queryForMap(ysql5.toString(), yargs);
		data.put("yacost", ins.get("yacost"));
		ins = this.queryForMap(ysql6.toString(), yargs);
		data.put("ybcost", ins.get("ybcost"));
		
		ins = this.queryForMap(sql1.toString(), args1);	
		data.put("cost1",ins.get("cost1"));
		ins = this.queryForMap(sql2.toString(), args2);	
		data.put("cost2",ins.get("cost2"));
		ins = this.queryForMap(sql3.toString(), args3);	
		data.put("cost3",ins.get("cost3"));
		ins = this.queryForMap(sql11.toString(), args1);	
		data.put("income1",ins.get("income1"));
		ins = this.queryForMap(sql21.toString(), args2);	
		data.put("income2",ins.get("income2"));
		ins = this.queryForMap(sql31.toString(), args3);	
		data.put("income3",ins.get("income3"));
		
		ins = this.queryForMap(sql41.toString(), args4);
		data.put("scost", ins.get("scost"));
		ins = this.queryForMap(sql42.toString(), args4);
		data.put("lcost", ins.get("lcost"));
		ins = this.queryForMap(sql43.toString(), args4);
		data.put("rcost", ins.get("rcost"));
		ins = this.queryForMap(sql44.toString(), args4);
		data.put("tcost", ins.get("tcost"));
		ins = this.queryForMap(sql45.toString(), args4);
		data.put("acost", ins.get("acost"));
		ins = this.queryForMap(sql46.toString(), args4);
		data.put("bcost", ins.get("bcost"));
		return data;
	}
    public List<Map<String,String>> query() throws Exception
    {
    	Object baad304 = this.get("baad304");
        Object eaad304 = this.get("eaad304");
        Object qaad308 = this.get("qaad308");
    	StringBuilder sql =new StringBuilder()
    			.append("select a.aad301,a.aad302,a.aad303,DATE_FORMAT(a.aad304,'%Y-%m-%d %T') aad304,a.aad307,a.aad308,")
    			.append("  b.aab102 name,b.aab103 code,c.aae102 ")
    			.append("  from ad03 a,ab01 b,ae01 c ")
    			.append("  where a.aad307=2 and a.aad306= b.aab101 and a.ad0_aae101 = c.aae101");
    	List<Object> paramlist = new ArrayList<>();
    	if(this.isNotNull(baad304))
    	{
    		sql.append("  and a.aad304>=?");
    		paramlist.add(baad304);
    	}
    	if(this.isNotNull(eaad304))
    	{
    		sql.append("  and a.aad304<=?");
    		paramlist.add(eaad304);
    	}
    	if(this.isNotNull(qaad308))
    	{
    		sql.append("  and a.aad308 =?");
    		paramlist.add(qaad308);
    	}
    	sql.append("  union")
    	    .append("  select a.aad301,a.aad302,a.aad303,a.aad304,a.aad307,a.aad308,")
    	    .append("  b.aae102 name,b.aae103 code,c.aae102 ")
    		.append("  from ad03 a,ae01 b,ae01 c ")
    		.append("  where a.aad307=1 and a.aad306= b.aae101 and a.ad0_aae101 = c.aae101");
    	if(this.isNotNull(baad304))
    	{
    		sql.append("  and a.aad304>=?");
    		paramlist.add(baad304);
    	}
    	if(this.isNotNull(eaad304))
    	{
    		sql.append("  and a.aad304<=?");
    		paramlist.add(eaad304);
    	}
    	if(this.isNotNull(qaad308))
    	{
    		sql.append("  and a.aad308 =?");
    		paramlist.add(qaad308);
    	}
    	sql.append("  order by aad308,aad304");
    	return queryForList(sql.toString(), paramlist.toArray());
    }
    public Map<String,String> findById() throws Exception
    {
    	Object aad307= this.get("aad307");
    	String type=aad307.toString();
    	System.out.println(this.get("aad301"));
    	if(type.equals("1"))
    	{        
    		StringBuilder sql1 = new StringBuilder()
    		    .append("  select a.aad301,a.aad302,a.aad303,DATE_FORMAT(a.aad304,'%Y-%m-%d %T') aad304,a.aad307,a.aad308,")
    		    .append("  b.aae102 name,b.aae103 code,c.aae102 ")
     		    .append("  from ad03 a,ae01 b,ae01 c ")
     		    .append("  where a.aad307=1 and a.aad306= b.aae101 and a.ad0_aae101 = c.aae101")
     		    .append(" and a.aad301= ?");
    		return this.queryForMap(sql1.toString(), this.get("aad301"));	
    	}
    	else
    	{
    		StringBuilder sql2 = new StringBuilder()
    			.append("select a.aad301,a.aad302,a.aad303,a.aad304,a.aad307,a.aad308,")
				.append("  b.aab102 name,b.aab103 code,c.aae102 ")
				.append("  from ad03 a,ab01 b,ae01 c ")
				.append("  where a.aad307=2 and a.aad306= b.aab101 and a.ad0_aae101 = c.aae101")
				.append(" and a.aad301= ?");
    		return this.queryForMap(sql2.toString(), this.get("aad301"));	
    	}	
    }
    private boolean checkFundRecord() throws Exception
    {
    	String sql = "update ad03 set aad308=1 where aad301=?";
    	boolean tag = this.executeUpdate(sql, this.get("aad301"))>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "审查流水号为[ "+this.get("aad301")+" ]的资金收支记录";
			String remark = "审查成功";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
    }
}
