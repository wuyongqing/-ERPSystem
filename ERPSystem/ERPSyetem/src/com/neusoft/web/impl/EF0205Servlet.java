package com.neusoft.web.impl;

import com.neusoft.web.impl.EF02ControllerSupport;

/**
 * @author ��ѧ��
 * @description ���ڵ�ְ��ְ�ĵ�һԱ����ѯ������
 * @date 2019/07/08
 */
public class EF0205Servlet extends EF02ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.savePageInstance();
        return "delNTranEmp";
    }
}
