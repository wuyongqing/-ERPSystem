package com.neusoft.web.impl;

import com.neusoft.services.impl.EF.EF01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author 张学正
 * @description EF02控制器支持类
 * @date 2019/07/05
 */
public abstract class EF01ControllerSupport extends ControllerSupport
{
    public EF01ControllerSupport()
    {
        this.setServices(new EF01ServicesImpl());
    }
}
