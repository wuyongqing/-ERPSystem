package com.neusoft.web.impl;

import com.neusoft.web.impl.EF04ControllerSupport;

/**
 * @author ��ѧ��
 * @description �ݼ����뵥һʵ����ѯ������
 * @date 2019/07/10
 */
public class EF0404Servlet extends EF04ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.savePageInstance();
        return "reviewVacReq";
    }
}
