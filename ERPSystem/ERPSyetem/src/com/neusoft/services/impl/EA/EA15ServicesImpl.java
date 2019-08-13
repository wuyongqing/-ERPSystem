package com.neusoft.services.impl.EA;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class EA15ServicesImpl extends JdbcServicesSupport 
{
	/**
	 * ��ѯ������Ŀ����
	 */
	public List<Map<String, String>> query()throws Exception
	{
		Object qaaf502 = this.get("qaaf502");
		Object qaaf503 = this.get("qaaf503");
		Object qaaf504 = this.get("qaaf504");
		StringBuilder sql1 = new StringBuilder()
				.append(" select aaf501,aaf502,aaf503,aaf504,aaf506")
				.append("   from af05")
				.append("  where true")
				;
		
		List<Object> paramList = new ArrayList<>();
		if(isNotNull(qaaf502))
		{
			sql1.append("    and aaf502=?");
			paramList.add(qaaf502);
		}
		if(isNotNull(qaaf503))
		{
			sql1.append("    and aaf503=?");
			paramList.add(qaaf503);
		}
		if(isNotNull(qaaf504))
		{
			sql1.append("    and aaf504 like ?");
			paramList.add("%"+qaaf504+"%");
		}
		return this.queryForList(sql1.toString(), paramList.toArray());
	}
	
	/**
	 * ��ѯ���п�Ŀ����
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> queryForSelect()throws Exception
	{
		String sql = " select distinct(aaf503) from af05";
		return this.queryForList(sql);
	}
	
	/**
	 * ������ˮ�Ų�ѯһ����Ŀ����Ϣ
	 */
	public Map<String, String> findById()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append(" select aaf501,aaf502,aaf503,aaf504,aaf505,")
				.append("        aaf506")
				.append("   from af05")
				.append("  where aaf501=?")
				;
		Object args[]=
			{
				this.get("aaf501")
			};
		return this.queryForMap(sql.toString(), args);
	}
	
	/**
	 * �����Ŀ����,������Ŀ����,��Ŀ,����,��,��ע
	 * @return
	 * @throws Exception
	 */
	private boolean addProblem()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append(" insert into af05(aaf502,aaf503,aaf504,aaf505,aaf506)")
				.append("           values(?,?,?,?,?)")
				;
		Object args[]=
			{
				this.get("aaf502"),
				this.get("aaf503"),
				this.get("aaf504"),
				this.get("aaf505"),
				this.get("aaf506")
			};
		boolean tag = this.executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "���[ "+this.get("aaf503")+","+this.get("aaf502")+" ] ����Ϊ[ "+this.get("aaf504")+" ]����Ŀ��Ϣ";
			String remark = "�����Ŀ��Ϣ";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	/**
	 * ������ˮ���޸ĵ�ǰ��Ŀ����
	 * @return
	 * @throws Exception
	 */
	private boolean modifyProblem()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append(" update af05")
				.append("    set aaf502=?,aaf503=?,aaf504=?,aaf505=?,aaf506=?")
				.append("  where aaf501=?")
				;
		Object args[]=
			{
				this.get("aaf502"),
				this.get("aaf503"),
				this.get("aaf504"),
				this.get("aaf505"),
				this.get("aaf506"),
				this.get("aaf501")
			};
		boolean tag = this.executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "�޸���ˮ��Ϊ[ "+this.get("aaf501")+" ]����Ŀ��Ϣ";
			String remark = "�޸���Ŀ��Ϣ";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	/**
	 * ������ˮ��ɾ����һһ����Ŀ����
	 * @return
	 * @throws Exception
	 */
	private boolean deleteById()throws Exception
	{
		String sql = "delete from af05 where aaf501=?";
		Object args[] = { this.get("aaf501")};
		boolean tag = this.executeUpdate(sql, args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "ɾ����ˮ��Ϊ[ "+this.get("aaf501")+" ]����Ŀ��Ϣ";
			String remark = "ɾ����Ŀ��Ϣ";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	/**
	 * ����ɾ���������Ŀ����
	 * @return
	 * @throws Exception
	 */
	private boolean batchDelete()throws Exception
	{
		String sql = "delete from af05 where aaf501=?";
		String idlist[]=this.getIdList("idlist");
		boolean tag = this.batchUpdate(sql, idlist);
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "����ɾ����ˮ��Ϊ[ "+Tools.joinArray(idlist)+" ]����Ŀ��Ϣ";
			String remark = "����ɾ����Ŀ��Ϣ";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
}
