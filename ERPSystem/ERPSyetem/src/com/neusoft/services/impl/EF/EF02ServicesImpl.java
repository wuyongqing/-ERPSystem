package com.neusoft.services.impl.EF;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;
import com.neusoft.system.tools.Tools;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author 张学正
 * @description 员工管理服务类
 * @date 2019/07/05
 */
public class EF02ServicesImpl extends JdbcServicesSupport
{
    /**
     * @description 单一员工查询
     * @return Map<String,String>
     * @author 张学正
     * @date 2019/7/8
     */
    @Override
    public Map<String, String> findById() throws Exception
    {
        StringBuilder sql=new StringBuilder()
                .append("select a.aae102,a.aae103,b.aae302 cnaae301,a.aae104,a.aae105,")
                .append("       a.aae106,a.aae107,a.aae108,a.aae109,a.aae1110,        ")
                .append("       c.fvalue pos,a.aae1111,a.aae1112,a.aae1113,a.aae1114  ")
                .append("  from ae01 a,ae03 b,syscode c                               ")
                .append(" where a.aae101=? and b.aae301=a.aae301                      ")
                .append("   and a.aae1110=c.fcode and c.fname='aae1110'               ");

        return this.queryForMap(sql.toString(),this.get("aae101"));
    }

    /**
     * @description 不定条件查询员工
     * @return List<Map<String,String>>
     * @author 张学正
     * @date 2019/7/5
     */
    @Override
    public List<Map<String, String>> query() throws Exception
    {
        Object aae102=this.get("qaae102");    //姓名
        Object aae103=this.get("qaae103");    //编号
        Object aae105=this.get("qaae105");    //性别(编码) 1--男,2--女,3--不确定
        Object aae106=this.get("qaae106");    //民族(编码) 按标准编码表
        Object aae1110=this.get("qaae1110");  //职务(编码) 0--无,1--一般员工,2--部门主管,3--教师,4--班主任,5--门卫
        Object aae1112=this.get("qaae1112");  //状态(编码) 1--正常,2--休假,3--离职
        Object cnaae301=this.get("qcnaae301");//部门(名称)
        Object aae1114=this.get("qaae1114");  //身份证号
        Object baae104=this.get("baae104");   //生日下限
        Object eaae104=this.get("eaae104");   //生日上限

        StringBuilder sql=new StringBuilder()
                .append("select a.aae101,a.aae102,a.aae103,b.aae302 cnaae301,a.aae104,            ")
                .append("       x.fvalue cnaae105,y.fvalue cnaae106,a.aae107,a.aae1114,a.aae108,  ")
                .append("       a.aae109,z.fvalue cnaae1110,a.aae1111,c.fvalue cnaae1112,a.aae1113")
                .append("  from ae01 a,syscode x,syscode y,syscode z,ae03 b,syscode c             ")
                .append(" where a.aae105=x.fcode  and x.fname='aae105'                            ")
                .append("   and a.aae106=y.fcode  and y.fname='aae106'                            ")
                .append("   and a.aae1110=z.fcode and z.fname='aae1110'                           ")
                .append("   and a.aae1112=c.fcode and c.fname='aae1112'                           ")
                .append("   and b.aae301=a.aae301                                                 ");

        List<Object> paramList=new ArrayList<>();

        if (this.isNotNull(aae102))
        {
            sql.append(" and a.aae102 like ?");
            paramList.add("%"+aae102+"%");
        }
        if (this.isNotNull(aae103))
        {
            sql.append(" and a.aae103 like ?");
            paramList.add("%"+aae103+"%");
        }
        if (this.isNotNull(aae105))
        {
            sql.append(" and a.aae105 like ?");
            paramList.add(aae105);
        }
        if (this.isNotNull(aae106))
        {
            sql.append(" and a.aae106 like ?");
            paramList.add(aae106);
        }
        if (this.isNotNull(aae1110))
        {
            sql.append(" and a.aae1110 like ?");
            paramList.add(aae1110);
        }
        if (this.isNotNull(aae1112))
        {
            sql.append(" and a.aae1112 like ?");
            paramList.add(aae1112);
        }
        System.out.println(cnaae301);
        if (this.isNotNull(cnaae301))
        {
            sql.append(" and b.aae302 like ?");
            paramList.add("%"+cnaae301+"%");
        }
        if (this.isNotNull(aae1114))
        {
            sql.append(" and a.aae1114 like ?");
            paramList.add("%"+aae1114+"%");
        }
        if (this.isNotNull(baae104))
        {
            sql.append(" and a.aae104>=?");
            paramList.add(baae104);
        }
        if (this.isNotNull(eaae104))
        {
            sql.append(" and a.aae104<=?");
            paramList.add(eaae104);
        }
        sql.append(" order by a.aae103");

        return this.queryForList(sql.toString(),paramList.toArray());
    }

