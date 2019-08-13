package com.neusoft.web.impl;

import com.neusoft.services.impl.EA.EA15ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EA15ControllerSupport extends ControllerSupport 
{
	public EA15ControllerSupport() 
	{
		this.setServices(new EA15ServicesImpl());
	}

}
