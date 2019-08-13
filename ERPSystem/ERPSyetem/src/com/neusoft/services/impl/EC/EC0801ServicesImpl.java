package com.neusoft.services.impl.EC;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Date;
import java.text.SimpleDateFormat;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;

public class EC0801ServicesImpl extends JdbcServicesSupport 
{
	public boolean deleteById()throws Exception
    {
		//��дSQL���
    	String sql="delete from ac08 where aac801=?";
    	//System.out.println("1");
    	//ִ��
    	boolean tag =this.executeUpdate(sql, this.get("aac801"))>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "ɾ����ˮ��Ϊ[ "+this.get("aac801")+" ]�Ŀ������Ա";
			String remark = "ɾ���ɹ�";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
    }
    //�޸�ְ��
    private boolean modifyMember()throws Exception
    {
    	String sql1="select aac701 from ac07 where aac702=?";
    	Map<String, String> aMap=this.queryForMap(sql1, this.get("aac702"));
    	
    	String sql2="select aae101 from ae01 where aae103=?";
    	Map<String, String> bMap=this.queryForMap(sql2, this.get("aae103"));
    	
    	//��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("update ac08 ")
    			.append("   set aac701=?,aae101=?,aac802=?")
    			.append(" where aac801=?")
    			;
    	//��д��������
    	Object args[]={
    			aMap.get("aac701"),
    			bMap.get("aae101"),
    			this.get("aac802"),
    			this.get("aac801")
    	};
    	//ִ��
    	boolean tag =this.executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "�޸���ˮ��Ϊ[ "+this.get("aac801")+" ]�ĳ�Ա��Ϣ";
			String remark = "�޸ĳɹ�";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
    	
    }
    //������Ա
    public boolean addMember()throws Exception
    {    	
    	String sql1="select aac701 from ac07 where aac702=?";
    	String sql2="select aae101 from ae01 where aae102=? and aae103=?";
    	Object args1[]={this.get("aae102"),this.get("aae103")};
    	Map<String, String> a=this.queryForMap(sql1,this.get("aac702"));
    	Map<String, String> b=this.queryForMap(sql2,args1 );
    	if(a!=null & args1!=null)
    	{
    		
    		String aac701=a.get("aac701");
    		//System.out.println(aac701);
    		String aae101=b.get("aae101");
	    	//1.��дSQL���
	    	StringBuilder sql=new StringBuilder()
	    			.append("insert into ac08(aac701,aae101,aac802)")
	    			.append("          values(?,?,?)")
	    			;
	    	//2.��д��������
	    	Object args[]={
	    			aac701,
	    			aae101,
	    			this.get("aac802")
	    	};
	    	boolean tag = this.executeUpdate(sql.toString(), args)>0;
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "����µĿ������Ա";
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

    //��һʵ����ѯ    
    public Map<String,String> findById()throws Exception
    {
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aac801,b.aac702,c.aae102,c.aae103,aac802")
    			.append("  from ac08 a,ac07 b,ae01 c")
    			.append(" where aac801=? and a.aac701=b.aac701 and a.aae101=c.aae101")
    			;
    	//ִ�в�ѯ
    	return this.queryForMap(sql.toString(), this.get("aac801"));
    }
    
    
	/**
	* ����������ѯ
	* @return
	* @throws Exception
	*/
	public List<Map<String,String>> query()throws Exception
	{
	  	//��ԭҳ���ѯ����
		Object aae101=this.get("qaae103");     //��Ա���
		Object aac702=this.get("qaac702");	   //��������

		//����SQL����
		StringBuilder sql=new StringBuilder()
				.append("select a.aac702,a.aac703,c.aae102,b.aac801,b.aac802")
				.append("  from ac07 a,ac08 b,ae01 c ")
				.append(" where b.aae101=c.aae101 and a.aac701=b.aac701 ")
				;
		
		//�����б�
		List<Object> paramList=new ArrayList<>();
		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
		
		if(this.isNotNull(aae101))
		{
			sql.append(" and c.aae101=?");
			paramList.add(aae101);
		}	
		if(this.isNotNull(aac702))
		{
			sql.append(" and a.aac702 like ?");
			paramList.add("%"+aac702+"%");
		}
		sql.append(" order by aac801");
		return this.queryForList(sql.toString(), paramList.toArray());
	}
}
