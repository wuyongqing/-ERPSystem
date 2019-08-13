package com.neusoft.web.impl;

import com.neusoft.services.impl.EA.EA0301ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EA0301ControllerSupport extends ControllerSupport 
{
	public EA0301ControllerSupport() 
	{
		this.setServices(new EA0301ServicesImpl());
	}

}
