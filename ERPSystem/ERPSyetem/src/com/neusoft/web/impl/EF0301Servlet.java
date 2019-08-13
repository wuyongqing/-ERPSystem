package com.neusoft.web.impl;

import com.neusoft.web.impl.EF03ControllerSupport;

/**
 * @author 张学正
 * @description 员工履历查询控制器
 * @date 2019/07/09
 */
public class EF0301Servlet extends EF03ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.savePageData();
        return "empRec";
    }
}
