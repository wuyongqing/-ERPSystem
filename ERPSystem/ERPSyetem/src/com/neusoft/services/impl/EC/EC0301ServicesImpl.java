package com.neusoft.services.impl.EC;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Date;
import java.text.SimpleDateFormat;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;

public class EC0301ServicesImpl extends JdbcServicesSupport 
{
    //�޸ĳɼ�
    private boolean modifyScore()throws Exception
    {
    	String sql1="select aab101 from ab01 where aab103=?";
    	Map<String, String> aMap=this.queryForMap(sql1, this.get("aab103"));
    	
    	String sql2="select aab601 from ab06 where aab602=?";
    	Map<String, String> bMap=this.queryForMap(sql2, this.get("aab602"));
    	
    	
    	StringBuilder sql=new StringBuilder()
    			.append("update ab07 ")
    			.append("   set aab101=?,aab601=?,aab702=?,aab703=?,aab704=?,")
    			.append("       aab705=?,aab706=current_timestamp")
    			.append(" where aab701=?")
    			;
    	Object args[]={
    			aMap.get("aab101"),
    			bMap.get("aab601"),
    			this.get("aab702"),
    			this.get("aab703"),
    			this.get("aab704"),
    			this.get("aab705"),
    			this.get("aab701")
    	};
    	 boolean tag =this.executeUpdate(sql.toString(), args)>0;
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "�޸���ˮ��Ϊ[ "+this.get("aab701")+" ]��ѧ���ɼ�";
				String remark = "�޸ĳɹ�";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag;
    	
    }
    //¼��ɼ�
    public boolean addScore()throws Exception
    {
    	//��ȡѧ����ˮ��
    	String sql1="select aab101 from ab01 where aab103=?";
    	Map<String, String> aMap=this.queryForMap(sql1, this.get("aab103"));
    	//��ȡ������ˮ��
    	String sql2="select aab601 from ab06 where aab602=?";
    	Map<String, String> bMap=this.queryForMap(sql2, this.get("aab602"));
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ab07(aab101,aab601,aab702,aab703,")
    			.append("                 aab704,aab705,aab706)")
    			.append("          values(?,?,?,?,?,")
    			.append("                 ?,?)")
    			;
    	String aab706=Tools.getCurrentTime();
    	//2.��д��������
    	Object args[]=
    		{
    			aMap.get("aab101"),
    			bMap.get("aab601"),
    			this.get("aab702"),
    			this.get("aab703"),
    			this.get("aab704"),
    			this.get("aab705"),
    			aab706
    		};
        boolean tag = this.executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "����µ�ѧ���ɼ�";
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
    			.append("select b.aab103,c.aab602,a.aab702,a.aab703,a.aab704,")
    			.append("       a.aab705")
    			.append("  from ab07 a,ab01 b,ab06 c")
    			.append(" where a.aab701=? and a.aab101=b.aab101 and a.aab601=c.aab601")
    			;
    	//System.out.println("3");
    	//ִ�в�ѯ
    	return this.queryForMap(sql.toString(), this.get("aab701"));
    }
    
    
	/**
	* ����������ѯ
	* @return
	* @throws Exception
	*/
	public List<Map<String,String>> query()throws Exception
	{
	  		//��ԭҳ���ѯ����
		Object aab602=this.get("qaab602");     //���Ա��
		Object aab102=this.get("qaab102");     //ѧ������
		Object aab103=this.get("qaab103");     //ѧ�����

		//����SQL����
		StringBuilder sql=new StringBuilder()
				.append("select x.aab101,x.aab601,x.aab702,x.aab703,x.aab704,")
				.append("       x.aab705,y.aab102,y.aab103,z.aab602,x.aab701")
				.append("  from ab07 x,ab01 y,ab06 z")
				.append(" where x.aab101=y.aab101 and x.aab601=z.aab601 ")
				;
		//System.out.println("1");
		//�����б�
		List<Object> paramList=new ArrayList<>();
		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
		
		if(this.isNotNull(aab602))
		{
			sql.append(" and z.aab602=?");
			paramList.add(aab602);
		}
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
		sql.append(" order by y.aab103");
		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	public Map<String,String> findByIdSub()throws Exception
    {
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aab704")
    			.append("  from ab07 a ,ab03 b")
    			.append(" where b.aab301=? ")
    			;
    	Map<String, String> data1 = this.queryForMap(sql.toString(), this.get("aac301"));
    	
    	return this.queryForMap(sql.toString(), data1.get("aac301"));
    }
}
