package com.neusoft.web.impl;

import com.neusoft.web.impl.EF05ControllerSupport;

/**
 * @author 张学正
 * @description 员工个人休假申请查询控制器
 * @date 2019/07/12
 */
public class EF0501Servlet extends EF05ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.savePageData();
        return "myVacReq";
    }
}
