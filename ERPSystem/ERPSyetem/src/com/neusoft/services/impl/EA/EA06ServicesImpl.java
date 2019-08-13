package com.neusoft.services.impl.EA;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class EA06ServicesImpl extends JdbcServicesSupport
{
	/**
	 * ��ѯ���пγ���Ϣ
	 */
	public List<Map<String,String>> query()throws Exception
	{
		Object aab502 = this.get("qaab502");
		Object aab503 = this.get("qaab503");

		StringBuilder sql = new StringBuilder()
				.append("select aab501,aab502,aab503,aab504,aab505")
				.append("  from ab05 ")
				.append(" where true")
				;
		
		List<Object> paramList = new ArrayList<>();
		if(this.isNotNull(aab502))
		{
			sql.append(" and aab502 like ?");
			paramList.add("%"+aab502+"%");
		}
		if(this.isNotNull(aab503))
		{
			sql.append(" and aab503 like ?");
			paramList.add("%"+aab503+"%");
		}
		
		return this.queryForList(sql.toString(),paramList.toArray());
	}
	
	/**
	 * ���һ�ſγ���Ϣ
	 * @return
	 * @throws Exception
	 */
	private boolean addCourse()throws Exception
	{
		double number = Double.parseDouble(this.get("aab504").toString());
		if(number>99999999.99)
		{
			return false;
		}
		
		StringBuilder sql = new StringBuilder()
				.append("insert into ab05(aab502,aab503,aab504,aab505,aab506,")
				.append("		          aab507)")
				.append("		   values(?,?,?,?,current_timestamp,")
				.append("                 ?)")
				;
		
		Object args[]=
			{
				this.get("aab502"),
				Tools.getCourseNumber(),
				this.get("aab504"),
				this.get("aab505"),
				this.get("aab507")
			};
		
		return this.executeUpdate(sql.toString(), args)>0;
	}
	
	/**
	 * �޸�Ա���˺�������Ϣ
	 * @return
	 * @throws Exception
	 */
	private boolean modifyCourse()throws Exception
	{
		double number = Double.parseDouble(this.get("aab504").toString());
		if(number>99999999.99)
		{
			return false;
		}
		StringBuilder sql = new StringBuilder()
				.append("update ab05")
				.append("   set aab502=?,aab504=?,aab505=?,aab507=?")
				.append(" where aab501=?")
				;
		Object args[]=
			{
				this.get("aab502"),
				this.get("aab504"),
				this.get("aab505"),
				this.get("aab507"),
				this.get("aab501")
			};
		boolean tag = this.executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "�޸���ˮ��Ϊ[ "+this.get("aab501")+" ]�Ŀγ���Ϣ";
			String remark = "�޸Ŀγ�";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	/**
	 * ɾ���γ���Ϣ
	 * @return
	 * @throws Exception
	 */
	private boolean deleteById()throws Exception
	{
		StringBuilder sql1 = new StringBuilder()
				.append("select aab301 from ab03")
				.append("       where aab501=?")
				;
		List<Map<String,String>> map = this.queryForList(sql1.toString(), this.get("aab501"));
		if(map.size()!=0)
		{
			return false;
		}
		StringBuilder sql = new StringBuilder()
				.append("delete from ab05")
				.append(" where aab501=?")
				;
		Object args[]=
			{
				this.get("aab501")
			};
		boolean tag = this.executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "ɾ����ˮ��Ϊ[ "+this.get("aab501")+" ]�Ŀγ���Ϣ";
			String remark = "ɾ���γ�";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	/**
	 * ͨ��������ѯ�γ�
	 */
	public Map<String, String> findById()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select aab501,aab502,aab503,aab504,aab505,")
				.append("	    aab506,aab507")
				.append("  from ab05 ")
			.append("  where aab501=?")
			;
		Object args[]=
			{
				this.get("aab501")
			};
		return this.queryForMap(sql.toString(), args);
	}
	
	/**
	 * ����ɾ��
	 * @return
	 * @throws Exception
	 */
	private boolean batchDelete()throws Exception
	{
		String idlist[]=this.getIdList("idlist");
		String sql = "delete from ab05 where aab501=?";
		
		boolean tag = this.batchUpdate(sql, idlist);
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "����ɾ����ˮ��Ϊ[ "+this.getIdList("idlist")+" ]�Ŀγ���Ϣ";
			String remark = "����ɾ���γ�";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
}
