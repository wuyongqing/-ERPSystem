package com.neusoft.web.impl;

import com.neusoft.services.impl.EC.EC1001ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author susheng
 * @date 2019��7��12��
 * @time ����11:00:58
 */
public abstract class EC1001ControllerSupport extends ControllerSupport 
{
	public EC1001ControllerSupport() 
	{
		this.setServices(new EC1001ServicesImpl());
	}
}
