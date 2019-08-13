package com.neusoft.web.impl;

import com.neusoft.web.impl.EF08ControllerSupport;

/**
 * @author 张学正
 * @description 用于物资变更的单一实例查询控制器
 * @date 2019/07/12
 */
public class EF0804Servlet extends EF08ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.savePageInstance();
        return "modSup";
    }
}
