package com.neusoft.web.impl;

import com.neusoft.services.impl.EA.EA06ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EA06ControllerSupport extends ControllerSupport 
{
	public EA06ControllerSupport() 
	{
		this.setServices(new EA06ServicesImpl());
	}
}
