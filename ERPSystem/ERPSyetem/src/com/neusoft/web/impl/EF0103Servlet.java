package com.neusoft.web.impl;

import com.neusoft.web.impl.EF01ControllerSupport;

/**
 * @author ��ѧ��
 * @description �޸Ĳ�����Ϣ������
 * @date 2019/07/05
 */
public class EF0103Servlet extends EF01ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.update("modDep","������Ϣ����");
        return "addNModDep";
    }
}
