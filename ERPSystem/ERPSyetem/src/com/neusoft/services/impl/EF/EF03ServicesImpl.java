package com.neusoft.services.impl.EF;

import com.neusoft.services.JdbcServicesSupport;

import java.util.List;
import java.util.Map;

/**
 * @author ��ѧ��
 * @description Ա������֧����
 * @date 2019/07/09
 */
public class EF03ServicesImpl extends JdbcServicesSupport
{
    /**
     * @description Ա��������ѯ
     * @return List<Map<String,String>>
     * @author ��ѧ��
     * @date 2019/7/9
     */
    @Override
    public List<Map<String, String>> query() throws Exception
    {
        StringBuilder sql=new StringBuilder()
                .append("select b.aae102,b.aae103,c.aae302 ocnaae301,d.aae302 ncnaae301,x.fvalue ocnaae1110,")
                .append("       y.fvalue ncnaae1110,a.aae204,a.aae205                                       ")
                .append("  from ae02 a,ae01 b,ae03 c,ae03 d,syscode x,syscode y                             ")
                .append(" where a.aae301=c.aae301 and a.ae0_aae301=d.aae301                                 ")
                .append("   and a.aae202=x.fcode and x.fname='aae1110'                                      ")
                .append("   and a.aae203=y.fcode and y.fname='aae1110'                                      ")
                .append("   and a.aae101=? and a.aae101=b.aae101                                            ")
                .append(" order by a.aae205                                                                 ");

        return this.queryForList(sql.toString(),this.get("aae101"));
    }
}
