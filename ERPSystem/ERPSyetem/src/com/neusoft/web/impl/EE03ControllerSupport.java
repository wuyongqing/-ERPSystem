package com.neusoft.web.impl;

import com.neusoft.services.impl.EE.EE03ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author 张学正
 * @description 住宿信息生成控制器支持类
 * @date 2019/07/16
 */
public abstract class EE03ControllerSupport extends ControllerSupport
{
    public EE03ControllerSupport()
    {
        this.setServices(new EE03ServicesImpl());
    }
}
