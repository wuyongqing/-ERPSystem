package com.neusoft.services.impl.EE;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;
import com.neusoft.system.tools.Tools;

/**
 * @author 张学正
 * @description 住宿信息导入服务类
 * @date 2019/07/16
 */
public class EE03ServicesImpl extends JdbcServicesSupport
{
    /**
     * @description 住宿信息导入入口
     * @param utype 操作类型
     * @return boolean
     * @author 张学正
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
            throw new Exception("在类[ EE03ServicesImpl ]中进行了未定义的动作调用,动作名称是 "+utype);
        }
    }

    /**
     * @description 住宿信息生成(包含缴费单)
     * @return boolean
     * @author 张学正
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
                .append("          values(?,'住宿费',?,'0',?,0)                      ");

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
            String content = "添加学生编号为["+this.get("aab103")+"]的入住信息及住宿费缴费单";
            String remark = "添加入住信息成功";
            service.addWorkRecord(content, this.get("user"), remark);
        }

        return tag;
    }
}
