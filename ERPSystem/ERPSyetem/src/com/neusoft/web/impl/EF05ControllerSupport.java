package com.neusoft.web.impl;

import com.neusoft.services.impl.EF.EF05ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author ��ѧ��
 * @description Ա�������ݼٿ�����֧����
 * @date 2019/07/12
 */
public abstract class EF05ControllerSupport extends ControllerSupport
{
    public EF05ControllerSupport()
    {
        this.setServices(new EF05ServicesImpl());
    }
}
