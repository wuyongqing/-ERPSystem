package com.neusoft.web.impl;

import com.neusoft.services.impl.EC.EC1101ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author susheng
 * @date 2019��7��9��
 * @time ����11:12:40
 * �ṩ�׸�ķ������
 */
public abstract class EC1101ControllerSupport extends ControllerSupport 
{

	public EC1101ControllerSupport() 
	{
		this.setServices(new EC1101ServicesImpl());
	}
}
