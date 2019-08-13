package com.neusoft.web.impl;

import com.neusoft.services.impl.EF.EF02ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author 张学正
 * @description 员工相关功能点支持类
 * @date 2019/07/08
 */
public abstract class EF02ControllerSupport extends ControllerSupport
{
    public EF02ControllerSupport()
    {
        this.setServices(new EF02ServicesImpl());
    }
}
