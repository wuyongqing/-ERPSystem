package com.neusoft.web.impl;

import com.neusoft.services.impl.EF.EF04ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author ��ѧ��
 * @description �ݼٹ��������֧����
 * @date 2019/07/09
 */
public abstract class EF04ControllerSupport extends ControllerSupport
{
    public EF04ControllerSupport()
    {
        this.setServices(new EF04ServicesImpl());
    }
}
