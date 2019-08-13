package com.neusoft.web.impl;

import com.neusoft.services.impl.EF.EF05ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author 张学正
 * @description 员工个人休假控制器支持类
 * @date 2019/07/12
 */
public abstract class EF05ControllerSupport extends ControllerSupport
{
    public EF05ControllerSupport()
    {
        this.setServices(new EF05ServicesImpl());
    }
}
