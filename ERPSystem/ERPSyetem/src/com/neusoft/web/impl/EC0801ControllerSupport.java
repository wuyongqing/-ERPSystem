package com.neusoft.web.impl;

import com.neusoft.services.impl.EC.EC0801ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EC0801ControllerSupport extends ControllerSupport
{
	public EC0801ControllerSupport() 
	{
		this.setServices(new EC0801ServicesImpl());
	}
}
