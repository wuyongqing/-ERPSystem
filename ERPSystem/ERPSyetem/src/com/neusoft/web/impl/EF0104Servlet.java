package com.neusoft.web.impl;

import com.neusoft.web.impl.EF01ControllerSupport;

/**
 * @author ��ѧ��
 * @description ��һ���Ų�ѯ������
 * @date 2019/07/05
 */
public class EF0104Servlet extends EF01ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.savePageInstance();
        return "addNModDep";
    }
}
