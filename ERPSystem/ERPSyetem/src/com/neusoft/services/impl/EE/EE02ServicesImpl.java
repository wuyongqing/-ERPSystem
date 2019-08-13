package com.neusoft.services.impl.EE;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;
import com.neusoft.system.tools.Tools;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author ��ѧ��
 * @description ѧ������������
 * @date 2019/07/15
 */
public class EE02ServicesImpl extends JdbcServicesSupport
{
    /**
     * @description ����������ѯ������Ϣ
     * @return List<Map<String,String>>
     * @author ��ѧ��
     * @date 2019/7/15
     */
    @Override
    public List<Map<String, String>> query() throws Exception
    {
        Object aae102=this.get("qaae102");    //Ա������
        Object aae804=this.get("qaae804");    //ѧ������
        Object baae802=this.get("baae802");   //����ʱ������
        Object eaae802=this.get("eaae802");   //����ʱ������
        Object aae803=this.get("qaae803");    //�����ص�
        Object aae805=this.get("qaae805");    //�����γ�

        StringBuilder sql=new StringBuilder()
                .append("select b.aae102,b.aae103,a.aae802,a.aae803,a.aae804,")
                .append("       a.aae805,a.aae806                            ")
                .append("  from ae08 a,ae01 b                                ")
                .append(" where a.aae101=b.aae101                            ");

        List<Object> paramList=new ArrayList<>();

        if (this.isNotNull(aae102))
        {
            sql.append(" and b.aae102 like ?");
            paramList.add("%"+aae102+"%");
        }
        if (this.isNotNull(aae804))
        {
            sql.append(" and a.aae804 like ?");
            paramList.add("%"+aae804+"%");
        }
        if (this.isNotNull(baae802))
        {
            sql.append(" and a.aae802>=?");
            paramList.add(baae802);
        }
        if (this.isNotNull(eaae802))
        {
            sql.append(" and a.aae802<=?");
            paramList.add(eaae802);
        }
        if (this.isNotNull(aae803))
        {
            sql.append(" and a.aae803 like ?");
            paramList.add("%"+aae803+"%");
        }
        if (this.isNotNull(aae805))
        {
            sql.append(" and a.aae805 like ?");
            paramList.add("%"+aae805+"%");
        }
        sql.append(" order by a.aae802 desc");

        return this.queryForList(sql.toString(),paramList.toArray());
    }

    /**
     * @description ������Ϣ����ͳһ���
     * @param utype ��������
     * @return boolean
     * @author ��ѧ��
     * @date 2019/7/15
     */
    @Override
    public boolean update(String utype) throws Exception
    {
        if (utype.equalsIgnoreCase("addSub"))
        {
            return this.addSub();
        }
        else
        {
            throw new Exception("����[ EE02ServicesImpl ]�н�����δ����Ķ�������,���������� "+utype);
        }
    }

    /**
     * @description ���ѧ��������Ϣ(����ѧ����Ϣ��ѧ�ѵ�����)
     * @return boolean
     * @author ��ѧ��
     * @date 2019/7/15
     */
    private boolean addSub() throws Exception
    {
        StringBuilder sql1=new StringBuilder()
                .append("insert into ae08(aae101,aae802,aae803,aae804,aae805,")
                .append("                 aae806)                            ")
                .append("		   values(?,curdate(),?,?,?,                 ")
                .append("		          ?)                                 ");

        Object args1[]={
                this.get("user"),
                this.get("aae803"),
                this.get("aae804"),
                this.get("aae805"),
                this.get("aae806")
        };

        this.appendSql(sql1.toString(),args1);

        Object aab103=Tools.getStuNumber();
        this.put("aab103",aab103);
        Object aab101=Tools.getSequence("aab101");

        StringBuilder sql2=new StringBuilder()
                .append("insert into ab01(aab101,aab102,aab103,aab104,aab105,")
                .append("                 aab106,aab107,aab108,aab109,aab110,")
                .append("                 aab111,aab112,aab113,aab114,aab115,")
                .append("                 aab116)                            ")
                .append("		   values(?,?,?,?,?,                         ")
                .append("				  ?,?,?,?,?,                         ")
                .append("				  ?,?,?,curdate(),'1',               ")
                .append("                 ?)                                 ");

        Object args2[]={
                aab101,
                this.get("aae804"),
                aab103,
                this.get("aab104"),
                this.get("aab105"),
                this.get("aab106"),
                this.get("aab107"),
                this.get("aab108"),
                this.get("aab109"),
                this.get("aab110"),
                this.get("aab111"),
                this.get("aab112"),
                this.get("aab113"),
                this.get("aae806")
        };

        this.appendSql(sql2.toString(),args2);

        String sql3="update ab03 set aab308=aab308+1 where aab301=?";

        this.appendSql(sql3,this.get("aab111"));

        StringBuilder sql4=new StringBuilder()
                .append("select a.aab504         ")
                .append("  from ab05 a,ab03 b    ")
                .append(" where a.aab501=b.aab501")
                .append("   and b.aab301=?       ");

        Object aab504=null;

        try
        {
            aab504=this.queryForMap(sql4.toString(),this.get("aab111")).get("aab504");
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return false;
        }

        StringBuilder sql5=new StringBuilder()
                .append("insert into ad02(aab101,aad202,aad203,aad204,aad206,aad207)")
                .append("          values(?,'ѧ��ѧ��',?,'0',?,0)                    ");

        Object args3[]={
                aab101,
                aab504,
                this.get("aae805")
        };

        this.appendSql(sql5.toString(),args3);

        boolean tag=this.executeTransaction();

        if(tag==true)
        {
            EA0801ServicesImpl service = new EA0801ServicesImpl();
            String content = "���ѧ�����Ϊ["+aab103+"]�ı�����Ϣ,ѧ����Ϣ��ѧ�ѵ�";
            String remark = "��ӱ�����Ϣ�ɹ�";
            service.addWorkRecord(content, this.get("user"), remark);
        }

        return tag;
    }
}
