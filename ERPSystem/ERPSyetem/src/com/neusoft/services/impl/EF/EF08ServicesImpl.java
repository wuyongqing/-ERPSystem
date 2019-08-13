package com.neusoft.services.impl.EF;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.services.impl.EA.EA0801ServicesImpl;

import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * @author 张学正
 * @description 物资管理服务类
 * @date 2019/07/11
 */
public class EF08ServicesImpl extends JdbcServicesSupport
{
    /**
     * @description 用于变更物资的单一实例查询
     * @return Map<String,String>
     * @author 张学正
     * @date 2019/7/12
     */
    @Override
    public Map<String, String> findById() throws Exception
    {
        String sql="select aae502,aae503 from ae05 where aae501=?";

        return this.queryForMap(sql,this.get("aae501"));
    }

    /**
     * @description 物资查询
     * @return List<Map<String,String>>
     * @author 张学正
     * @date 2019/7/11
     */
    @Override
    public List<Map<String, String>> query() throws Exception
    {
        String sql="select aae501,aae502,aae503,aae504 from ae05";
        return this.queryForList(sql);
    }

    /**
     * @description 物资管理更新操作入口
     * @param utype 操作类型
     * @return boolean
     * @author 张学正
     * @date 2019/7/11
     */
    @Override
    public boolean update(String utype) throws Exception
    {
        if (utype.equalsIgnoreCase("modSup"))
        {
            return this.modSup();
        }
        else if (utype.equalsIgnoreCase("addSup"))
        {
            return this.addSup();
        }
        else
        {
            throw new Exception("在类[ EF08ServicesImpl ]中进行了未定义的动作调用,动作名称是 "+utype);
        }
    }

    /**
     * @description 物资变更
     * @return boolean
     * @author 张学正
     * @date 2019/7/11
     */
    private boolean modSup() throws Exception
    {
        String sql0="select aae101 from ae01 where aae103=?";
        Object aae101=null;

        try
        {
            aae101=this.queryForMap(sql0,this.get("aae103")).get("aae101");
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return false;
        }

        StringBuilder sql1=new StringBuilder()
                .append("insert into ae06(aae501,aae101,aae602,aae603,aae604,aae605)")
                .append("          values(?,?,?,curdate(),?,?)				        ");

        Object args1[]={
                this.get("aae501"),
                aae101,
                this.get("aae602"),
                this.get("aae604"),
                this.get("aae605")
        };

        this.appendSql(sql1.toString(),args1);

        String sql2=null;

        String aae602=(String) this.get("aae602");

        if (Objects.equals(aae602, "1"))
            sql2="update ae05 set aae503=aae503+? where aae501=?";
        else
            sql2="update ae05 set aae503=aae503-? where aae501=?";

        Object args2[]={
                this.get("aae604"),
                this.get("aae501")
        };

        this.appendSql(sql2,args2);

        boolean tag=this.executeTransaction();

        if(tag==true)
        {
            EA0801ServicesImpl service = new EA0801ServicesImpl();
            String content = "变更流水号为["+this.get("aae501")+"]的物资信息";
            String remark = "变更物资信息成功";
            service.addWorkRecord(content, this.get("user"), remark);
        }

        return tag;
    }

    /**
     * @description 新建物资项
     * @return boolean
     * @author 张学正
     * @date 2019/7/11
     */
    private boolean addSup() throws Exception
    {
        String sql="insert into ae05(aae502,aae503,aae504) values(?,0,?)";

        Object args[]={
                this.get("aae502"),
                this.get("aae504")
        };

        boolean tag=this.executeUpdate(sql,args)>0;

        if(tag==true)
        {
            EA0801ServicesImpl service = new EA0801ServicesImpl();
            String content = "新建物资信息";
            String remark = "新建物资信息成功";
            service.addWorkRecord(content, this.get("user"), remark);
        }

        return tag;
    }
}
