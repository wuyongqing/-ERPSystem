package com.neusoft.web.impl;

import com.neusoft.services.impl.EC.EC0101ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EC0101ControllerSupport extends ControllerSupport
{
	public EC0101ControllerSupport() 
	{
		this.setServices(new EC0101ServicesImpl());
	}
}
