package com.neusoft.services.impl.EC;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Date;
import java.text.SimpleDateFormat;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;

public class EC0601ServicesImpl extends JdbcServicesSupport 
{
	public boolean deleteById()throws Exception
    {
		//��дSQL���
    	String sql="delete from ac07 where aac701=?";
    	//System.out.println("1");
    	//ִ��
    	boolean tag =this.executeUpdate(sql, this.get("aac701"))>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "ɾ����ˮ��Ϊ[ "+this.get("aac701")+" ]�Ŀ���";
			String remark = "ɾ���ɹ�";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
    }
    
    private boolean modifySubject()throws Exception
    {
    	String sql1="select aae101 from ae01 where aae103=?";
    	Map<String, String> aMap=this.queryForMap(sql1, this.get("aae103"));
    	//��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("update ac07 ")
    			.append("   set aae101=?,aac702=?,aac703=?,aac704=?,aac705=?,")
    			.append("       aac706=?,aac707=?")
    			.append(" where aac701=?")
    			;
    	//��д��������
    	Object args[]={
    			aMap.get("aae101"),
    			Tools.getSubjectNumber(),
    			this.get("aac703"),
    			this.get("aac704"),
    			1,
    			this.get("aac706"),
    			this.get("aac707"),
    			this.get("aac701")
    	};
    	//ִ��
    	 boolean tag =this.executeUpdate(sql.toString(), args)>0;
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "�޸���ˮ��Ϊ[ "+this.get("aac701")+" ]�Ŀ�����Ϣ";
				String remark = "�޸ĳɹ�";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag;
    }
    
    public boolean addSubject()throws Exception
    {  
    	//��ȡ�����˱��
    	String sql1="select aae101 from ae01 where aae103=?";
    	Map<String, String> aMap=this.queryForMap(sql1, this.get("aae103"));
    	//��ȡ������
    	
//    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ac07(aae101,aac702,aac703,aac704,aac705,")
    			.append("                 aac706,aac707)")
    			.append("          values(?,?,?,?,?,")
    			.append("                 ?,?)")
    			;
    	//2.��д��������
    	Object args[]={
    			aMap.get("aae101"),
    			Tools.getSubjectNumber(),
    			this.get("aac703"),
    			this.get("aac704"),
    			"1",
    			this.get("aac706"),
    			this.get("aac707")
    	};
        boolean tag = this.executeUpdate(sql.toString(), args)>0;	
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "����µĿ���";
			String remark = "��ӳɹ�";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
    }

    //��һʵ����ѯ    
    public Map<String,String> findById()throws Exception
    {
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("select b.aae103,a.aac703,aac704,aac706,aac707")
    			.append("  from ac07 a,ae01 b")
    			.append(" where aac701=? and a.aae101=b.aae101")
    			;
    	//ִ�в�ѯ
    	return this.queryForMap(sql.toString(), this.get("aac701"));
    }
    
    
	/**
	* ����������ѯ
	* @return
	* @throws Exception
	*/
	public List<Map<String,String>> query()throws Exception
	{
	  	//��ԭҳ���ѯ����
		Object aae103=this.get("aae103");     //�����˱��
		Object aae102=this.get("aae102");     //����������
		Object aac702=this.get("aac702");     //������
		//����SQL����
		StringBuilder sql=new StringBuilder()
				.append("select a.aac701,b.aae103,a.aac702,a.aac703,a.aac704,")
				.append("       a.aac705,a.aac706,b.aae102")
				.append("  from ac07 a,ae01 b ")
				.append(" where a.aae101=b.aae101")
				;
		
		//�����б�
		List<Object> paramList=new ArrayList<>();
		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
		
		if(this.isNotNull(aae103))
		{
			sql.append(" and aae103=?");
			paramList.add(aae103);
		}
		if(this.isNotNull(aae102))
		{
			sql.append(" and aae103 like ?");
			paramList.add("%"+aae102+"%");
		}
		if(this.isNotNull(aac702))
		{
			sql.append(" and aac702=?");
			paramList.add(aac702);
		}
		sql.append(" order by aac701");
		return this.queryForList(sql.toString(), paramList.toArray());
	}
}
