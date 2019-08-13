package com.neusoft.web.impl;

import com.neusoft.services.impl.EF.EF09ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author 张学正
 * @description 物资变更记录控制器支持类
 * @date 2019/07/11
 */
public abstract class EF09ControllerSupport extends ControllerSupport
{
    public EF09ControllerSupport()
    {
        this.setServices(new EF09ServicesImpl());
    }
}
