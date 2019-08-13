package com.neusoft.services.impl.EF;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author ��ѧ��
 * @description �ݼٹ��������
 * @date 2019/07/09
 */
public class EF04ServicesImpl extends JdbcServicesSupport
{
    /**
     * @description ���������ĵ�һ�����ѯ
     * @return Map<String,String>
     * @author ��ѧ��
     * @date 2019/7/9
     */
    @Override
    public Map<String, String> findById() throws Exception
    {
        StringBuilder sql=new StringBuilder()
                .append("select a.aae401,b.aae102,b.aae103,a.aae402,y.fvalue cnaae403,")
                .append("       a.aae404,a.aae405,a.aae406                            ")
                .append("  from ((ae04 a inner join ae01 b on a.aae101=b.aae101)      ")
                .append("       inner join syscode x on a.aae407=x.fcode)             ")
                .append("       inner join syscode y on a.aae403=y.fcode              ")
                .append(" where x.fname='aae407' and y.fname='aae403' and a.aae407='1'")
                .append("   and a.aae401=?                                            ");

        return this.queryForMap(sql.toString(),this.get("aae401"));
    }

    /**
     * @description ������ѯ�ݼ�����
     * @return List<Map<String,String>>
     * @author ��ѧ��
     * @date 2019/7/9
     */
    @Override
    public List<Map<String, String>> query() throws Exception
    {
        Object aae102=this.get("qaae102");    //����������
        Object aae103=this.get("qaae103");    //�����˱��
        Object aae403=this.get("qaae403");    //��������
        Object aae407=this.get("qaae407");    //���״̬
        Object baae405=this.get("baae405");   //��ʼʱ������
        Object eaae405=this.get("eaae405");   //��ʼʱ������
        Object baae406=this.get("baae406");   //����ʱ������
        Object eaae406=this.get("eaae406");   //����ʱ������

        StringBuilder sql=new StringBuilder()
                .append("select a.aae401,b.aae102,b.aae103,a.aae402,y.fvalue cnaae403,")
                .append("       a.aae404,a.aae405,a.aae406,x.fvalue cnaae407,a.aae408,")
                .append("	    a.aae409,c.aae102 ae0_aae102,a.aae410                 ")
                .append("  from (((ae04 a left join ae01 c on a.ae0_aae101=c.aae101)  ")
                .append("       inner join ae01 b on a.aae101=b.aae101)               ")
                .append("       inner join syscode x on a.aae407=x.fcode)             ")
                .append("       inner join syscode y on a.aae403=y.fcode              ")
                .append(" where x.fname='aae407' and y.fname='aae403'                 ");

        List<Object> paramList=new ArrayList<>();

        if (this.isNotNull(aae102))
        {
            sql.append(" and b.aae102 like ?");
            paramList.add("%"+aae102+"%");
        }
        if (this.isNotNull(aae103))
        {
            sql.append(" and b.aae103 like ?");
            paramList.add("%"+aae103+"%");
        }
        if (this.isNotNull(aae403))
        {
            sql.append(" and a.aae403 like ?");
            paramList.add(aae403);
        }
        if (this.isNotNull(aae407))
        {
            sql.append(" and a.aae407 like ?");
            paramList.add(aae407);
        }
        if (this.isNotNull(baae405))
        {
            sql.append(" and a.aae405>=?");
            paramList.add(baae405);
        }
        if (this.isNotNull(eaae405))
        {
            sql.append(" and a.aae405<=?");
            paramList.add(eaae405);
        }
        if (this.isNotNull(baae406))
        {
            sql.append(" and a.aae406>=?");
            paramList.add(baae406);
        }
        if (this.isNotNull(eaae406))
        {
            sql.append(" and a.aae406<=?");
            paramList.add(eaae406);
        }
        sql.append(" order by a.aae402 desc");

        return this.queryForList(sql.toString(),paramList.toArray());
    }

    /**
     * @description �ݼٹ�����²���ͳһ���
     * @param utype ��������
     * @return boolean
     * @author ��ѧ��
     * @date 2019/7/9
     */
    @Override
    public boolean update(String utype) throws Exception
    {
        if (utype.equalsIgnoreCase("addReq"))
        {
            return this.addReq();
        }
        else if (utype.equalsIgnoreCase("reviewReq"))
        {
            return this.reviewReq();
        }
        else
        {
            throw new Exception("����[ EF04ServicesImpl ]�н�����δ����Ķ�������,���������� "+utype);
        }
    }

    /**
     * @description Ա���½��ݼ�����
     * @return boolean
     * @author ��ѧ��
     * @date 2019/7/9
     */
    private boolean addReq() throws Exception
    {
        StringBuilder sql=new StringBuilder()
                .append("insert into ae04(aae101,aae402,aae403,aae404,aae405,")
                .append("                 aae406,aae407)                     ")
                .append("		   values(?,curdate(),?,?,?,                 ")
                .append("			      ?,?)	                             ");

        Object args[]={
                this.get("user"),
                this.get("aae403"),
                this.get("aae404"),
                this.get("aae405"),
                this.get("aae406"),
                "1"
        };

        boolean tag=this.executeUpdate(sql.toString(),args)>0;

        if(tag==true)
        {
            EA0801ServicesImpl service = new EA0801ServicesImpl();
            String content = "�½��ݼ�����";
            String remark = "�½��ݼ�����ɹ�";
            service.addWorkRecord(content, this.get("user"), remark);
        }

        return tag;
    }

    /**
     * @description �������
     * @return boolean
     * @author ��ѧ��
     * @date 2019/7/9
     */
    private boolean reviewReq() throws Exception
    {
        String sql="update ae04 set aae407=?,aae408=?,aae409=curdate(),ae0_aae101=?,aae410=?"+
                   " where aae401=?";

        Object args[]={
                this.get("aae407"),
                this.get("aae408"),
                this.get("user"),
                this.get("aae410"),
                this.get("aae401")
        };

        boolean tag=this.executeUpdate(sql,args)>0;

        if(tag==true)
        {
            EA0801ServicesImpl service = new EA0801ServicesImpl();
            String content = "�����ˮ��Ϊ["+this.get("aae401")+"]���ݼ�����";
            String remark = "����ݼ�����ɹ�";
            service.addWorkRecord(content, this.get("user"), remark);
        }

        return tag;
    }
}
