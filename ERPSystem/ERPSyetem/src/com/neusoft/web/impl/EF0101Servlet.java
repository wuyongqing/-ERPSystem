package com.neusoft.web.impl;

import com.neusoft.web.impl.EF01ControllerSupport;

/**
 * @author 张学正
 * @description 无条件部门查询控制器
 * @date 2019/07/05
 */
public class EF0101Servlet extends EF01ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.savePageData();
        return "queryDep";
    }
}
