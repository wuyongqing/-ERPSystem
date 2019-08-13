package com.neusoft.services.impl.EF;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author 张学正
 * @description 物资申请管理服务类
 * @date 2019/07/10
 */
public class EF07ServicesImpl extends JdbcServicesSupport
{
    /**
     * @description 用于审批的单一申请查询
     * @return Map<String,String>
     * @author 张学正
     * @date 2019/7/10
     */
    @Override
    public Map<String, String> findById() throws Exception
    {
        StringBuilder sql=new StringBuilder()
                .append("select a.aac601,b.aae102,b.aae103,c.aae502,a.aac602,   ")
                .append("       a.aac603,a.aac604                               ")
                .append("  from ((ac06 a inner join ae01 b on a.aae101=b.aae101)")
                .append(" inner join ae05 c on a.aae501=c.aae501)               ")
                .append(" inner join syscode s on a.aac605=s.fcode              ")
                .append(" where s.fname='aac605' and a.aac605='1' and a.aac601=?");

        return this.queryForMap(sql.toString(),this.get("aac601"));
    }

    /**
     * @description 物资申请不定条件查询
     * @return List<Map<String,String>>
     * @author 张学正
     * @date 2019/7/10
     */
    @Override
    public List<Map<String, String>> query() throws Exception
    {
        Object aae102=this.get("qaae102");    //申请人姓名
        Object aae103=this.get("qaae103");    //申请人编号
        Object aae502=this.get("qaae502");    //申请物资名
        Object baac602=this.get("baac602");   //申请时间下限
        Object eaac602=this.get("eaac602");   //申请时间上限
        Object aac605=this.get("qaac605");    //审批状态

        StringBuilder sql=new StringBuilder()
                .append("select a.aac601,b.aae102,b.aae103,d.aae502,a.aac602,         ")
                .append("       a.aac603,a.aac604,s.fvalue cnaac605,a.aac606,a.aac607,")
                .append("	    c.aae102 ac0_aae102,a.aac608                          ")
                .append("  from (((ac06 a left join ae01 c on a.ac0_aae101=c.aae101)  ")
                .append(" inner join ae01 b on a.aae101=b.aae101)                     ")
                .append(" inner join ae05 d on a.aae501=d.aae501)                     ")
                .append(" inner join syscode s on a.aac605=s.fcode                    ")
                .append(" where s.fname='aac605'                                      ");

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
        if (this.isNotNull(aae502))
        {
            sql.append(" and d.aae502 like ?");
            paramList.add("%"+aae502+"%");
        }
        if (this.isNotNull(aac605))
        {
            sql.append(" and a.aac605 like ?");
            paramList.add(aac605);
        }
        if (this.isNotNull(baac602))
        {
            sql.append(" and a.aac602>=?");
            paramList.add(baac602);
        }
        if (this.isNotNull(eaac602))
        {
            sql.append(" and a.aac602<=?");
            paramList.add(eaac602);
        }
        sql.append(" order by a.aac602 desc");

        return this.queryForList(sql.toString(),paramList.toArray());
    }

    /**
     * @description 物资申请更新操作统一入口
     * @param utype 操作类型
     * @return boolean
     * @author 张学正
     * @date 2019/7/10
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
            throw new Exception("在类[ EF07ServicesImpl ]中进行了未定义的动作调用,动作名称是 "+utype);
        }
    }

    /**
     * @description 发起物资申请
     * @return boolean
     * @author 张学正
     * @date 2019/7/10
     */
    private boolean addReq() throws Exception
    {
        String sql0="select aae501 from ae05 where aae502=?";
        Object aae501=null;

        try
        {
            aae501=this.queryForMap(sql0,this.get("aae502")).get("aae501");
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return false;
        }

        StringBuilder sql1=new StringBuilder()
                .append("insert into ac06(aae101,aae501,aac602,aac603,aac604,aac605)")
                .append("          values(?,?,curdate(),?,?,?)");

        Object args[]={
                this.get("user"),
                aae501,
                this.get("aac603"),
                this.get("aac604"),
                "1"
        };

        boolean tag=this.executeUpdate(sql1.toString(),args)>0;

        if(tag==true)
        {
            EA0801ServicesImpl service = new EA0801ServicesImpl();
            String content = "新建物资申请";
            String remark = "新建物资申请成功";
            service.addWorkRecord(content, this.get("user"), remark);
        }

        return tag;
    }

    /**
     * @description 审核物资申请
     * @return boolean
     * @author 张学正
     * @date 2019/7/10
     */
    private boolean reviewReq() throws Exception
    {
        String sql="update ac06 set aac605=?,aac606=curdate(),aac607=?,ac0_aae101=?,aac608=?"+
                   " where aac601=?";

        Object args[]={
                this.get("aac605"),
                this.get("aac607"),
                this.get("user"),
                this.get("aac608"),
                this.get("aac601")
        };

        boolean tag=this.executeUpdate(sql,args)>0;

        if(tag==true)
        {
            EA0801ServicesImpl service = new EA0801ServicesImpl();
            String content = "审核流水号为["+this.get("aac601")+"]的物资申请";
            String remark = "审核物资申请成功";
            service.addWorkRecord(content, this.get("user"), remark);
        }

        return tag;
    }
}
