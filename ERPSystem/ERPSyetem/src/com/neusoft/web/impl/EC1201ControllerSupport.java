package com.neusoft.web.impl;

import com.neusoft.services.impl.EC.EC1201ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author susheng
 * @date 2019��7��9��
 * @time ����11:12:40
 * Ϊ���н���ṩ������
 */
public abstract class EC1201ControllerSupport extends ControllerSupport {

	public EC1201ControllerSupport() 
	{
		this.setServices(new EC1201ServicesImpl());
	}
}
