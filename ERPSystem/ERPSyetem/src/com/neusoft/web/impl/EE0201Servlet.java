package com.neusoft.web.impl;

import com.neusoft.web.impl.EE02ControllerSupport;

/**
 * @author ��ѧ��
 * @description ������Ϣ��ѯ������
 * @date 2019/07/16
 */
public class EE0201Servlet extends EE02ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.savePageData();
        return "querySub";
    }
}
