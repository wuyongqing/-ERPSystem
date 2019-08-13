package com.neusoft.services.impl.EB;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;
import com.neusoft.system.tools.Tools;

/**
 * @author susheng
 * @date 2019年7月13日
 * @time 上午9:51:49
 * 经费拨出及结算服务类
 */
public class EB0201ServicesImpl extends JdbcServicesSupport
{
	public List<Map<String,String>> querySub() throws Exception
	{
	 Object aac501= this.get("uaac501");
   	 Object qaad101 = this.get("qaad101");
   	 Object baad105 = this.get("baad105");
   	 Object eaad105 = this.get("eaad105");
   	 StringBuilder sql2 = new StringBuilder()
   			 .append("select a.aad101, a.aad103, a.aad104, a.aad105, a.aad106, ")
   			 .append(" b.aae101, b.aae102 , c.fvalue ")
   			 .append("  from ad01 a ,ae01 b,syscode c,ac05 d,ad04 e")
   			 .append("  where b.aae101 = a.aae101 ")
   			 .append("  and c.fname='aad102' and c.fcode=a.aad102")
   			 .append("  and e.aac501=d.aac501 and e.aad101 = a.aad101")
   			 .append("  and d.aac501=?");
   			
   	 List<Object> paramlist = new ArrayList<>();
   	    paramlist.add(aac501);
   	 if(this.isNotNull(baad105))
   	 {
   		   sql2.append(" and a.aad105>= ?");
   		   paramlist.add(baad105);
   	 }
   	 if(this.isNotNull(eaad105))
   	 {
   		   sql2.append(" and a.aad105<= ?");
   		   paramlist.add(eaad105);
   	 }
   	 return this.queryForList(sql2.toString(), paramlist.toArray());
	}
	private boolean give() throws Exception
	{
		String sql1 = "update ac05 set aac505=5,aac507=2 where aac501=?";
		this.appendSql(sql1, this.get("uaac501"));
		String sql = "select fvalue type from syscode where fname='aac508' and fcode=?";
		Map<String,String> ins =this.queryForMap(sql, this.get("aac508"));
		StringBuilder sql2 = new StringBuilder()
				.append("insert into ad03 (aad306, ad0_aae101,aad302,aad303,aad304,aad307,aad308,aad309)")
				.append(  "values(?,?,?,?,?,?,?,?)");
		Object[] args2= {
				this.get("aae101"),
				this.get("user"),
				ins.get("type"),
				this.get("aad303"),
				new SimpleDateFormat("yy-MM-dd HH:mm:ss").format(new java.util.Date()),
				"1",
				"0",
				"0"
		};
		this.appendSql(sql2.toString(), args2);
		StringBuilder sql3 = new StringBuilder()
				.append("insert into ad01 (aad101,aae101,aad102,aad103,aad104,aad105,aad106)")
				.append(" values(?,?,?,?,?,?,?)");
		int aad101 = Tools.getSequence("aad101");
		Object[] args3= {
				aad101,
				this.get("user"),
				1,
				this.get("aad303"),
				"经费拨出",
				new SimpleDateFormat("yy-MM-dd").format(new java.util.Date()),
				"请记录使用记录以结算"
		};
		this.appendSql(sql3.toString(), args3);
		//同步经费及其使用及记录
		String sql4 = "insert into ad04 (aac501,aad101) values(?,?)";
		Object[] args4= {
				this.get("uaac501"),
				aad101
		};
		this.appendSql(sql4, args4);
		 boolean tag = this.executeTransaction();
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "为流水号为[ "+this.get("uaac501")+" ]的经费申请拨款";
				String remark = "拨款成功";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag;
				       
	}
	private boolean end() throws Exception
	{
		String sql = "update ac05 set aac505=6,aac507=4 where aac501=?";
		String sql1 ="select aad101 from ad04 where aac501=?";
		List<Map<String,String>> rows = this.queryForList(sql1, this.get("uaac501"));
		List<String> temps = new ArrayList<>();
		for(Map<String,String>ins : rows)
		{
			temps.add(ins.get("aad101"));
		}
		int length= temps.size();
		String sql2 = "select aad103 profie from ad01 where aad102=1 and aad101=?";
		String sql3 = "select aad103 cost from ad01 where aad102>1 and aad101=?";
		int profies=0;
		int costs = 0;
		Map<String,String> profie = new HashMap<>();
		Map<String,String> cost = new HashMap<>();
		for(int i=0;i<length;i++)
		{	
			profie = this.queryForMap(sql2, temps.get(i));
			cost    = this.queryForMap(sql3, temps.get(i));
			if(this.isNotNull(profie))
			{
				profies += Double.parseDouble(profie.get("profie"));
			}
			if(this.isNotNull(cost))
			{
				costs +=Double.parseDouble(cost.get("cost"));
			}
		}
		int last = profies-costs;
		StringBuilder sql4 = new StringBuilder()
				.append("insert into ad03 (aad306, ad0_aae101,aad302,aad303,aad304,aad307,aad308,aad309)")
				.append(  "values(?,?,?,?,?,?,?,?)");
		Object[] args={
				this.get("aae101"),
				this.get("user"),
				"经费结余",
				last>0?last:0,
				new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()),
			    "1",
			    "0",
			    "1"
			};
		this.appendSql(sql, this.get("uaac501"));
		this.appendSql(sql4.toString(), args);
		 boolean tag = this.executeTransaction();
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "为流水号为[ "+this.get("uaac501")+" ]的经费申请结算";
				String remark = "结算成功";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag;
	}
     public List<Map<String,String>> query() throws Exception
     {
    	 Object qaac508 = this.get("qaac508");
     	 Object qaae103 = this.get("qaae103");
     	 Object qaae102 = this.get("qaae102");
     	 Object baac504 = this.get("baac504");
     	 Object eaac504 = this.get("eaac504");
     	 Object qaac505 = this.get("qaac505");
     	 StringBuilder sql = new StringBuilder()
     			 .append("select a.aac501,b.aae101,b.aae102,b.aae103,a.aac503,a.aac504,")
     			 .append("  a.aac505,c.fvalue,d.fvalue value2,a.aac507,aac508")
     			 .append("  from ac05 a, ae01 b,syscode c,syscode d")
     			 .append("  where a.aae101=b.aae101 and a.aac505>3")
     			 .append("  and c.fname='aac505' and c.fcode= a.aac505")
     			 .append("  and d.fname='aac508' and d.fcode= a.aac508");
     	  List<Object> paramlist =new ArrayList<>();
     	  if(this.isNotNull(qaac508))
     	  {
     		  sql.append(" and a.aac508=?");
     		  paramlist.add(qaac508);
     	  }
     	  if(this.isNotNull(qaae103))
     	  {
     		  sql.append(" and b.aae103=?");
     		  paramlist.add(qaae103);
     	  }
     	  if(this.isNotNull(qaae102))
     	  {
     		  sql.append(" and b.aae102=?");
     		  paramlist.add(qaae102);
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
     	      sql.append("  order by a.aac505 ASC,a.aac504");
     	 return this.queryForList(sql.toString(), paramlist.toArray());
     }
     public Map<String,String> findByIdSub() throws Exception
     {
    	 StringBuilder sql= new StringBuilder()
 				.append("select a.aad101,a.aad102,a.aad103,a.aad104, ")
 				.append("  a.aad105, a.aad106,b.aae102")
 				.append(" from ad01 a,ae01 b where a.aae101=b.aae101 and a.aad101 = ?");
 		return this.queryForMap(sql.toString(), this.get("aad101"));
     }
     public Map<String,String> findById() throws Exception
     {
    	 StringBuilder sql = new StringBuilder()
   				.append("select a.aac501,a.aac502,a.aac503,a.aac504,a.aac505,")
   				.append("  c.fvalue,d.fvalue type,a.aac506,b.aae102,b.aae103")
   				.append("  from ac05 a,ae01 b,syscode c,syscode d")
   				.append("  where c.fname='aac505' and c.fcode=a.aac505")
   				.append("  and d.fname='aac508' and d.fcode= a.aac508")
   				.append("  and a.aac501=?");
   		return this.queryForMap(sql.toString(), this.get("uaac501"));
     }
}
