package com.neusoft.web.impl;

import com.neusoft.services.impl.ED.ED04ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class ED04ControllerSupport extends ControllerSupport 
{
	public ED04ControllerSupport() 
	{
		this.setServices(new ED04ServicesImpl());
	}
}
