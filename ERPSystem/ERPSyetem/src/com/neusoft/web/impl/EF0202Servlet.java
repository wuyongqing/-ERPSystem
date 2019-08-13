package com.neusoft.web.impl;

import com.neusoft.web.impl.EF02ControllerSupport;

/**
 * @author 张学正
 * @description 员工入职控制器
 * @date 2019/07/08
 */
public class EF0202Servlet extends EF02ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.update("addEmp","员工信息导入","员工编号为","aae103");
        return "addNModEmp";
    }
}
