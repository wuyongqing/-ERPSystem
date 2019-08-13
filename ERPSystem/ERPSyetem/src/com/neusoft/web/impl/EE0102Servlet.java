package com.neusoft.web.impl;

import com.neusoft.web.impl.EE01ControllerSupport;

/**
 * @author 张学正
 * @description 咨询记录单一查询控制器
 * @date 2019/07/13
 */
public class EE0102Servlet extends EE01ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.savePageInstance();
        return "addNModCstt";
    }
}
