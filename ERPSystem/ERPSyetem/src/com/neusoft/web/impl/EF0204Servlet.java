package com.neusoft.web.impl;

import com.neusoft.web.impl.EF02ControllerSupport;

/**
 * @author ��ѧ��
 * @description ���ڵ������޸ĵĵ�һԱ����ѯ������
 * @date 2019/07/08
 */
public class EF0204Servlet extends EF02ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.savePageInstance();
        return "addNModEmp";
    }
}
