package com.neusoft.web.impl;

import com.neusoft.services.impl.ED.ED05ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class ED05ControllerSupport extends ControllerSupport 
{
	public ED05ControllerSupport() 
	{
		this.setServices(new ED05ServicesImpl());
	}
}
