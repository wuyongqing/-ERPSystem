package com.neusoft.web.impl;

import com.neusoft.web.impl.EF08ControllerSupport;

/**
 * @author ��ѧ��
 * @description ���ʱ��������
 * @date 2019/07/12
 */
public class EF0803Servlet extends EF08ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.update("modSup","���ʱ��");
        return "modSup";
    }
}
