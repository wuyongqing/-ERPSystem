package com.neusoft.web.impl;

import com.neusoft.web.impl.EE02ControllerSupport;

/**
 * @author ��ѧ��
 * @description ������Ϣ��ӿ�����
 * @date 2019/07/16
 */
public class EE0202Servlet extends EE02ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.update("addSub","������Ϣ���","ѧ��ѧ��Ϊ:","aab103");
        return "addSub";
    }
}
