package com.neusoft.web.impl;

import com.neusoft.services.impl.EC.EC0501ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EC0501ControllerSupport extends ControllerSupport
{
	public EC0501ControllerSupport() 
	{
		this.setServices(new EC0501ServicesImpl());
	}
}