    /**
     * @description 员工更新操作统一入口
     * @param utype 操作类型
     * @return boolean
     * @author 张学正
     * @date 2019/7/8
     */
    @Override
    public boolean update(String utype) throws Exception
    {
        if (utype.equalsIgnoreCase("addEmp"))
        {
            return this.addEmp();
        }
        else if (utype.equalsIgnoreCase("delEmp"))
        {
            return this.delEmp();
        }
        else if (utype.equalsIgnoreCase("modEmp"))
        {
            return this.modEmp();
        }
        else if (utype.equalsIgnoreCase("tranEmp"))
        {
            return this.tranEmp();
        }
        else
        {
            throw new Exception("在类[ EF02ServicesImpl ]中进行了未定义的动作调用,动作名称是 "+utype);
        }
    }

    /**
     * @description 员工入职
     * @return boolean
     * @author 张学正
     * @date 2019/7/8
     */
    private boolean addEmp() throws Exception
    {
        String sql0="select aae301 from ae03 where aae302=?";
        Object aae301=null;

        try
        {
            aae301=this.queryForMap(sql0,this.get("cnaae301")).get("aae301");
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return false;
        }

        Object aae103=Tools.getEmpNumber();
        this.put("aae103",aae103);
        Object aae101=Tools.getSequence("aae101");

        StringBuilder sql1=new StringBuilder()
                .append("insert into ae01(aae101,aae102,aae103,aae301,aae104,     ")
                .append("                 aae105,aae106,aae107,aae108,aae109,     ")
                .append("                 aae1110,aae1111,aae1112,aae1113,aae1114)")
                .append("                 values(?,?,?,?,?,                       ")
                .append("                        ?,?,?,?,?,                       ")
                .append("                        ?,?,'1',?,?)			          ");

        Object args1[]={
                aae101,
                this.get("aae102"),
                aae103,
                aae301,
                this.get("aae104"),
                this.get("aae105"),
                this.get("aae106"),
                this.get("aae107"),
                this.get("aae108"),
                this.get("aae109"),
                this.get("aae1110"),
                this.get("aae1111"),
                this.get("aae1113"),
                this.get("aae1114")
        };

        this.appendSql(sql1.toString(),args1);

        String sql2="update ae03 set aae303=aae303+1 where aae301=?";

        this.appendSql(sql2,aae301);

        StringBuilder sql3=new StringBuilder()
                .append("insert into ae02(aae101,aae301,ae0_aae301,aae202,aae203,")
                .append("                 aae204,aae205)                         ")
                .append("		  values(?,0,?,'0',?,                            ")
                .append("			     '入职',?)	                             ");

        Object args2[]={
                aae101,
                aae301,
                this.get("aae1110"),
                this.get("aae205")
        };

        this.appendSql(sql3.toString(),args2);

        boolean tag=this.executeTransaction();

        if(tag==true)
        {
            EA0801ServicesImpl service = new EA0801ServicesImpl();
            String content = "新员工入职,编号["+aae103+"]";
            String remark = "新员工入职成功";
            service.addWorkRecord(content, this.get("user"), remark);
        }

        return tag;
    }

