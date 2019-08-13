package com.neusoft.web.impl;

import com.neusoft.services.impl.EA.EA1201ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EA1201ControllerSupport extends ControllerSupport 
{
	public EA1201ControllerSupport() 
	{
		this.setServices(new EA1201ServicesImpl());
	}
}
