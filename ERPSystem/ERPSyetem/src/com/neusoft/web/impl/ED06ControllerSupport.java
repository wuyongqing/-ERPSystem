package com.neusoft.web.impl;

import com.neusoft.services.impl.ED.ED06ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class ED06ControllerSupport extends ControllerSupport 
{
	public ED06ControllerSupport() 
	{
		this.setServices(new ED06ServicesImpl());
	}
}