    /**
     * @description 员工离职
     * @return boolean
     * @author 张学正
     * @date 2019/7/8
     */
    private boolean delEmp() throws Exception
    {
        String sql1="select aae301 from ae01 where aae101=? ";
        Object oaae301=null;

        try
        {
            oaae301=this.queryForMap(sql1,this.get("aae101")).get("aae301");
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return false;
        }

        String sql2="update ae01 set aae301=0,aae1110='0',aae1111=0,aae1112='3' where aae101=?";
        this.appendSql(sql2,this.get("aae101"));

        String sql3="update ae03 set aae303=aae303-1 where aae301=?";
        this.appendSql(sql3,oaae301);

        StringBuilder sql4=new StringBuilder()
                .append("insert into ae02(aae101,aae301,ae0_aae301,aae202,aae203,")
                .append("                 aae204,aae205)                         ")
                .append("	       values(?,?,0,?,'0',                           ")
                .append("				  ?,?)                                   ");
        Object args[]={
                this.get("aae101"),
                oaae301,
                this.get("aae1110"),
                this.get("aae204"),
                this.get("aae205")
        };
        this.appendSql(sql4.toString(),args);

        boolean tag=this.executeTransaction();

        if(tag==true)
        {
            EA0801ServicesImpl service = new EA0801ServicesImpl();
            String content = "员工离职,流水号["+this.get("aae101")+"]";
            String remark = "员工离职成功";
            service.addWorkRecord(content, this.get("user"), remark);
        }

        return tag;
    }

    /**
     * @description 单一员工信息更新(不涉及职务部门)
     * @return boolean
     * @author 张学正
     * @date 2019/7/8
     */
    private boolean modEmp() throws Exception
    {
        StringBuilder sql=new StringBuilder()
                .append("update ae01 set aae102=?,aae104=?,aae105=?,aae106=?,aae107=?,   ")
                .append("                aae108=?,aae109=?,aae1111=?,aae1112=?,aae1113=?,")
                .append("                aae1114=?                                       ")
                .append("		   where aae101=?                                        ");
        Object args[]={
                this.get("aae102"),
                this.get("aae104"),
                this.get("aae105"),
                this.get("aae106"),
                this.get("aae107"),
                this.get("aae108"),
                this.get("aae109"),
                this.get("aae1111"),
                this.get("aae1112"),
                this.get("aae1113"),
                this.get("aae1114"),
                this.get("aae101")
        };
        boolean tag=this.executeUpdate(sql.toString(),args)>0;

        if(tag==true)
        {
            EA0801ServicesImpl service = new EA0801ServicesImpl();
            String content = "修改员工流水号为["+this.get("aae101")+"]的员工信息";
            String remark = "修改员工信息成功";
            service.addWorkRecord(content, this.get("user"), remark);
        }

        return tag;
    }

    /**
     * @description 员工调职
     * @return boolean
     * @author 张学正
     * @date 2019/7/8
     */
    private boolean tranEmp() throws Exception
    {
        String sql0="select aae301 from ae03 where aae302=?";
        Object naae301=null;

        try
        {
            naae301=this.queryForMap(sql0,this.get("ncnaae301")).get("aae301");
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return false;
        }

        String sql1="select aae301 from ae01 where aae101=? ";
        Object oaae301=null;

        try
        {
            oaae301=this.queryForMap(sql1,this.get("aae101")).get("aae301");
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return false;
        }

        String sql2="update ae01 set aae301=?,aae1110=?,aae1111=? where aae101=?";
        Object args1[]={
                naae301,
                this.get("naae1110"),
                this.get("naae1111"),
                this.get("aae101")
        };
        this.appendSql(sql2,args1);

        if (oaae301!=naae301)
        {
            String sql3="update ae03 set aae303=aae303-1 where aae301=?";
            this.appendSql(sql3,oaae301);

            String sql4="update ae03 set aae303=aae303+1 where aae301=?";
            this.appendSql(sql4,naae301);
        }

        StringBuilder sql5=new StringBuilder()
                .append("insert into ae02(aae101,aae301,ae0_aae301,aae202,aae203,")
                .append("                 aae204,aae205)                         ")
                .append("	      values(?,?,?,?,?,                              ")
                .append("				 ?,?)                                    ");
        Object args2[]={
                this.get("aae101"),
                oaae301,
                naae301,
                this.get("aae1110"),
                this.get("naae1110"),
                this.get("aae204"),
                this.get("aae205")
        };
        this.appendSql(sql5.toString(),args2);

        boolean tag=this.executeTransaction();

        if(tag==true)
        {
            EA0801ServicesImpl service = new EA0801ServicesImpl();
            String content = "修改员工流水号为["+this.get("aae101")+"]的职务信息";
            String remark = "修改员工职务信息成功";
            service.addWorkRecord(content, this.get("user"), remark);
        }

        return tag;
    }
}
