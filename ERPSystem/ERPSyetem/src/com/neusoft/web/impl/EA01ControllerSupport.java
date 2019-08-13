package com.neusoft.web.impl;

import com.neusoft.services.impl.EA.EA0101ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EA01ControllerSupport extends ControllerSupport
{
	public EA01ControllerSupport()
	{
		this.setServices(new EA0101ServicesImpl());
	}
}
