package com.neusoft.web.impl;

import com.neusoft.web.impl.EE01ControllerSupport;

/**
 * @author 张学正
 * @description 咨询记录修改控制器
 * @date 2019/07/13
 */
public class EE0104Servlet extends EE01ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.update("modRec","记录修改");
        return "addNModCstt";
    }
}
