package com.neusoft.web.impl;

import com.neusoft.web.impl.EF07ControllerSupport;

/**
 * @author 张学正
 * @description 新建物资申请控制器
 * @date 2019/07/10
 */
public class EF0702Servlet extends EF07ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.update("addReq","发起物资申请");
        return "addSupReq";
    }
}
