package com.neusoft.web.impl;

import com.neusoft.services.impl.EB.EB0201ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author susheng
 * @date 2019��7��14��
 * @time ����4:16:26
 */
public abstract class EB0201ControllerSupport extends ControllerSupport 
{
	public EB0201ControllerSupport() 
	{
		this.setServices(new EB0201ServicesImpl());
	}

}
