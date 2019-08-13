package com.neusoft.services.impl.EE;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author ��ѧ��
 * @description ��ѯ��¼������
 * @date 2019/07/13
 */
public class EE01ServicesImpl extends JdbcServicesSupport
{
    /**
     * @description ��һ��¼��ѯ
     * @return Map<String,String>
     * @author ��ѧ��
     * @date 2019/7/13
     */
    @Override
    public Map<String, String> findById() throws Exception
    {
        StringBuilder sql=new StringBuilder()
                .append("select a.aae701,b.aae101,b.aae102,b.aae103,a.aae702,")
                .append("       a.aae703,a.aae704,a.aae705,a.aae706,a.aae707,")
                .append("	    a.aae708,a.aae709,a.aae710,a.aae712          ")
                .append("  from ae07 a,ae01 b                                ")
                .append(" where a.aae101=b.aae101 and a.aae701=?             ");

        return this.queryForMap(sql.toString(),this.get("aae701"));
    }

    /**
     * @description ����������¼��ѯ
     * @return List<Map<String,String>>
     * @author ��ѧ��
     * @date 2019/7/13
     */
    @Override
    public List<Map<String, String>> query() throws Exception
    {
        Object aae102=this.get("qaae102");    //�Ӵ�������
        Object aae103=this.get("qaae103");    //�Ӵ��˱��
        Object baae702=this.get("baae702");   //��ѯʱ������
        Object eaae702=this.get("eaae702");   //��ѯʱ������
        Object aae703=this.get("qaae703");    //��ѯ�ص�
        Object aae704=this.get("qaae704");    //��ѯ������
        Object aae707=this.get("qaae707");    //ѧ������
        Object aae710=this.get("qaae710");    //��ѯ����

        StringBuilder sql=new StringBuilder()
                .append("select a.aae701,b.aae102,b.aae103,a.aae702,a.aae703,         ")
                .append("       a.aae704,s.fvalue cnaae705,a.aae706,a.aae707,a.aae708,")
                .append("	    a.aae709,a.aae710,a.aae712                            ")
                .append("  from ae07 a,ae01 b,syscode s                               ")
                .append(" where a.aae101=b.aae101                                     ")
                .append("   and a.aae705=s.fcode and s.fname='aae705'                 ");

        List<Object> paramList=new ArrayList<>();

        if (this.isNotNull(aae102))
        {
            sql.append(" and b.aae102 like ?");
            paramList.add("%"+aae102+"%");
        }
        if (this.isNotNull(aae103))
        {
            sql.append(" and b.aae103 like ?");
            paramList.add(aae103);
        }
        if (this.isNotNull(baae702))
        {
            sql.append(" and a.aae702>=?");
            paramList.add(baae702);
        }
        if (this.isNotNull(eaae702))
        {
            sql.append(" and a.aae702<=?");
            paramList.add(eaae702);
        }
        if (this.isNotNull(aae703))
        {
            sql.append(" and a.aae703 like ?");
            paramList.add("%"+aae703+"%");
        }
        if (this.isNotNull(aae704))
        {
            sql.append(" and a.aae704 like ?");
            paramList.add("%"+aae704+"%");
        }
        if (this.isNotNull(aae707))
        {
            sql.append(" and a.aae707 like ?");
            paramList.add("%"+aae707+"%");
        }
        if (this.isNotNull(aae710))
        {
            sql.append(" and a.aae710 like ?");
            paramList.add("%"+aae710+"%");
        }
        sql.append(" order by a.aae702 desc");

        return this.queryForList(sql.toString(),paramList.toArray());
    }

    /**
     * @description ��¼���²������
     * @return boolean
     * @author ��ѧ��
     * @date 2019/7/13
     */
    @Override
    public boolean update(String utype) throws Exception
    {
        if (utype.equalsIgnoreCase("addRec"))
        {
            return this.addRec();
        }
        else if (utype.equalsIgnoreCase("modRec"))
        {
            return this.modRec();
        }
        else
        {
            throw new Exception("����[ EE01ServicesImpl ]�н�����δ����Ķ�������,���������� "+utype);
        }
    }

    /**
     * @description �����ѯ��¼
     * @return boolean
     * @author ��ѧ��
     * @date 2019/7/13
     */
    private boolean addRec() throws Exception
    {
        StringBuilder sql=new StringBuilder()
                .append("insert into ae07(aae101,aae702,aae703,aae704,aae705,")
                .append("                 aae706,aae707,aae708,aae709,aae710,")
                .append("  				  aae711,aae712)                     ")
                .append("	       values(?,?,?,?,?,                         ")
                .append("		          ?,?,?,?,?,                         ")
                .append("				  current_timestamp(),?)			 ");

        Object args[]={
                this.get("user"),
                this.get("aae702"),
                this.get("aae703"),
                this.get("aae704"),
                this.get("aae705"),
                this.get("aae706"),
                this.get("aae707"),
                this.get("aae708"),
                this.get("aae709"),
                this.get("aae710"),
                this.get("aae712")
        };

        boolean tag=this.executeUpdate(sql.toString(),args)>0;

        if(tag==true)
        {
            EA0801ServicesImpl service = new EA0801ServicesImpl();
            String content = "�����ѯ��¼";
            String remark = "�����ѯ��¼�ɹ�";
            service.addWorkRecord(content, this.get("user"), remark);
        }

        return tag;
    }

    /**
     * @description �޸���ѯ��¼
     * @return boolean
     * @author ��ѧ��
     * @date 2019/7/13
     */
    private boolean modRec() throws Exception
    {
        StringBuilder sql=new StringBuilder()
                .append("update ae07 set aae703=?,aae704=?,aae705=?,aae706=?,aae707=?,                 ")
                .append("                aae708=?,aae709=?,aae710=?,aae711=current_timestamp(),aae712=?")
                .append("		   where aae701=?		                                               ");

        Object args[]={
                this.get("aae703"),
                this.get("aae704"),
                this.get("aae705"),
                this.get("aae706"),
                this.get("aae707"),
                this.get("aae708"),
                this.get("aae709"),
                this.get("aae710"),
                this.get("aae712"),
                this.get("aae701")
        };

        boolean tag=this.executeUpdate(sql.toString(),args)>0;

        if(tag==true)
        {
            EA0801ServicesImpl service = new EA0801ServicesImpl();
            String content = "�޸���ˮ��Ϊ["+this.get("aae701")+"]����ѯ��¼";
            String remark = "�޸���ѯ��¼�ɹ�";
            service.addWorkRecord(content, this.get("user"), remark);
        }

        return tag;
    }
}
