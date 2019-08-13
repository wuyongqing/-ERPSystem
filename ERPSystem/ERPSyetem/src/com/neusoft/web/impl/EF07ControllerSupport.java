package com.neusoft.web.impl;

import com.neusoft.services.impl.EF.EF07ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author 张学正
 * @description 物资申请控制器支持类
 * @date 2019/07/10
 */
public abstract class EF07ControllerSupport extends ControllerSupport
{
    public EF07ControllerSupport()
    {
        this.setServices(new EF07ServicesImpl());
    }
}
