package com.neusoft.web.impl;

import com.neusoft.web.impl.EE03ControllerSupport;

/**
 * @author ��ѧ��
 * @description ѧ��������ס������
 * @date 2019/07/16
 */
public class EE0301Servlet extends EE03ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.update("addLodging","��ס��Ϣ����");
        return "addLodging";
    }
}
