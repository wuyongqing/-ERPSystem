package com.neusoft.web.impl;

import com.neusoft.web.impl.EE01ControllerSupport;

/**
 * @author ��ѧ��
 * @description ��ѯ��¼������ѯ������
 * @date 2019/07/13
 */
public class EE0101Servlet extends EE01ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.savePageData();
        return "queryCstt";
    }
}
