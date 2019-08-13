package com.neusoft.services.impl.ED;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;

public class ED01ServicesImpl extends EDServicesSupport 
{
	@Override
	public boolean update(String utype) throws Exception 
	{
		if(utype.equalsIgnoreCase("modifyStu"))
		{
			return this.modifyStu();
		}
		else if(utype.equalsIgnoreCase("addStatusRecord"))
		{
			return this.addStatusRecord();
		}
		else 
		{
			throw new Exception("��ED02ServicesImpl���е�����δ����ķ�����["+utype+"()]");
		}
	}
	
	private boolean addStatusRecord() throws Exception
	{
		Map<String, String> ins=this.findStuNotById();
		System.out.println(ins==null);
		if(ins==null)
		{
			return false;
		}
		StringBuilder sql=new StringBuilder()
				.append("INSERT INTO ab02 ")
				.append("(aab101, aab202, aab203, aab204,")
				.append(" aab205, aab206, aab207) ")
				.append("VALUES ( ?, ?, ?, ?, ?, now(), 1)")
				;
		Object args[]={
    			ins.get("aab101"),
    			this.get("aab202"),
    			this.get("aab203"),
    			this.get("aab204"),
    			this.get("aab205"),
    	};
		boolean tag = executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "Ϊ��ˮ��Ϊ[ "+ins.get("aab101")+" ]��ѧ���ύ״̬�������";
			String remark = "�ύ״̬�������ɹ�";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	//�޸�ѧ����Ϣ
	private boolean modifyStu()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("update ab01 a")
    			.append("   set a.aab102=?,a.aab104=?,a.aab105=?,a.aab106=?,a.aab107=?,")
    			.append("       a.aab108=?,a.aab109=?,a.aab110=?,a.aab112=?,a.aab113=?,")
    			.append("       a.aab116=?")
    			.append(" where a.aab101=?")
    			;
    	Object args[]={
    			this.get("aab102"),
    			this.get("aab104"),
    			this.get("aab105"),
    			this.get("aab106"),
    			this.get("aab107"),
    			this.get("aab108"),
    			this.get("aab109"),
    			this.get("aab110"),
    			this.get("aab112"),
    			this.get("aab113"),
    			this.get("aab116"),
    			this.get("aab101")
    	};
		boolean tag = this.executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "Ϊ��ˮ��Ϊ[ "+this.get("aab101")+" ]��ѧ���޸�ѧ��";
			String remark = "�޸�ѧ���ɹ�";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
    }
	
	
	public Map<String,String> findById()throws Exception
    {
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aab102,a.aab103,a.aab104,a.aab105,a.aab106,")
    			.append("       a.aab107,a.aab108,a.aab109,a.aab110,a.aab111,")
    			.append("       a.aab112,a.aab113,a.aab114,a.aab115,a.aab116")
    			.append("  from ab01 a")
    			.append(" where a.aab101=?")
    			;
    	//ִ�в�ѯ
    	return this.queryForMap(sql.toString(), this.get("aab101"));
    }
	
	 public List<Map<String,String>> query()throws Exception
	  {
	  		//��ԭҳ���ѯ����
	  		Object aab102=this.get("qaab102");     //����  ģ����ѯ
	  		Object aab103=this.get("qaab103");     //ѧ��
	  		Object aae101=this.get("user");      //��������ˮ��
	  		Object aab115=this.get("qaab115");     //״̬
	  		
	  		//����SQL����
	  		StringBuilder sql=new StringBuilder()
	  				.append("select x.aab101,x.aab102,x.aab103,x.aab104,x.aab105,")
	  				.append("       x.aab106,z.fvalue aab107,x.aab108,x.aab109,x.aab110,")
	  				.append("       x.aab111,x.aab112,x.aab113,x.aab114,x.aab115,")
	  				.append("       x.aab116,y.aab303")
	  				.append("  from ab01 x,ab03 y,syscode z")
	  				.append(" where x.aab111=y.aab301 and z.fcode=x.aab107 ")
	  				.append(" and z.fname='aab107' ")
	  				;
	  		//�����б�
	  		List<Object> paramList=new ArrayList<>();
	  		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
	  		if(this.isNotNull(aab102))
	  		{
	  			sql.append(" and x.aab102 like ?");
	  			paramList.add("%"+aab102+"%");
	  		}
	  		if(this.isNotNull(aab103))
	  		{
	  			sql.append(" and x.aab103=?");
	  			paramList.add(aab103);
	  		}
	  		if(this.isNotNull(aae101))
	  		{
	  			sql.append(" and y.ae0_aae101=? ");
	  			paramList.add(aae101);
	  		}
	  		if(this.isNotNull(aab115))
	  		{
	  			sql.append(" and x.aab115=?");
	  			paramList.add(aab115);
	  		}
	  		
	  		sql.append(" order by x.aab103");
	  		return this.queryForList(sql.toString(), paramList.toArray());
	  }
	
}
