package com.neusoft.web.impl;

import com.neusoft.web.impl.EF02ControllerSupport;

/**
 * @author 张学正
 * @description 员工离职控制器
 * @date 2019/07/08
 */
public class EF0207Servlet extends EF02ControllerSupport
{
    @Override
    public String execute() throws Exception {
        this.update("delEmp","离职信息导入");
        return "delNTranEmp";
    }
}
