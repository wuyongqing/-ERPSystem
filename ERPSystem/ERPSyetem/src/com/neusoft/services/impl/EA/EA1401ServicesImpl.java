package com.neusoft.services.impl.EA;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

/**
 * @author susheng
 * @date 2019年7月12日
 * @time 下午7:22:02
 * 经费审批服务类
 */
public class EA1401ServicesImpl extends JdbcServicesSupport 
{
	  private boolean agreeCFRequest() throws Exception
	  {
		  String sql= "update ac05 set aac505=4 ,aac507=1 where aac501=?";
		  boolean tag = this.executeUpdate(sql, this.get("uaac501"))>0;
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "通过流水号为[ "+this.get("uaac501")+" ]的经费申请";
				String remark = "操作成功";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag;
	  }
	  private boolean unAgreeCFRequest() throws Exception
	  {
		  String sql= "update ac05 set aac505=3 where aac501=?";
		  boolean tag = this.executeUpdate(sql, this.get("uaac501"))>0;
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "拒绝流水号为[ "+this.get("uaac501")+" ]的经费申请";
				String remark = "操作成功";
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
     			 .append("select a.aac501, b.aae102,b.aae103,a.aac503,a.aac504,a.aac505,a.aac508,c.fvalue,d.fvalue type ")
     			 .append("  from ac05 a, ae01 b,syscode c,syscode d")
     			 .append("  where a.aae101=b.aae101 and a.aac505<5 and a.aac505>1")
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
      public Map<String,String> findById()throws Exception
      {
    	  StringBuilder sql = new StringBuilder()
  				.append("select a.aac501,a.aac502,a.aac503,a.aac504,a.aac505,")
  				.append(" c.fvalue,d.fvalue type,a.aac506,a.aac508,b.aae102,b.aae103")
  				.append("  from ac05 a,ae01 b,syscode c,syscode d")
  				.append("  where c.fname='aac505' and c.fcode=a.aac505")
  				.append("  and d.fname='aac508' and d.fcode=a.aac508")
  				.append("  and a.aac501=?");
  		return this.queryForMap(sql.toString(), this.get("uaac501"));
      }
}
