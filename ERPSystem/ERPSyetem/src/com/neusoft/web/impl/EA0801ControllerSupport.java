package com.neusoft.web.impl;

import com.neusoft.services.impl.EA.EA0801ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EA0801ControllerSupport extends ControllerSupport 
{
	public EA0801ControllerSupport() 
	{
		this.setServices(new EA0801ServicesImpl());
	}

}
