package com.neusoft.web.impl;

import com.neusoft.web.impl.EF07ControllerSupport;

/**
 * @author ��ѧ��
 * @description �����������������
 * @date 2019/07/10
 */
public class EF0703Servlet extends EF07ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.update("reviewReq","����");
        return "reviewSupReq";
    }
}
