package com.neusoft.web.impl;

import com.neusoft.services.impl.EF.EF08ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author 张学正
 * @description 物资管理控制器支持类
 * @date 2019/07/11
 */
public abstract class EF08ControllerSupport extends ControllerSupport
{
    public EF08ControllerSupport()
    {
        this.setServices(new EF08ServicesImpl());
    }
}
