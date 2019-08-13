package com.neusoft.services.impl.EA;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class EA0701ServicesImpl extends JdbcServicesSupport 
{
	/**
	 * ����ɾ��Ա��Υ�ͼ�¼
	 * @return
	 * @throws Exception
	 */
	private boolean batchDelete()throws Exception
	{
		String sql = "delete from af02 where aaf201=?";
		String idlist[]=this.getIdList("idlist");
		boolean tag = this.batchUpdate(sql, idlist);
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "����ɾ����ˮ��Ϊ[ "+Tools.joinArray(idlist)+" ]��Ա��Υ�ͼ�¼";
			String remark = "����ɾ��Ա��Υ�ͼ�¼";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}

	/**
	 * ��һʵ��ɾ��Ա��Υ�ͼ�¼
	 * @return
	 * @throws Exception
	 */
	private boolean deleteById()throws Exception 
	{
		StringBuilder sql = new StringBuilder()
				.append("delete from af02")
				.append(" where aaf201=?")
				;
				
		Object args[]=
			{
				this.get("aaf201")
			};
		boolean tag = this.executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "ɾ����ˮ��Ϊ[ "+this.get("aaf201")+" ]��Ա��Υ�ͼ�¼";
			String remark = "ɾ��Ա��Υ�ͼ�¼";
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
				.append("select x.aae101 as mem,y.aae101 as record")
				.append("  from ae01 x,ae01 y")
				.append(" where x.aae102=? and x.aae103=? and y.aae102=? and y.aae103=?")
				;
		Object args[]=
			{
				this.get("maae102"),
				this.get("maae103"),
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
					.append("insert into af02(aae101,af0_aae101,aaf202,aaf203,aaf204)")
					.append("		   values(?,?,?,?,?)");
			Object arg[]=
				{
					mem,
					rec,
					this.get("aaf202"),
					this.get("aaf203"),
					this.get("aaf204")
				};
			boolean tag = this.executeUpdate(sql2.toString(), arg)>0;
			if(tag==true)
			{
				EA0801ServicesImpl service = new EA0801ServicesImpl();
				String content = "���Ա����ˮ��Ϊ[ "+mem+" ]��Ա����Υ�ͼ�¼";
				String remark = "���Ա��Υ�ͼ�¼";
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
				.append(" update af02")
				.append("    set aaf202=?,aaf203=?,aaf204=?")
				.append("  where aaf201=?")
				;
		Object args[]=
			{
				this.get("aaf202"),
				this.get("aaf203"),
				this.get("aaf204"),
				this.get("aaf201")
			};
		boolean tag = this.executeUpdate(sql.toString(), args)>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "�޸���ˮ��Ϊ[ "+this.get("aaf201")+" ]��Ա��Υ�ͼ�¼";
			String remark = "�޸�Ա��Υ�ͼ�¼";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	/**
	 * ����������ѯԱ����Υ�ͼ�¼
	 */
	public List<Map<String,String>> query()throws Exception
	{
		Object qaae102 = this.get("qaae102");
		Object qaae103 = this.get("qaae103");
		Object baaf202 = this.get("baaf202");
		Object eaaf202 = this.get("eaaf202");
		
		StringBuilder sql = new StringBuilder()
				.append("select x.aaf201,y.aae102,y.aae103,z.aae102 as record,x.aaf202,")
				.append("	    x.aaf203,x.aaf204 ")
				.append("  from af02 x, ae01 y, ae01 z ")
				.append(" where x.aae101=y.aae101 ")
				.append("   and x.af0_aae101=z.aae101")
				;
		List<Object> paramList = new ArrayList<>();
		if(isNotNull(qaae102))
		{
			sql.append("   and y.aae102 like ?");
			paramList.add("%"+qaae102+"%");
		}
		if(isNotNull(qaae103))
		{
			sql.append("   and y.aae103=?");
			paramList.add(qaae103);
		}
		if(isNotNull(baaf202))
		{
			sql.append("   and x.aaf202>=?");
			paramList.add(baaf202);
		}
		if(isNotNull(eaaf202))
		{
			sql.append("   and x.aaf202<=?");
			paramList.add(eaaf202);
		}
		sql.append("  order by x.aaf202 desc ");
		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	 * ��һʵ����ѯ
	 */
	public Map<String,String> findById()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select x.aaf201,y.aae102,y.aae103,z.aae102 as record,x.aaf202,")
				.append("	    x.aaf203,x.aaf204,z.aae103 as recordnum ")
				.append("  from af02 x, ae01 y, ae01 z ")
				.append(" where x.aae101=y.aae101 ")
				.append("   and x.af0_aae101=z.aae101")
				.append("   and x.aaf201=?")
				;
		Object args[]=
			{
				this.get("aaf201"),
			};
		return this.queryForMap(sql.toString(),args);
	}
	
	
	/*
	 * ����
	 */
//	public static void main(String[] args) 
//	{
//		EA0701ServicesImpl ea = new EA0701ServicesImpl();
//		Map<String,Object> dto = new HashMap<>();
//		dto.put("maae102", "������");
//		dto.put("maae103", "20160001");
//		dto.put("raae102", "������");
//		dto.put("raae103", "20160001");
//		dto.put("aaf202", "2016-01-01");
//		dto.put("aaf203", "�Ҽ�����");
//		dto.put("aaf204", "�������");
//		ea.setMapDto(dto);
//		try {
//			ea.addViolation();
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
}
