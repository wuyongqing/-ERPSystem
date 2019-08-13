package com.neusoft.services.impl.EC;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Date;
import java.text.SimpleDateFormat;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;

public class EC0501ServicesImpl extends JdbcServicesSupport 
{
    private boolean modifyAbsence()throws Exception
    {
    	String sql1="select aab101 from ab01 where aab103=?";
    	Map<String, String> aMap=this.queryForMap(sql1, this.get("aab103"));
    	//��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("update ab09 ")
    			.append("   set aab101=?,aab902=?,aab903=?,aab904=?,aab905=current_timestamp")
    			.append(" where aab901=?")
    			;
    	//��д��������
    	Object args[]={
    			aMap.get("aab101"),
    			this.get("aab902"),
    			this.get("aab903"),
    			this.get("aab904"),
    			this.get("aab901")
    	};
    	//ִ��
    	 boolean tag =this.executeUpdate(sql.toString(), args)>0;
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "�޸���ˮ��Ϊ[ "+this.get("aab901")+" ]�Ŀ��ڼ�¼";
				String remark = "�޸ĳɹ�";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag;
    	
    }
    
    public boolean addAbsence()throws Exception
    {  
    	//��ȡѧ��
        String sql1="select aab101 from ab01 where aab103=?";
        Map<String, String> aMap=queryForMap(sql1, this.get("aab103"));
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ab09(aab101,aab902,aab903,aab904,aab905)")
    			.append("          values(?,?,?,?,?)")
    			;
    	String aab905=Tools.getCurrentTime();
    	//2.��д��������
    	Object args[]={
    			aMap.get("aab101"),
    			this.get("aab902"),
    			this.get("aab903"),
    			this.get("aab904"),
    			aab905
    	}; 
        boolean tag = this.executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "����µĿ��ڼ�¼";
			String remark = "��ӳɹ�";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
    }
    public Map<String,String> findById()throws Exception
    {
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("select b.aab103,a.aab902,a.aab903,a.aab904")
    			.append("  from ab09 a,ab01 b")
    			.append(" where a.aab901=? and a.aab101=b.aab101")
    			;
    	//ִ�в�ѯ
    	return this.queryForMap(sql.toString(), this.get("aab901"));
    }
    
    
	/**
	* ����������ѯ
	* @return
	* @throws Exception
	*/
	public List<Map<String,String>> query()throws Exception
	{
	  	//��ԭҳ���ѯ����
		Object aab103=this.get("qaab103");     //ѧ�����
		Object aab102=this.get("qaab102");     //ѧ������
		Object qaab902=this.get("qaab902");    //��ʼ����
		Object paab902=this.get("paab902");    //��������
		//����SQL����
		StringBuilder sql=new StringBuilder()
				.append("select a.aab901,a.aab101,a.aab902,a.aab903,a.aab904,")
				.append("       b.aab102,b.aab103")
				.append("  from ab09 a,ab01 b ")
				.append(" where a.aab101=b.aab101")
				;
		
		//�����б�
		List<Object> paramList=new ArrayList<>();
		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
		
		if(this.isNotNull(aab103))
		{
			sql.append(" and aab103=?");
			paramList.add(aab103);
		}
		if(this.isNotNull(aab102))
		{
			sql.append(" and aab102 like ?");
			paramList.add("%"+aab102+"%");
		}
		if(this.isNotNull(qaab902))
		{
			sql.append(" and aab902>=?");
			paramList.add(qaab902);
		}
		if(this.isNotNull(paab902))
		{
			sql.append(" and aab902<=?");
			paramList.add(paab902);
		}
		
		sql.append(" order by aab902");
		return this.queryForList(sql.toString(), paramList.toArray());
	}
}
