package com.neusoft.services.impl.EF;

import com.neusoft.services.JdbcServicesSupport;

import java.util.List;
import java.util.Map;

/**
 * @author 张学正
 * @description 员工个人休假申请服务类
 * @date 2019/07/12
 */
public class EF05ServicesImpl extends JdbcServicesSupport
{
    /**
     * @description 无条件个人申请查询
     * @return List<Map<jString,String>>
     * @author 张学正
     * @date 2019/7/12
     */
    @Override
    public List<Map<String, String>> query() throws Exception
    {
        StringBuilder sql=new StringBuilder()
                .append("select a.aae401,b.aae102,b.aae103,a.aae402,y.fvalue cnaae403,")
                .append("       a.aae404,a.aae405,a.aae406,x.fvalue cnaae407,a.aae408,")
                .append("	    a.aae409,c.aae102 ae0_aae102,a.aae410                 ")
                .append("  from (((ae04 a left join ae01 c on a.ae0_aae101=c.aae101)  ")
                .append("       inner join ae01 b on a.aae101=b.aae101)               ")
                .append("       inner join syscode x on a.aae407=x.fcode)             ")
                .append("       inner join syscode y on a.aae403=y.fcode              ")
                .append(" where x.fname='aae407' and y.fname='aae403'                 ")
                .append("   and b.aae103=?                                            ")
                .append(" order by a.aae402 desc                                      ");

        return this.queryForList(sql.toString(),this.get("numb"));
    }
}
