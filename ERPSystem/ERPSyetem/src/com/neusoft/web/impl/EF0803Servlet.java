package com.neusoft.web.impl;

import com.neusoft.web.impl.EF08ControllerSupport;

/**
 * @author 张学正
 * @description 物资变更控制器
 * @date 2019/07/12
 */
public class EF0803Servlet extends EF08ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.update("modSup","物资变更");
        return "modSup";
    }
}
