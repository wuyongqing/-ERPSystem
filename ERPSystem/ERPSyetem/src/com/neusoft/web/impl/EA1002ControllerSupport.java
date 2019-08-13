package com.neusoft.web.impl;

import com.neusoft.services.impl.EA.EA1002ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EA1002ControllerSupport extends ControllerSupport
{
	public EA1002ControllerSupport() 
	{
		this.setServices(new EA1002ServicesImpl());
	}
}
