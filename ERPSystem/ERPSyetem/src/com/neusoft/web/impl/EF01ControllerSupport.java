package com.neusoft.web.impl;

import com.neusoft.services.impl.EF.EF01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author ��ѧ��
 * @description EF02������֧����
 * @date 2019/07/05
 */
public abstract class EF01ControllerSupport extends ControllerSupport
{
    public EF01ControllerSupport()
    {
        this.setServices(new EF01ServicesImpl());
    }
}
