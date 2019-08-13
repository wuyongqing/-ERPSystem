package com.neusoft.web.impl;

import com.neusoft.services.impl.ED.ED01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class ED01ControllerSupport extends ControllerSupport 
{
	public ED01ControllerSupport() 
	{
		this.setServices(new ED01ServicesImpl());
	}
}
