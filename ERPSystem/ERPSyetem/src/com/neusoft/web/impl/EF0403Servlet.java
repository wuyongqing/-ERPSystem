package com.neusoft.web.impl;

import com.neusoft.web.impl.EF04ControllerSupport;

/**
 * @author 张学正
 * @description 审批休假申请控制器
 * @date 2019/07/10
 */
public class EF0403Servlet extends EF04ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.update("reviewReq","审批");
        return "reviewVacReq";
    }
}
