package com.neusoft.web.impl;

import com.neusoft.services.impl.EB.EB0101ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author susheng
 * @date 2019年7月15日
 * @time 下午6:03:35
 */
public abstract class EB0101ControllerSupport extends ControllerSupport 
{
	public EB0101ControllerSupport()
	{
		this.setServices(new EB0101ServicesImpl());
	}

}
