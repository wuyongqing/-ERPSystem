package com.neusoft.web.impl;

import com.neusoft.services.impl.EC.EC0202ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EC0202ControllerSupport extends ControllerSupport
{
	public EC0202ControllerSupport() 
	{
		this.setServices(new EC0202ServicesImpl());
	}
}
