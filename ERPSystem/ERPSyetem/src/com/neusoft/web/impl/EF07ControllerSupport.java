package com.neusoft.web.impl;

import com.neusoft.services.impl.EF.EF07ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author ��ѧ��
 * @description �������������֧����
 * @date 2019/07/10
 */
public abstract class EF07ControllerSupport extends ControllerSupport
{
    public EF07ControllerSupport()
    {
        this.setServices(new EF07ServicesImpl());
    }
}
