package com.neusoft.web.impl;

import com.neusoft.services.impl.EF.EF06ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author 张学正
 * @description 员工个人物资申请控制器支持类
 * @date 2019/07/12
 */
public abstract class EF06ControllerSupport extends ControllerSupport
{
    public EF06ControllerSupport()
    {
        this.setServices(new EF06ServicesImpl());
    }
}
