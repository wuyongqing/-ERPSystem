package com.neusoft.web.impl;

import com.neusoft.services.impl.EA.EA1001ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EA1001ControllerSupport extends ControllerSupport 
{
	public EA1001ControllerSupport() 
	{
		this.setServices(new EA1001ServicesImpl());
	}
}
