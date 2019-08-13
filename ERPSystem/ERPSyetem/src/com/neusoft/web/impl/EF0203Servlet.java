package com.neusoft.web.impl;

import com.neusoft.web.impl.EF02ControllerSupport;

/**
 * @author 张学正
 * @description 员工信息修改控制器
 * @date 2019/07/08
 */
public class EF0203Servlet extends EF02ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.update("modEmp","员工信息更新");
        return "addNModEmp";
    }
}
