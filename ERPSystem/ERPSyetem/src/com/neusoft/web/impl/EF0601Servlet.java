package com.neusoft.web.impl;

import com.neusoft.web.impl.EF06ControllerSupport;

/**
 * @author 张学正
 * @description 员工个人物资申请查询控制器
 * @date 2019/07/12
 */
public class EF0601Servlet extends EF06ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.savePageData();
        return "mySupReq";
    }
}
