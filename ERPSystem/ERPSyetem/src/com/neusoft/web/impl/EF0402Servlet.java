package com.neusoft.web.impl;

import com.neusoft.web.impl.EF04ControllerSupport;

/**
 * @author 张学正
 * @description 新建休假申请控制器
 * @date 2019/07/09
 */
public class EF0402Servlet extends EF04ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.update("addReq","提交申请");
        return "addVacReq";
    }
}
