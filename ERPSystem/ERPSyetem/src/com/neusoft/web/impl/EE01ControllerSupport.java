package com.neusoft.web.impl;

import com.neusoft.services.impl.EE.EE01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author 张学正
 * @description 咨询管理控制器支持类
 * @date 2019/07/13
 */
public abstract class EE01ControllerSupport extends ControllerSupport
{
    public EE01ControllerSupport()
    {
        this.setServices(new EE01ServicesImpl());
    }
}
