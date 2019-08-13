package com.neusoft.web.impl;

import com.neusoft.services.impl.EA.EA0701ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EA0701ControllerSupport extends ControllerSupport 
{
	public EA0701ControllerSupport() 
	{
		this.setServices(new EA0701ServicesImpl());
	}
}
