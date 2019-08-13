package com.neusoft.web.impl;

import com.neusoft.services.impl.EC.EC0601ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EC0601ControllerSupport extends ControllerSupport
{
	public EC0601ControllerSupport() 
	{
		this.setServices(new EC0601ServicesImpl());
	}
}
