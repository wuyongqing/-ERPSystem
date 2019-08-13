package com.neusoft.services.impl.ED;

import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;

public class ED02ServicesImpl extends JdbcServicesSupport 
{
	public boolean update(String utype) throws Exception
	{
		if(utype.equalsIgnoreCase("delRecordsById"))
		{
			return this.delRecordsById();
		}
		else
		{
			throw new Exception("��ED02ServicesImpl�е�����δ����ķ���:["+utype+"]");
		}
	}
	
	private boolean delRecordsById() throws Exception
	{
		String sql="delete from ab02 where aab201=?";
		boolean tag = this.executeUpdate(sql, this.get("aab201"))>0;
		if(tag==true)
		{
			EA0801ServicesImpl service = new EA0801ServicesImpl();
			String content = "ȡ����ˮ��Ϊ[ "+this.get("aab201")+" ]������";
			String remark = "�޸�����ɹ�";
			service.addWorkRecord(content, this.get("user"), remark);
		}
		return tag;
	}
	
	public List<Map<String, String>> query() throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select b.aab201,a.aab102,a.aab103,b.aab202,")
				.append("       b.aab203,b.aab205,b.aab206,b.aab207 ")
				.append("    from ab01 a,ab02 b,ab03 c ")
				.append(" where a.aab101=b.aab101 and a.aab111=c.aab301 ")
				.append(" and c.ae0_aae101=? ")
				.append(" order by b.aab207 ASC,b.aab206 DESC")
				;
		Object args[]={
    			this.get("user")
    	};
		return this.queryForList(sql.toString(), args);
	}
}
