package com.neusoft.web.impl;

import com.neusoft.services.impl.EF.EF09ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author ��ѧ��
 * @description ���ʱ����¼������֧����
 * @date 2019/07/11
 */
public abstract class EF09ControllerSupport extends ControllerSupport
{
    public EF09ControllerSupport()
    {
        this.setServices(new EF09ServicesImpl());
    }
}
