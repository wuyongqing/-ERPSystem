package com.neusoft.services.impl.EF;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;

import java.util.List;
import java.util.Map;

/**
 * @author ��ѧ��
 * @description ���Ź������ʵ����
 * @date 2019/07/05
 */
public class EF01ServicesImpl extends JdbcServicesSupport
{
    /**
     * @description ��һ���Ų�ѯ
     * @return Map<String,String>
     * @author ��ѧ��
     * @date 2019/7/5
     */
    @Override
    public Map<String, String> findById() throws Exception
    {
        String sql="select aae302,aae303,aae305,aae306,aae307 from ae03 where aae301=?";
        return this.queryForMap(sql,this.get("aae301"));
    }

    /**
     * @description ���������Ų�ѯ
     * @return List<Map<String,String>>
     * @author ��ѧ��
     * @date 2019/7/5
     */
    @Override
    public List<Map<String, String>> query() throws Exception
    {
        String sql="select aae301,aae302,aae303,aae305,aae306,aae307 from ae03 where aae301>0";
        return this.queryForList(sql);
    }

    /**
     * @description ���Ÿ��²���ͳһ���
     * @param utype ��������
     * @return boolean
     * @author ��ѧ��
     * @date 2019/7/5
     */
    @Override
    public boolean update(String utype) throws Exception
    {
        if (utype.equalsIgnoreCase("addDep"))
        {
            return this.addDep();
        }
        else if (utype.equalsIgnoreCase("modDep"))
        {
            return this.modDep();
        }
        else
        {
            throw new Exception("����[ EF01ServicesImpl ]�н�����δ����Ķ�������,���������� "+utype);
        }
    }

    /**
     * @description �½�����
     * @return boolean
     * @author ��ѧ��
     * @date 2019/7/5
     */
    private boolean addDep() throws Exception
    {
        StringBuilder sql=new StringBuilder()
                .append("insert into ae03(aae302,aae303,aae305,aae306,aae307)")
                .append("          values(?,?,?,?,?)                         ");
        Object args[]={
                this.get("aae302"),
                "0",
                this.get("aae305"),
                this.get("aae306"),
                this.get("aae307")
        };
        boolean tag=this.executeUpdate(sql.toString(),args)>0;

        if(tag==true)
        {
            EA0801ServicesImpl service = new EA0801ServicesImpl();
            String content = "�½�������Ϣ,������["+this.get("aae302")+"]";
            String remark = "�½�������Ϣ�ɹ�";
            service.addWorkRecord(content, this.get("user"), remark);
        }

        return tag;
    }

    /**
     * @description ���µ�һ������Ϣ
     * @return boolean
     * @author ��ѧ��
     * @date 2019/7/5
     */
    private boolean modDep() throws Exception
    {
        StringBuilder sql=new StringBuilder()
                .append("update ae03                               ")
                .append("   set aae302=?,aae305=?,aae306=?,aae307=?")
                .append(" where aae301=?                           ");
        Object args[]={
                this.get("aae302"),
                this.get("aae305"),
                this.get("aae306"),
                this.get("aae307"),
                this.get("aae301")
        };
        boolean tag=this.executeUpdate(sql.toString(),args)>0;

        if(tag==true)
        {
            EA0801ServicesImpl service = new EA0801ServicesImpl();
            String content = "�޸Ĳ�����Ϣ,������["+this.get("aae302")+"]";
            String remark = "�޸Ĳ�����Ϣ�ɹ�";
            service.addWorkRecord(content, this.get("user"), remark);
        }

        return tag;
    }
}
