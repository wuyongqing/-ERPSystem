package com.neusoft.web.impl;

import com.neusoft.services.impl.EA.EA1301ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EA1301ControllerSupport extends ControllerSupport 
{
	public EA1301ControllerSupport() 
	{
		this.setServices(new EA1301ServicesImpl());
	}
}
