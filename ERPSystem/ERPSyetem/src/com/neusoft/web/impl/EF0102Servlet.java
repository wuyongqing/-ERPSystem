package com.neusoft.web.impl;

import com.neusoft.web.impl.EF01ControllerSupport;

/**
 * @author ��ѧ��
 * @description �½����ſ�����
 * @date 2019/07/05
 */
public class EF0102Servlet extends EF01ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.update("addDep","�½�����");
        return "addNModDep";
    }
}
