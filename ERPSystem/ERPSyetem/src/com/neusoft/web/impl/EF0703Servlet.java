package com.neusoft.web.impl;

import com.neusoft.web.impl.EF07ControllerSupport;

/**
 * @author 张学正
 * @description 审批物资申请控制器
 * @date 2019/07/10
 */
public class EF0703Servlet extends EF07ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.update("reviewReq","审批");
        return "reviewSupReq";
    }
}
