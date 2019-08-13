package com.neusoft.web.impl;

import com.neusoft.web.impl.EF02ControllerSupport;

/**
 * @author 张学正
 * @description 员工调职控制器
 * @date 2019/07/08
 */
public class EF0206Servlet extends EF02ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.update("tranEmp","职务信息变更");
        return "delNTranEmp";
    }
}
