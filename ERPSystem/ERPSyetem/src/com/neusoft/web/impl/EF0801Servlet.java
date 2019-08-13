package com.neusoft.web.impl;

import com.neusoft.web.impl.EF08ControllerSupport;

/**
 * @author 张学正
 * @description 无条件物资查询控制器
 * @date 2019/07/12
 */
public class EF0801Servlet extends EF08ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.savePageData();
        return "querySup";
    }
}
