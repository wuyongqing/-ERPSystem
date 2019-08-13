package com.neusoft.web.impl;

import com.neusoft.web.impl.EF01ControllerSupport;

/**
 * @author 张学正
 * @description 新建部门控制器
 * @date 2019/07/05
 */
public class EF0102Servlet extends EF01ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.update("addDep","新建部门");
        return "addNModDep";
    }
}
