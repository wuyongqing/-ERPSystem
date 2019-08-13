package com.neusoft.web.impl;

import com.neusoft.services.impl.EC.EC0301ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EC0301ControllerSupport extends ControllerSupport
{
	public EC0301ControllerSupport() 
	{
		this.setServices(new EC0301ServicesImpl());
	}
}
