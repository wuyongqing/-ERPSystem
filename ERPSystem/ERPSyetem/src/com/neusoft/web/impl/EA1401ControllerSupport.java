package com.neusoft.web.impl;

import com.neusoft.services.impl.EA.EA1401ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author susheng
 * @date 2019��7��12��
 * @time ����7:39:24
 */
public abstract class EA1401ControllerSupport extends ControllerSupport 
{    
	public EA1401ControllerSupport()
	{
		this.setServices(new EA1401ServicesImpl());
	}
}
