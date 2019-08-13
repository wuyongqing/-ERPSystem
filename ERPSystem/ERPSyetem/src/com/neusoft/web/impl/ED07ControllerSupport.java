package com.neusoft.web.impl;

import com.neusoft.services.impl.ED.ED07ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class ED07ControllerSupport extends ControllerSupport 
{
	public ED07ControllerSupport() 
	{
		this.setServices(new ED07ServicesImpl());
	}
}
