package com.neusoft.web.impl;

import com.neusoft.web.impl.EF04ControllerSupport;

/**
 * @author ��ѧ��
 * @description �½��ݼ����������
 * @date 2019/07/09
 */
public class EF0402Servlet extends EF04ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.update("addReq","�ύ����");
        return "addVacReq";
    }
}
