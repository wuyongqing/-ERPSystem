package com.neusoft.web.impl;

import com.neusoft.services.impl.ED.ED02ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class ED02ControllerSupport extends ControllerSupport 
{
	public ED02ControllerSupport() 
	{
		this.setServices(new ED02ServicesImpl());
	}
}
