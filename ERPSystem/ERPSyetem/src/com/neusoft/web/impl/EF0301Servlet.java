package com.neusoft.web.impl;

import com.neusoft.web.impl.EF03ControllerSupport;

/**
 * @author ��ѧ��
 * @description Ա��������ѯ������
 * @date 2019/07/09
 */
public class EF0301Servlet extends EF03ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.savePageData();
        return "empRec";
    }
}
