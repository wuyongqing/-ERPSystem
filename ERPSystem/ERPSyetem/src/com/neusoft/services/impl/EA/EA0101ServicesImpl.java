package com.neusoft.services.impl.EA;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class EA0101ServicesImpl extends JdbcServicesSupport 
{
	/**
	 * ��ѯ����Ա����Ϣ���Ƿ�ӵ���˺�
	 */
	public List<Map<String,String>> query()throws Exception
	{
		Object aae102 = this.get("qaae102");
		Object aae103 = this.get("qaae103");
		Object hasAccount = this.get("hasAccount");
		
		StringBuilder sql = new StringBuilder()
				.append("select x.aae101,x.aae102,x.aae103,y.ssa401,y.ssa402,")
				.append("		y.ssa405")
				.append("  from ae01 x left join sa04 y")
				.append("    on x.aae101 = y.aae101")
				.append(" where true")
				;
		
		List<Object> paramList = new ArrayList<>();
		if(this.isNotNull(aae102))
		{
			sql.append(" and x.aae102 like ?");
			paramList.add("%"+aae102+"%");
		}
		if(this.isNotNull(aae103))
		{
			sql.append(" and x.aae103=?");
			paramList.add(aae103);
		}
		if(this.isNotNull(hasAccount))
		{
			if(hasAccount.equals("0"))
			{
				sql.append(" and y.ssa401 is null");
			}
			else if(hasAccount.equals("1"))
			{
				sql.append(" and y.ssa401 is not null");
			}
		}
		
		return this.queryForList(sql.toString(),paramList.toArray());
	}
	
	/**
	 * Ϊһ��Ա����ӵ�¼�˺�
	 * @return
	 * @throws Exception
	 */
	private boolean addAccount()throws Exception
	{
		//��ѯԱ���˺Ž�ɫ�Ķ�Ӧ��ˮ��
		String sql = "select ssa201 from sa02 where ssa202=?";
		Object args[]=
			{
				this.get("ssa202")
			};
		Map<String, String> m = this.queryForMap(sql, args);
		String ssa201 = m.get("ssa201");
		//���Ա���˺�
		StringBuilder sql1 = new StringBuilder()
				.append("insert into sa04(aae101,ssa402,ssa404,ssa405)")
				.append("		  values(?,?,?,?)")
				;
		Object args1[]=
			{
				this.get("aae101"),
				this.get("ssa402"),
				Tools.getMd5(this.get("ssa404")),
				this.get("ssa405")
			};
		//�˺����ɫ����
		StringBuilder sql2 = new StringBuilder()
				.append("insert into sa05(ssa401,ssa201,ssa502)")
				.append("   select x.ssa401,y.ssa201,'1' ")
				.append("     from sa04 x,sa02 y ")
				.append("    where x.aae101=? and y.ssa201=?");
		Object args2[]=
			{
				this.get("aae101"),
				ssa201
			};
		
		this.appendSql(sql1.toString(), args1);
		this.appendSql(sql2.toString(), args2);
		
		
		boolean tag = this.executeTransaction();
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "Ϊ��ˮ��Ϊ[ "+this.get("aae101")+" ]���û�����˺�[ "+this.get("ssa402")+" ]";
			String remark = "����˺ųɹ�";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	/**
	 * �޸�Ա���˺�������Ϣ
	 * @return
	 * @throws Exception
	 */
	private boolean modifyAccount()throws Exception
	{
		//��ѯ�޸ĺ�Ľ�ɫ��ˮ��
		StringBuilder sql0 = new StringBuilder()
				.append(" select ssa201 from sa02")
				.append("         where ssa202=?")
				;
		Object args[]=
			{
				this.get("ssa202")
			};
		Map<String,String> m = this.queryForMap(sql0.toString(), args);
		Object ssa201 = m.get("ssa201");

		//lockΪ�ж��Ƿ��޸�����
		Object lock = this.get("lock");
		Object ssa404 = this.get("ssa404");
		List<Object> paramList = new ArrayList<>();
		paramList.add(this.get("ssa402"));
		StringBuilder sql1 = new StringBuilder()
				.append("update sa04");
		//���lock��Ϊ�ջ�������Ϊ�� ���޸�����
		if( (!isNotNull(lock)) && isNotNull(ssa404))
		{
			sql1.append("   set ssa402=?,ssa404=?,ssa405=?");
			paramList.add(Tools.getMd5(this.get("ssa404")));
		}
		else
		{
			sql1.append("   set ssa402=?,ssa405=?");
		}
		sql1.append(" where ssa401=?");
		paramList.add(this.get("ssa405"));
		paramList.add(this.get("ssa401"));
		this.appendSql(sql1.toString(), paramList.toArray());
		
		//�޸��˺����ɫ�Ĺ�����Ϣ
		StringBuilder sql2 = new StringBuilder()
				.append(" update sa05")
				.append("    set ssa201=?")
				.append("  where ssa401=?")
				;
		Object args1[]=
			{
				ssa201,
				this.get("ssa401")
			};
		this.appendSql(sql2.toString(), args1);
		
		boolean tag = this.executeTransaction();
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "Ϊ��ˮ��Ϊ[ "+this.get("ssa401")+" ]���˺��޸��˺���Ϣ";
			String remark = "�޸��˺ųɹ�";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		
		return tag;
	}
	
	/**
	 * ͣ�õ�һ�˺���Ϣ
	 * @return
	 * @throws Exception
	 */
	private boolean modifyById()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("update sa04")
				.append("   set ssa405=2")
				.append(" where ssa401=?")
				;
		Object args[]=
			{
				this.get("ssa401")
			};

		boolean tag = this.executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "ͣ����ˮ��Ϊ[ "+this.get("ssa401")+" ]���˺�";
			String remark = "ͣ���˺�";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		
		return tag;
	}
	
	/**
	 * �����˺���ˮ��,��ѯ�˺���Ϣ�Լ������Ľ�ɫ��Ϣ
	 */
	public Map<String, String> findById()throws Exception
	{
		StringBuilder sql = new StringBuilder()
			.append(" select x.ssa401,x.ssa402,x.ssa405,z.ssa202")
			.append("	from sa04 x, sa05 y, sa02 z")
			.append("  where x.ssa401=y.ssa401")
			.append("    and y.ssa201=z.ssa201")
			.append("    and z.ssa203=1")
			.append("    and x.ssa401=?")
			;
		Object args[]=
			{
				this.get("ssa401")
			};
		return this.queryForMap(sql.toString(), args);
	}
	
	/**
	 * �����˺�ͣ��
	 * @return
	 * @throws Exception
	 */
	private boolean batchModify()throws Exception
	{
		String sql1 = "update sa04 set ssa405=2 where ssa401=?";
		String idlist[]=this.getIdList("idlist");
		boolean tag = this.batchUpdate(sql1, idlist);
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "����ͣ���˺�";
			String remark = "ͣ���˺�";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		
		return tag;
	}
}
