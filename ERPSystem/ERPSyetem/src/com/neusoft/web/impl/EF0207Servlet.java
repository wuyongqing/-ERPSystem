package com.neusoft.web.impl;

import com.neusoft.web.impl.EF02ControllerSupport;

/**
 * @author ��ѧ��
 * @description Ա����ְ������
 * @date 2019/07/08
 */
public class EF0207Servlet extends EF02ControllerSupport
{
    @Override
    public String execute() throws Exception {
        this.update("delEmp","��ְ��Ϣ����");
        return "delNTranEmp";
    }
}
