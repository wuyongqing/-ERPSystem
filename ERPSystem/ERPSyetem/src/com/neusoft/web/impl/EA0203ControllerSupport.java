package com.neusoft.web.impl;

import com.neusoft.services.impl.EA.EA0203ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EA0203ControllerSupport extends ControllerSupport 
{
	public EA0203ControllerSupport() 
	{
		this.setServices(new EA0203ServicesImpl());
	}
}
