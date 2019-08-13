package com.neusoft.web.impl;

import com.neusoft.services.impl.EA.EA0501ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EA0501ControllerSupport extends ControllerSupport 
{
	public EA0501ControllerSupport() 
	{
		this.setServices(new EA0501ServicesImpl());
	}

}
