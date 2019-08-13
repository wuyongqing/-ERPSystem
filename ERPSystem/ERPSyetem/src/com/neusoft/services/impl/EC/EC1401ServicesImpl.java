package com.neusoft.services.impl.EC;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;
import com.neusoft.system.tools.Tools;

/**
 * @author susheng
 * @date 2019��7��11��
 * @time ����11:30:47
 * ����ʹ�ü�¼
 */
public class EC1401ServicesImpl extends JdbcServicesSupport
{
	private boolean submitRecord() throws Exception
	{
		String sql = "update ac05 set aac507=3 where aac501=?";
		 boolean tag = this.executeUpdate(sql, this.get("uaac501"))>0;
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "�ύ��ˮ��Ϊ[ "+this.get("uaac501")+" ]�ľ�������ʹ�ü�¼";
				String remark = "�ύ�ɹ�";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag;
	}
	private boolean batchDelete() throws Exception
	{
		Object[] idlist = this.getIdList("idlist");
		String sql1 = "delete from ad04 where aad101=? ";
		String sql2 = "delete from ad01 where aad101=?";
		this.appendBatch(sql1, idlist);
		this.appendBatch(sql2, idlist);
		boolean tag= this.executeTransaction();
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "����ɾ������ʹ�ü�¼";
			String remark = "����ɾ���ɹ�";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	private boolean delByIdRecord() throws Exception
	{
		Object aad101 = this.get("aad101");
		String sql1 = "delete from ad04 where aad101=? ";
		String sql2 = "delete from ad01 where aad101=?";
		this.appendSql(sql1, aad101);
		this.appendSql(sql2, aad101);
		boolean tag= this.executeTransaction();
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "ɾ����ˮ��Ϊ["+this.get("aad101")+" ]�ľ���ʹ�ü�¼";
			String remark = "ɾ���ɹ�";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	private boolean modifyRecord()throws Exception
	{
		double number = Double.parseDouble(this.get("aad103").toString());
		if(number>99999999.99)
		{
			return false;
		}
		StringBuilder sql = new StringBuilder()
				.append("update ad01 a set a.aad102=?,a.aad103=?,")
				.append("  a.aad104=?,a.aad105=?,a.aad106=?")
				.append("  where a.aad101=?");
		Object[] args= {
				this.get("aad102"),
				number,
				this.get("aad104"),
				this.get("aad105"),
				this.get("aad106"),
				this.get("aad101"),
		};
		boolean tag=this.executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "�޸���ˮ��Ϊ["+this.get("aad101")+" ]�ľ���ʹ�ü�¼";
			String remark = "�޸ĳɹ�";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	public Map<String,String> findById() throws Exception
	{
		StringBuilder sql= new StringBuilder()
				.append("select a.aad101,a.aad102,a.aad103,a.aad104, ")
				.append("  a.aad105, a.aad106,b.aae102")
				.append(" from ad01 a,ae01 b where a.aae101=b.aae101 and a.aad101 = ?");
		return this.queryForMap(sql.toString(), this.get("aad101"));
	}
	private boolean addRecord() throws Exception
	{
		double number = Double.parseDouble(this.get("aad103").toString());
		if(number>99999999.99)
		{
			return false;
		}
		//��ȡ��Ӧ��Ա����ˮ��
		String sql1 = "select a.aae101 from ae01 a where a.aae102=?";
		Map<String,String> ins = this.queryForMap(sql1, this.get("aae102"));
		if(this.isNotNull(ins))
		{
			//����ʹ�ü�¼
				StringBuilder sql = new StringBuilder()
						.append("insert into ad01 (aad101,aae101,aad102,aad103,aad104,aad105,aad106)")
						.append(" values(?,?,?,?,?,?,?)");
				int aad101 = Tools.getSequence("aad101");
				Object[] args= {
						aad101,
						ins.get("aae101"),
						this.get("aad102"),
						number,
						this.get("aad104"),
						this.get("aad105"),
						this.get("aad106")
				};
				//ͬ�����Ѽ���ʹ�ü���¼
				String sql2 = "insert into ad04 (aac501,aad101) values(?,?)";
				Object[] args2= {
						this.get("uaac501"),
						aad101
				};
				this.appendSql(sql.toString(), args);
				this.appendSql(sql2, args2);
				 boolean tag = this.executeTransaction();
					if(tag==true)
					{
						EA0801ServicesImpl service = new EA0801ServicesImpl();
						String content = "����µľ�������";
						String remark = "��ӳɹ�";
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
    	 Object aac501= this.get("uaac501");
    	 Object qaad101 = this.get("qaad101");
    	 Object baad105 = this.get("baad105");
    	 Object eaad105 = this.get("eaad105");
    	 StringBuilder sql2 = new StringBuilder()
    			 .append("select a.aad101, a.aad103, a.aad102,a.aad104, a.aad105, a.aad106, ")
    			 .append(" b.aae101, b.aae102 , c.fvalue ")
    			 .append("  from ad01 a ,ae01 b,syscode c,ac05 d,ad04 e")
    			 .append("  where b.aae101 = a.aae101 ")
    			 .append("  and c.fname='aad102' and c.fcode=a.aad102")
    			 .append("  and e.aac501=d.aac501 and e.aad101 = a.aad101")
    			 .append("  and d.aac501=?");
    			
    	 List<Object> paramlist = new ArrayList<>();
    	    paramlist.add(aac501);
    	 if(this.isNotNull(qaad101))
    	 {
    		   sql2.append(" and a.aad101= ?");
    		   paramlist.add(qaad101);
    	 }
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
}
