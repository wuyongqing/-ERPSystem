package com.neusoft.services.impl.EB;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;

/**
 * @author susheng
 * @date 2019年7月15日
 * @time 下午5:59:02
 */
public class EB0101ServicesImpl extends JdbcServicesSupport 
{
	private boolean getPay() throws Exception
	{
		String sql1="update ad02 set aad204='1' where aad201=?";	
		this.appendSql(sql1, this.get("aad201"));
		StringBuilder sql2 = new StringBuilder()
				.append("insert into ad03 (aad306, ad0_aae101,aad302,aad303,aad304,aad307,aad308,aad309)")
				.append(  "values(?,?,?,?,?,?,?,?)");
		Object[] args= {
				this.get("aab101"),
				this.get("user"),
				this.get("aad202"),
				this.get("aad203"),
				new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()),
			    "2",
			    "0",
			    "1"
		};
		this.appendSql(sql2.toString(), args);
		 boolean tag = this.executeTransaction();
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "为流水号为[ "+this.get("aad201")+" ]的缴费单缴费";
				String remark = "缴费成功";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag;
	}
	private boolean modifyPay() throws Exception
	{
		double number = Double.parseDouble(this.get("aad203").toString());
		if(number>99999999.99)
		{
			return false;
		}
		StringBuilder sql = new StringBuilder()
				.append("update ad02 set aad202=?,aad203=?,aad206=?")
				.append("  where aad201=?");
		Object[] args=
			{
					this.get("aad202"),
					number,
					this.get("aad206"),
					this.get("aad201"),
			};
		 boolean tag =this.executeUpdate(sql.toString(), args)>0;
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "修改流水号为[ "+this.get("aad201")+" ]的缴费单";
				String remark = "修改成功";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag;
	}
	private boolean addPay() throws Exception
	{
		double number = Double.parseDouble(this.get("aad203").toString());
		if(number>99999999.99)
		{
			return false;
		}
		String sql1 = "select aab101 from ab01 where aab102=? and aab103=?";
		Object [] args1= {
				this.get("aab102"),
				this.get("aab103")
		};
		Map<String,String> ins = this.queryForMap(sql1, args1);
		if(this.isNotNull(ins))
		{
			StringBuilder sql2= new StringBuilder()
					.append("insert into ad02 (aab101,aad202,aad203,aad204,aad206,aad207)")
					.append(" values(?,?,?,0,?,1)");
			Object[] args2= {
					ins.get("aab101"),
					this.get("aad202"),
					number,
					this.get("aad206")
			};
			boolean tag = this.executeUpdate(sql2.toString(), args2)>0;
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "添加新的缴费单";
				String remark = "添加成功";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag;
		}
		else
		{
			return false;
		}
		
	}
    public List<Map<String,String>> query() throws Exception
    {
    	Object qaab103 = this.get("qaab103");
    	Object qaab102 = this.get("qaab102");
    	Object qaad204 = this.get("qaad204");
    	StringBuilder sql = new StringBuilder()
    			.append("select a.aad201,a.aad202,a.aad203,a.aad204,a.aad207,")
    			.append("   b.aab101,b.aab102,b.aab103, c.fvalue value")
    			.append("   from ad02 a,ab01 b,syscode c")
    			.append("   where c.fname='aad204' and c.fcode=a.aad204")
    			.append("   and a.aab101 = b.aab101");
    	List<Object> paramlist = new ArrayList<>();
    	if(this.isNotNull(qaab103))
    	{
    		sql.append("  and a.aab103=?");
    		paramlist.add(qaab103);
    	}
    	if(this.isNotNull(qaab102))
    	{
    		sql.append("  and b.aab102=?");
    		paramlist.add(qaab102);
    	}
    	if(this.isNotNull(qaad204))
    	{
    		sql.append("  and a.aad204=?");
    		paramlist.add(qaad204);
    	}
    	sql.append(" order by a.aad204 ");
    	return queryForList(sql.toString(), paramlist.toArray());
    }
    public Map<String,String> findById() throws Exception
    {
    	StringBuilder sql = new StringBuilder()
    			.append("select a.aad201,a.aad202,a.aad203,a.aad204,a.aad207,")
    			.append("   b.aab101,b.aab102,b.aab103, c.fvalue value1")
    			.append("   from ad02 a,ab01 b,syscode c")
    			.append("   where c.fname='aad204' and c.fcode=a.aad204")
    			.append("   and a.aab101 = b.aab101")
    			.append("   and a.aad201= ?");
    	return this.queryForMap(sql.toString(), this.get("aad201"));
    }
}
