package com.neusoft.web.impl;

import com.neusoft.services.impl.EA.EA0901ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EA0901ControllerSupport extends ControllerSupport 
{
	public EA0901ControllerSupport() 
	{
		this.setServices(new EA0901ServicesImpl());
	}

}
