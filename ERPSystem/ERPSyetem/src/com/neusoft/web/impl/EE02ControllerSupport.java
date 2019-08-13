package com.neusoft.web.impl;

import com.neusoft.services.impl.EE.EE02ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author 张学正
 * @description 学生报名控制器支持类
 * @date 2019/07/15
 */
public abstract class EE02ControllerSupport extends ControllerSupport
{
    public EE02ControllerSupport()
    {
        this.setServices(new EE02ServicesImpl());
    }
}
