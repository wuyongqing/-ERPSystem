package com.neusoft.web.impl;

import com.neusoft.web.impl.EF07ControllerSupport;

/**
 * @author ��ѧ��
 * @description ����������ѯ�������������
 * @date 2019/07/10
 */
public class EF0701Servlet extends EF07ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.savePageData();
        return "querySupReq";
    }
}
