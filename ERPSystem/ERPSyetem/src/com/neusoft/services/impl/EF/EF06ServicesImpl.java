package com.neusoft.services.impl.EF;

import com.neusoft.services.JdbcServicesSupport;

import java.util.List;
import java.util.Map;

/**
 * @author 张学正
 * @description 员工个人物资申请服务类
 * @date 2019/07/12
 */
public class EF06ServicesImpl extends JdbcServicesSupport
{
    /**
     * @description 无条件个人申请查询
     * @return List<Map<String,String>>
     * @author 张学正
     * @date 2019/7/12
     */
    @Override
    public List<Map<String, String>> query() throws Exception
    {
        StringBuilder sql=new StringBuilder()
                .append("select a.aac601,b.aae102,b.aae103,d.aae502,a.aac602,         ")
                .append("       a.aac603,a.aac604,s.fvalue cnaac605,a.aac606,a.aac607,")
                .append("	    c.aae102 ac0_aae102,a.aac608                          ")
                .append("  from (((ac06 a left join ae01 c on a.ac0_aae101=c.aae101)  ")
                .append(" inner join ae01 b on a.aae101=b.aae101)                     ")
                .append(" inner join ae05 d on a.aae501=d.aae501)                     ")
                .append(" inner join syscode s on a.aac605=s.fcode                    ")
                .append(" where s.fname='aac605' and b.aae103=?                       ")
                .append(" order by a.aac602 desc                                      ");

        return this.queryForList(sql.toString(),this.get("numb"));
    }
}

