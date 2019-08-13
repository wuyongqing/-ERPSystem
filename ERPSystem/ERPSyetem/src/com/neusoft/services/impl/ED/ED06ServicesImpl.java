package com.neusoft.services.impl.ED;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.impl.EA.EA0801ServicesImpl;
import com.neusoft.system.tools.Tools;

public class ED06ServicesImpl extends EDServicesSupport 
{
	@Override
	public boolean update(String utype) throws Exception 
	{
		if(utype.equalsIgnoreCase("addCertificateRecord"))
		{
			return addCertificateRecord();
		}
		else if(utype.equalsIgnoreCase("delCertificateById")) 
		{
			return this.delCertificateById();
		}
		else if(utype.equalsIgnoreCase("modifyCertificate")) 
		{
			return modifyCertificate();
		}
		else if(utype.equalsIgnoreCase("batchDelete"))
		{
			return batchDelete(); 
		}
		else
		{
			throw new Exception("��ED06ServicesImpl�е�����δ����ķ���:["+utype+"]");
		}
	}
	
	public Map<String, String> findById() throws Exception
	{
		//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aab102, a.aab103, b.aab1302,")
    			.append("       b.aab1303, b.aab1304, b.aab1305 ")
    			.append("  from ab01 a, ab13 b")
    			.append(" where a.aab101=b.aab101 and b.aab1301=?")
    			;
    	//ִ�в�ѯ
    	return this.queryForMap(sql.toString(), this.get("aab1301"));
	}
	
	private boolean batchDelete() throws Exception
	{
		//1.����SQL���
    	String sql="delete from ab13 where aab1301=?";
    	//2.��ȡҳ��idlist����
    	String idlist[]=this.getIdList("idlist");
    	//3.ִ��
		boolean tag = this.batchUpdate(sql, idlist);
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "������ɾ��֤�鷢�ż�¼";
			String remark = "������ɾ��֤�鷢�ż�¼�ɹ�";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	private boolean delCertificateById() throws Exception
	{
		String sql="delete from ab13 where aab1301=?";
		boolean tag = this.executeUpdate(sql, this.get("aab1301"))>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "ɾ����ˮ��Ϊ[ "+this.get("aab1301")+" ]��֤�鷢�ż�¼";
			String remark = "ɾ��֤�鷢�ż�¼�ɹ�";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	private boolean modifyCertificate() throws Exception
	{
		StringBuilder sql=new StringBuilder()
    			.append("update ab13 a")
    			.append("   set a.aab1302=?,a.aab1303=?,a.aab1304=?,a.aab1305=?")
    			.append(" where a.aab1301=?")
    			;
    	Object args[]={
    			this.get("aab1302"),
    			this.get("aab1303"),
    			this.get("aab1304"),
    			this.get("aab1305"),
    			this.get("aab1301")
    	};
		boolean tag = this.executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "�޸���ˮ��Ϊ[ "+this.get("aab1301")+" ]��֤�鷢�ż�¼";
			String remark = "�޸�֤�鷢�ż�¼�ɹ�";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	public List<Map<String,String>> query()throws Exception
	{
		//��ԭҳ���ѯ����
		Object aab102=this.get("qaab102");       //����  ģ����ѯ
  		Object aab103=this.get("qaab103");     	 //ѧ��
  		Object aab1302=this.get("qaab1302");     //֤������ ģ����ѯ
  		Object aab1304=this.get("qaab1304");     //���ŵ�λ ģ����ѯ
  		Object baab1303=this.get("baab1303");    //����B
  		Object eaab1303=this.get("eaab1303");    //����E
  		Object aae101=this.get("user");    	 //��ʦ��ˮ��
  		
  		//����SQL����
  		StringBuilder sql=new StringBuilder()
  				.append("select a.aab101, a.aab102, a.aab103, b.aab1301, ")
  				.append("b.aab1302, b.aab1303, b.aab1304, b.aab1305 ")
  				.append("  from ab01 a, ab13 b, ab03 c")
  				.append(" where a.aab101=b.aab101 and a.aab111=c.aab301 ")
  				;
  		
  		//�����б�
  		List<Object> paramList=new ArrayList<>();
  		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
  		if(this.isNotNull(aae101))
  		{
  			sql.append(" and c.ae0_aae101 =? ");
  			paramList.add(aae101);
  		}
  		if(this.isNotNull(aab102))
  		{
  			sql.append(" and a.aab102 like ?");
  			paramList.add("%"+aab102+"%");
  		}
  		if(this.isNotNull(aab103))
  		{
  			sql.append(" and a.aab103=?");
  			paramList.add(aab103);
  		}
  		if(this.isNotNull(aab1302))
  		{
  			sql.append(" and b.aab1302 like ? ");
  			paramList.add("%"+aab1302+"%");
  		}
  		if(this.isNotNull(aab1304))
  		{
  			sql.append(" and b.aab1304 like ? ");
  			paramList.add("%"+aab1304+"%");
  		}
  		if(this.isNotNull(baab1303))
  		{
  			sql.append(" and b.aab1303>=?");
  			paramList.add(baab1303);
  		}
  		if(this.isNotNull(eaab1303))
  		{
  			sql.append(" and b.aab1303<=?");
  			paramList.add(eaab1303);
  		}
  		
  		sql.append(" order by b.aab1303");
  		return this.queryForList(sql.toString(), paramList.toArray());
	}
  
	
	private boolean addCertificateRecord() throws Exception
	{
		Map<String, String> ins=findStuNotById();
		if(ins==null)
		{
			return false;
		}
		StringBuilder sql=new StringBuilder()
				.append("INSERT INTO ab13 (aab101, aab1302, aab1303, aab1304, aab1305) ")
				.append("VALUES (?, ?, ?, ?, ?)")
				;
		Object[] args={
			ins.get("aab101"),
			this.get("aab1302"),
			this.get("aab1303"),
			this.get("aab1304"),
			this.get("aab1305")
		};
		boolean tag = executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "Ϊ��ˮ��Ϊ[ "+ins.get("aab101")+" ]�ĵ�ѧ�����֤�鷢�ż�¼";
			String remark = "���֤�鷢�ż�¼�ɹ�";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
}
