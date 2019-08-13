package com.neusoft.services.impl.EF;

import com.neusoft.services.JdbcServicesSupport;

import java.util.List;
import java.util.Map;

/**
 * @author 张学正
 * @description 物资变更记录服务类
 * @date 2019/07/11
 */
public class EF09ServicesImpl extends JdbcServicesSupport
{
    /**
     * @description 变更记录查询
     * @return List<Map<String,String>>
     * @author 张学正
     * @date 2019/7/11
     */
    @Override
    public List<Map<String, String>> query() throws Exception
    {
        StringBuilder sql=new StringBuilder()
                .append("select b.aae502,c.aae102,c.aae103,s.fvalue cnaae602,a.aae603,")
                .append("       a.aae604,a.aae605                                     ")
                .append("  from ae06 a,ae05 b,ae01 c,syscode s                        ")
                .append(" where a.aae501=b.aae501 and a.aae101=c.aae101               ")
                .append("   and a.aae602=s.fcode and s.fname='aae602'                 ")
                .append("   and a.aae501=?                                            ")
                .append(" order by a.aae603 desc                                      ");

        return this.queryForList(sql.toString(),this.get("aae501"));
    }
}
