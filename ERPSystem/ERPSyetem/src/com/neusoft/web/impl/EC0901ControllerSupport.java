package com.neusoft.web.impl;

import com.neusoft.services.impl.EC.EC0901ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author susheng
 * @date 2019��7��5��
 * @time ����2:58:23
 * Ϊ���з�������ṩ������
 */
public abstract class EC0901ControllerSupport extends ControllerSupport 
{
	public EC0901ControllerSupport()
	{
		this.setServices(new EC0901ServicesImpl());
	}
}
