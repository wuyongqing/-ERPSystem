package com.neusoft.web.impl;

import com.neusoft.web.impl.EF02ControllerSupport;

/**
 * @author 张学正
 * @description 用于导入与修改的单一员工查询控制器
 * @date 2019/07/08
 */
public class EF0204Servlet extends EF02ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.savePageInstance();
        return "addNModEmp";
    }
}
