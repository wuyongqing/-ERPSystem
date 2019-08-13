package com.neusoft.web.impl;

import com.neusoft.web.impl.EE02ControllerSupport;

/**
 * @author 张学正
 * @description 报名信息添加控制器
 * @date 2019/07/16
 */
public class EE0202Servlet extends EE02ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.update("addSub","报名信息添加","学生学号为:","aab103");
        return "addSub";
    }
}
