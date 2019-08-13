package com.neusoft.web.impl;

import com.neusoft.web.impl.EF09ControllerSupport;

/**
 * @author 张学正
 * @description 物资变更记录查询控制器
 * @date 2019/07/12
 */
public class EF0901Servlet extends EF09ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.savePageData();
        return "supRec";
    }
}
