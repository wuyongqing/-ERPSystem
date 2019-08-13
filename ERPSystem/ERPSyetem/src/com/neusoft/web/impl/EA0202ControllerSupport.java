package com.neusoft.web.impl;

import com.neusoft.services.impl.EA.EA0202ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EA0202ControllerSupport extends ControllerSupport 
{
	public EA0202ControllerSupport() 
	{
		this.setServices(new EA0202ServicesImpl());
	}
}
