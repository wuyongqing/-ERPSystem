package com.neusoft.web.impl;

import com.neusoft.web.impl.EF05ControllerSupport;

/**
 * @author ��ѧ��
 * @description Ա�������ݼ������ѯ������
 * @date 2019/07/12
 */
public class EF0501Servlet extends EF05ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.savePageData();
        return "myVacReq";
    }
}
