package com.neusoft.web.impl;

import com.neusoft.web.impl.EF07ControllerSupport;

/**
 * @author 张学正
 * @description 物资申请单一实例查询控制器
 * @date 2019/07/10
 */
public class EF0704Servlet extends EF07ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.savePageInstance();
        return "reviewSupReq";
    }
}
