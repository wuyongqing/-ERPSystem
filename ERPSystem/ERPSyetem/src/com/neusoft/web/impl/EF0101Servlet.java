package com.neusoft.web.impl;

import com.neusoft.web.impl.EF01ControllerSupport;

/**
 * @author ��ѧ��
 * @description ���������Ų�ѯ������
 * @date 2019/07/05
 */
public class EF0101Servlet extends EF01ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.savePageData();
        return "queryDep";
    }
}
