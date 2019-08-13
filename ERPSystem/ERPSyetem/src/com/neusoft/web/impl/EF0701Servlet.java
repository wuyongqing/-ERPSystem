package com.neusoft.web.impl;

import com.neusoft.web.impl.EF07ControllerSupport;

/**
 * @author 张学正
 * @description 不定条件查询物资申请控制器
 * @date 2019/07/10
 */
public class EF0701Servlet extends EF07ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.savePageData();
        return "querySupReq";
    }
}
