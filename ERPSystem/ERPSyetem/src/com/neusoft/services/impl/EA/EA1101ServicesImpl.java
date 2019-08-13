package com.neusoft.services.impl.EA;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class EA1101ServicesImpl extends JdbcServicesSupport 
{
	private boolean batchPassJournal() throws Exception
	{
		//1.����SQL���
    	String sql="update ac01 a set a.aac104=2 where a.aac101=?";
    	//2.��ȡҳ��idlist����
    	String idlist[]=this.getIdList("idlist");
    	//3.ִ��
		boolean tag = this.batchUpdate(sql, idlist);
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "������������ˮ��Ϊ[ "+idlist.toString()+" ]�Ľ�ѧ��־";
			String remark = "�������ѧ��־�ɹ�";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	private boolean passJournal() throws Exception
	{
		String sql="update ac01 a set a.aac104=2 where a.aac101=?";
		Object[] args={
				this.get("aac101")
		};
		boolean tag = this.executeUpdate(sql, args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "������ˮ��Ϊ[ "+this.get("aac101")+" ]�Ľ�ѧ��־";
			String remark = "���Ľ�ѧ��־�ɹ�";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
    private boolean updateJournal()throws Exception
    {
    	String sql="update ac01 a set a.aac105=? where a.aac101=?";
    	Object args[]={
    			this.get("aac105"),
    			this.get("aac101")
    	};
		boolean tag = this.executeUpdate(sql, args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "��ע��ˮ��Ϊ[ "+this.get("aac101")+" ]�Ľ�ѧ��־";
			String remark = "��ע��ѧ��־�ɹ�";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
    }
    
    public Map<String,String> findById()throws Exception
    {
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aac101,a.aac102,a.aac103,")
    			.append("       a.aac105,b.aae102,b.aae103 ")
    			.append("  from ac01 a,ae01 b ")
    			.append(" where a.aae101=b.aae101 and a.aac101=? ")
    			;   	
    	Object arg[]={
    			this.get("aac101")
    	};
    	//ִ�в�ѯ
    	return this.queryForMap(sql.toString(), arg);
    }

	public List<Map<String,String>> query()throws Exception
	{
		//��ԭҳ���ѯ����
		Object aae102=this.get("qaae102");      //��ʦ����
		Object aae103=this.get("qaae103");      //��ʦ���
		Object aac104=this.get("qaac104");      //����״̬
		Object baac102=this.get("baac102");     //��־����[B]
		Object eaac102=this.get("eaac102");     //��־����[E]

		//����SQL����
		StringBuilder sql=new StringBuilder()
				.append("select x.aac101,x.aac102,x.aac103,x.aac104,")
				.append("       x.aac105,y.aae101,y.aae102,y.aae103 ")
				.append("  from ac01 x, ae01 y ")
				.append(" where x.aae101=y.aae101 ")
				;
		//�����б�
		List<Object> paramList=new ArrayList<>();
		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
		if(this.isNotNull(aae102))
		{
			sql.append(" and y.aae102 like ? ");
			paramList.add("%"+aae102+"%");
		}
		if(this.isNotNull(aae103))
		{
			sql.append(" and y.aae103=? ");
			paramList.add(aae103);
		}	
		if(this.isNotNull(aac104))
		{
			sql.append(" and x.aac104=? ");
			paramList.add(aac104);
		}	
		if(this.isNotNull(baac102))
		{
			sql.append(" and x.aac102>? ");
			paramList.add(baac102);
		}
		if(this.isNotNull(eaac102))
		{
			sql.append(" and x.aac102<? ");
			paramList.add(eaac102);
		}
		sql.append(" order by x.aac104 asc, x.aac102 desc");
		return this.queryForList(sql.toString(), paramList.toArray());
	}
}
