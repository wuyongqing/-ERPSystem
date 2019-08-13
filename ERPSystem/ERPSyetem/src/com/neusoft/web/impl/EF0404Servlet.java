package com.neusoft.web.impl;

import com.neusoft.web.impl.EF04ControllerSupport;

/**
 * @author 张学正
 * @description 休假申请单一实例查询控制器
 * @date 2019/07/10
 */
public class EF0404Servlet extends EF04ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.savePageInstance();
        return "reviewVacReq";
    }
}
