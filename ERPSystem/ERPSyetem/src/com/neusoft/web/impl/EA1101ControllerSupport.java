package com.neusoft.web.impl;

import com.neusoft.services.impl.EA.EA1101ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EA1101ControllerSupport extends ControllerSupport
{
	public EA1101ControllerSupport() 
	{
		this.setServices(new EA1101ServicesImpl());
	}
}
