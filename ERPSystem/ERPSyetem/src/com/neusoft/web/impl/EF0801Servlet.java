package com.neusoft.web.impl;

import com.neusoft.web.impl.EF08ControllerSupport;

/**
 * @author ��ѧ��
 * @description ���������ʲ�ѯ������
 * @date 2019/07/12
 */
public class EF0801Servlet extends EF08ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.savePageData();
        return "querySup";
    }
}
