package com.neusoft.web.impl;

import com.neusoft.services.impl.EF.EF06ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author ��ѧ��
 * @description Ա�������������������֧����
 * @date 2019/07/12
 */
public abstract class EF06ControllerSupport extends ControllerSupport
{
    public EF06ControllerSupport()
    {
        this.setServices(new EF06ServicesImpl());
    }
}
