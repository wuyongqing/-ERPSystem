package com.neusoft.web.impl;

import com.neusoft.web.impl.EF07ControllerSupport;

/**
 * @author ��ѧ��
 * @description �������뵥һʵ����ѯ������
 * @date 2019/07/10
 */
public class EF0704Servlet extends EF07ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.savePageInstance();
        return "reviewSupReq";
    }
}
