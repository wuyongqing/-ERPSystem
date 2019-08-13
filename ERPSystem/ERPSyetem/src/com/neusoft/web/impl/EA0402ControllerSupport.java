package com.neusoft.web.impl;

import com.neusoft.services.impl.EA.EA0402ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EA0402ControllerSupport extends ControllerSupport 
{
	public EA0402ControllerSupport() 
	{
		this.setServices(new EA0402ServicesImpl());
	}

}
