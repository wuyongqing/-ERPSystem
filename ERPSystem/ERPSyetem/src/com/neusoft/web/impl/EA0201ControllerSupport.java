package com.neusoft.web.impl;

import com.neusoft.services.impl.EA.EA0201ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EA0201ControllerSupport extends ControllerSupport 
{
	public EA0201ControllerSupport() 
	{
		this.setServices(new EA0201ServicesImpl());
	}
}
