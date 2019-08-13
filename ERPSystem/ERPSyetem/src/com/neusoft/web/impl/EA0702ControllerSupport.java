package com.neusoft.web.impl;

import com.neusoft.services.impl.EA.EA0702ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EA0702ControllerSupport extends ControllerSupport 
{
	public EA0702ControllerSupport()
	{
		this.setServices(new EA0702ServicesImpl());
	}
}
