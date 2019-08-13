package com.neusoft.services.impl.EC;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Date;
import java.text.SimpleDateFormat;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;

public class EC0202ServicesImpl extends JdbcServicesSupport 
{
	
	public List<Map<String,String>> query()throws Exception
	{
		//��дSQL���
		StringBuilder sql=new StringBuilder()
				.append("   select aaf501,aaf502,aaf504,aaf505,aaf506")
				.append("    from ")
				.append("  (select aaf501,aaf502,aaf504,aaf505,aaf506")
				.append("     from af05")
				.append("    where aaf502=1 and aaf503=?")
				.append(" order by RAND() limit 10) a")
				.append("    union ")
				.append("   select aaf501,aaf502,aaf504,aaf505,aaf506")
				.append("     from ")
				.append("  (select aaf501,aaf502,aaf504,aaf505,aaf506")
				.append("     from af05")
				.append("    where aaf502=2 and aaf503=?")
				.append(" order by rand() limit 10) b")
				;
		//System.out.println("1");
		//�����б�
		List<Object> paramList=new ArrayList<>();
		paramList.add(this.get("aaf503"));
		paramList.add(this.get("aaf503"));
		//ִ��
		return this.queryForList(sql.toString(), paramList.toArray());	
	}
	
	private boolean batchAdd()throws Exception
    {
		//��ȡ������ˮ��
		String sql1="select aab601 from ab06 where aab602=?";
		Map<String, String >a=this.queryForMap(sql1, this.get("aab602"));
    	//1.����SQL���
    	String sql="insert into af06(aaf501,aab601) values (?,"+ a.get("aab601")+")";
    	//2.��ȡҳ��idlist����
    	String idlist[]=this.getIdList("idlist");
    	//3.ִ��
    	boolean tag =  this.batchUpdate(sql, idlist);
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "������ӿ���";
			String remark = "������ӳɹ�";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
    }
	
	public List<Map<String,String>> querySub()throws Exception
	{
		//��дSQL���
		String sql="select a.aaf503,a.aaf504,a.aaf505,a.aaf506,c.aab602 from af05 a,af06 b,ab06 c where b.aab601=? and a.aaf501=b.aaf501 and b.aab601=c.aab601 ";
		return this.queryForList(sql.toString(),this.get("aab601"));
	}
	
	public List<Map<String,String>> querySub2()throws Exception
    {
		//��ȡ������ˮ��
		String sql1="select aab601 from ab06 where aab602=?";
		Map<String, String> aMap=queryForMap(sql1, this.get("aab602"));
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aaf501,a.aaf502,a.aaf504,a.aaf505,a.aaf506")
    			.append("  from af05 a,af06 b")
    			.append(" where b.aab601=? and a.aaf501=b.aaf501")
    			;
    	//ִ�в�ѯ
    	System.out.println(aMap.get("aab601"));
    	return this.queryForList(sql.toString(), aMap.get("aab601"));
    }
}



