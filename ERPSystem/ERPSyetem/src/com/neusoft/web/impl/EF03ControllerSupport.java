package com.neusoft.web.impl;

import com.neusoft.services.impl.EF.EF03ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author ��ѧ��
 * @description Ա������������֧����
 * @date 2019/07/09
 */
public abstract class EF03ControllerSupport extends ControllerSupport
{
    public EF03ControllerSupport()
    {
        this.setServices(new EF03ServicesImpl());
    }
}
