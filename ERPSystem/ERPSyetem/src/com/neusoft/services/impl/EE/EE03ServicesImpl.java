package com.neusoft.services.impl.EE;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;
import com.neusoft.system.tools.Tools;

/**
 * @author ��ѧ��
 * @description ס����Ϣ���������
 * @date 2019/07/16
 */
public class EE03ServicesImpl extends JdbcServicesSupport
{
    /**
     * @description ס����Ϣ�������
     * @param utype ��������
     * @return boolean
     * @author ��ѧ��
     * @date 2019/7/16
     */
    @Override
    public boolean update(String utype) throws Exception
    {
        if (utype.equalsIgnoreCase("addLodging"))
        {
            return this.addLodging();
        }
        else
        {
            throw new Exception("����[ EE03ServicesImpl ]�н�����δ����Ķ�������,���������� "+utype);
        }
    }

    /**
     * @description ס����Ϣ����(�����ɷѵ�)
     * @return boolean
     * @author ��ѧ��
     * @date 2019/7/16
     */
    private boolean addLodging() throws Exception
    {
        String sql1="select aab101 from ab01 where aab103=?";
        Object aab101=null;

        try
        {
            aab101=this.queryForMap(sql1,this.get("aab103")).get("aab101");
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return false;
        }

        String sql2="insert into ab10(aab1101,aab101) values(?,?)";

        Object args1[]={
                this.get("aab1101"),
                aab101
        };

        this.appendSql(sql2,args1);

        String sql3="update ab11 set aab1105=aab1105+1 where aab1101=?";

        this.appendSql(sql3,this.get("aab1101"));

        StringBuilder sql4=new StringBuilder()
                .append("insert into ad02(aab101,aad202,aad203,aad204,aad206,aad207)")
                .append("          values(?,'ס�޷�',?,'0',?,0)                      ");

        Object args2[]={
                aab101,
                this.get("fee"),
                this.get("aad206")
        };

        this.appendSql(sql4.toString(),args2);

        boolean tag=this.executeTransaction();

        if(tag==true)
        {
            EA0801ServicesImpl service = new EA0801ServicesImpl();
            String content = "���ѧ�����Ϊ["+this.get("aab103")+"]����ס��Ϣ��ס�޷ѽɷѵ�";
            String remark = "�����ס��Ϣ�ɹ�";
            service.addWorkRecord(content, this.get("user"), remark);
        }

        return tag;
    }
}
