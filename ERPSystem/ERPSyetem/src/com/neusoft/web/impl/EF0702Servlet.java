package com.neusoft.web.impl;

import com.neusoft.web.impl.EF07ControllerSupport;

/**
 * @author ��ѧ��
 * @description �½��������������
 * @date 2019/07/10
 */
public class EF0702Servlet extends EF07ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.update("addReq","������������");
        return "addSupReq";
    }
}
