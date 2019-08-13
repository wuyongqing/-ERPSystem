package com.neusoft.web.impl;

import com.neusoft.services.impl.EC.EC0201ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EC0201ControllerSupport extends ControllerSupport
{
	public EC0201ControllerSupport() 
	{
		this.setServices(new EC0201ServicesImpl());
	}
}
