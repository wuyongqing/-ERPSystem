package com.neusoft.services.impl.EC;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Date;
import java.util.HashMap;
import java.text.SimpleDateFormat;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class EC0302ServicesImpl extends JdbcServicesSupport 
{
	public Map<String,String> findById()throws Exception
	{
	  	//获取考试流水号
		String sql1="select aab601 from ab06 where aab602=? ";
		Map<String, String> aMap=queryForMap(sql1, this.get("aab602"));
		
		String sql2="select count(aab704)  from ab07 where aab601=? and aab704='E'";
		Map<String, String> bMap=queryForMap(sql2, aMap.get("aab601"));
		
		String sql3="select count(aab704)  from ab07 where aab601=? and aab704='D'";
		Map<String, String> cMap=queryForMap(sql3, aMap.get("aab601"));
		
		String sql4="select count(aab704)  from ab07 where aab601=? and aab704='C'";
		Map<String, String> dMap=queryForMap(sql4, aMap.get("aab601"));
		
		String sql5="select count(aab704)  from ab07 where aab601=? and aab704='B'";
		Map<String, String> eMap=queryForMap(sql5, aMap.get("aab601"));
		
		String sql6="select count(aab704)  from ab07 where aab601=? and aab704='A'";
		Map<String, String> fMap=queryForMap(sql6, aMap.get("aab601"));
		//参数赋值
		Map<String, String> gMap=new HashMap<>();
		gMap.put("data1", bMap.get("count(aab704)"));
		gMap.put("data2", cMap.get("count(aab704)"));
		gMap.put("data3", dMap.get("count(aab704)"));
		gMap.put("data4", eMap.get("count(aab704)"));
		gMap.put("data5", fMap.get("count(aab704)"));
		System.out.println(gMap.get("data1"));
		System.out.println(gMap.get("data2"));
		System.out.println(gMap.get("data3"));
		System.out.println(gMap.get("data4"));
		System.out.println(gMap.get("data5"));
		return gMap;
		
	}
	
	public List<Map<String,String>> query()throws Exception
	{
		Object aab102=this.get("aab102");      //姓名
		Object aab103=this.get("aab103");      //学号
		Object qaab603=this.get("qaab603");    //开始日期
		Object paab603=this.get("paab603");    //结束日期
		if(this.isNotNull(aab103))
		{
			//定义SQL主体
			StringBuilder sql=new StringBuilder()
					.append("select x.aab702+x.aab703 a,z.aab603")
					.append("  from ab07 x,ab01 y,ab06 z")
					.append(" where x.aab601=z.aab601 and x.aab101=y.aab101")
					;
			
			//参数列表
			List<Object> paramList=new ArrayList<>();
			//逐一判断查询条件是否录入,拼接AND条件
			if(this.isNotNull(aab102))
			{
				sql.append(" and y.aab102 like ?");
				paramList.add("%"+aab102+"%");
			}
			if(this.isNotNull(aab103))
			{
				sql.append(" and y.aab103=?");
				paramList.add(aab103);
			}
			if(this.isNotNull(qaab603))
			{
				sql.append(" and z.aab603>=?");
				paramList.add(qaab603);
			}
			if(this.isNotNull(paab603))
			{
				sql.append(" and z.aab603<=?");
				paramList.add(paab603);
			}
			sql.append(" order by z.aab603");
			
			return this.queryForList(sql.toString(), paramList.toArray());
			/*Map<String,String> subIns = new HashMap<>();
			int i=1;
			for(Map<String,String> a :aList)
			{
				subIns.put("date"+i, a.get("aab603"));
				subIns.put("score"+i, a.get("aab704"));
				i++;
			}
			System.out.println(subIns.get("date1"));
			System.out.println(subIns.get("score1"));
			return subIns;*/
		}
		else
		{
			StringBuilder sql=new StringBuilder()
					.append("select x.aab702+x.aab703 a,z.aab603")
					.append("  from ab07 x,ab01 y,ab06 z")
					.append(" where x.aab704='F'")
					;
			return this.queryForList(sql.toString());
		}
	}
}
