package com.neusoft.services.impl.EA;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class EA0702ServicesImpl extends JdbcServicesSupport 
{
	/**
	 * ����ɾ��Υ�ͼ�¼
	 * @return
	 * @throws Exception
	 */
	private boolean batchDelete()throws Exception
	{
		String sql = "delete from ab12 where aab1201=?";
		String idlist[]=this.getIdList("idlist");
		boolean tag = this.batchUpdate(sql, idlist);
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "����ɾ����ˮ��Ϊ[ "+Tools.joinArray(idlist)+" ]��ѧ��Υ�ͼ�¼";
			String remark = "����ɾ��ѧ��Υ�ͼ�¼";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}

	private boolean deleteById()throws Exception 
	{
		StringBuilder sql = new StringBuilder()
				.append("delete from ab12")
				.append(" where aab1201=?")
				;
		Object args[]=
			{
				this.get("aab1201")
			};
		boolean tag = this.executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "ɾ����ˮ��Ϊ[ "+this.get("aab1201")+" ]��ѧ��Υ�ͼ�¼";
			String remark = "ɾ��ѧ��Υ�ͼ�¼";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}

	/**
	 * ���һ��Υ�ͼ�¼,��Ҫ�����ṩ��Ա���������ŵ�ֵ��ѯ��Υ�������¼��,
	 * �����������һͬ¼��Υ�ͼ�¼��
	 * @return
	 * @throws Exception
	 */
	private boolean addViolation()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select x.aab101 as mem,y.aae101 as record")
				.append("  from ab01 x,ae01 y")
				.append(" where x.aab102=? and x.aab103=? and y.aae102=? and y.aae103=?")
				;
		Object args[]=
			{
				this.get("maab102"),
				this.get("maab103"),
				this.get("raae102"),
				this.get("raae103")
			};
		Map<String,String> map = this.queryForMap(sql.toString(), args);
		//�������ѧ�Ų�ƥ�������ʧ��
		if(map==null)
		{
			return false;
		}
		String mem = map.get("mem");
		String rec = map.get("record");
		if(isNotNull(mem)&&isNotNull(rec))
		{
			StringBuilder sql2 = new StringBuilder()
					.append("insert into ab12(aab101,aae101,aab1202,aab1203,aab1204)")
					.append("		   values(?,?,?,?,?)");
			Object arg[]=
				{
					mem,
					rec,
					this.get("aab1202"),
					this.get("aab1203"),
					this.get("aab1204")
				};
			boolean tag = this.executeUpdate(sql2.toString(), arg)>0;
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "�����ˮ��Ϊ[ "+mem+" ]��ѧ����Υ�ͼ�¼";
				String remark = "���ѧ��Υ�ͼ�¼";
				service.addWorkRecord(content, this.get("user"), remark);
			}
			return tag;
		}
		return false;
	}
	
	/**
	 * ����Υ����ˮ���޸������Ӧ������
	 * @return
	 * @throws Exception
	 */
	private boolean modifyViolation()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append(" update ab12")
				.append("    set aab1202=?,aab1203=?,aab1204=?")
				.append("  where aab1201=?")
				;
		Object args[]=
			{
				this.get("aab1202"),
				this.get("aab1203"),
				this.get("aab1204"),
				this.get("aab1201")
			};
		boolean tag = this.executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "�޸���ˮ��Ϊ[ "+this.get("aab1201")+" ]��ѧ��Υ�ͼ�¼";
			String remark = "�޸�ѧ��Υ�ͼ�¼";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	/**
	 * ����������ѯԱ����Υ�ͼ�¼
	 */
	public List<Map<String,String>> query()throws Exception
	{
		Object qaab102 = this.get("qaab102");
		Object qaab103 = this.get("qaab103");
		Object baab1202 = this.get("baab1202");
		Object eaab1202 = this.get("eaab1202");
		
		StringBuilder sql = new StringBuilder()
				.append("select x.aab1201,y.aab102,y.aab103,z.aae102 as record,x.aab1202,")
				.append("	    x.aab1203,x.aab1204 ")
				.append("  from ab12 x, ab01 y, ae01 z ")
				.append(" where x.aab101=y.aab101 ")
				.append("   and x.aae101=z.aae101")
				;
		List<Object> paramList = new ArrayList<>();
		if(isNotNull(qaab102))
		{
			sql.append("   and y.aab102 like ?");
			paramList.add("%"+qaab102+"%");
		}
		if(isNotNull(qaab103))
		{
			sql.append("   and y.aab103=?");
			paramList.add(qaab103);
		}
		if(isNotNull(baab1202))
		{
			sql.append("   and x.aab1202>=?");
			paramList.add(baab1202);
		}
		if(isNotNull(eaab1202))
		{
			sql.append("   and x.aab1202<=?");
			paramList.add(eaab1202);
		}
		sql.append("  order by x.aab1202 desc ");
		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	public Map<String,String> findById()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select x.aab1201,y.aab102,y.aab103,z.aae102 as record,x.aab1202,")
				.append("	    x.aab1203,x.aab1204,z.aae103 as recordnum ")
				.append("  from ab12 x, ab01 y, ae01 z ")
				.append(" where x.aab101=y.aab101 ")
				.append("   and x.aae101=z.aae101")
				.append("   and x.aab1201=?")
				;
		Object args[]=
			{
				this.get("aab1201"),
			};
		return this.queryForMap(sql.toString(),args);
	}
}
