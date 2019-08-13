package com.neusoft.web.impl;

import com.neusoft.web.impl.EF02ControllerSupport;

/**
 * @author 张学正
 * @description 不定条件员工查询控制器
 * @date 2019/07/08
 */
public class EF0201Servlet extends EF02ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.savePageData();
        return "queryEmp";
    }
}
