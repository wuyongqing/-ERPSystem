package com.neusoft.web.impl;

import com.neusoft.web.impl.EF02ControllerSupport;

/**
 * @author ��ѧ��
 * @description Ա����Ϣ�޸Ŀ�����
 * @date 2019/07/08
 */
public class EF0203Servlet extends EF02ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.update("modEmp","Ա����Ϣ����");
        return "addNModEmp";
    }
}
