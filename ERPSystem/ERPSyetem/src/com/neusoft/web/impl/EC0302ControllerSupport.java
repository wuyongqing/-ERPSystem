package com.neusoft.web.impl;

import com.neusoft.services.impl.EC.EC0302ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EC0302ControllerSupport extends ControllerSupport
{
	public EC0302ControllerSupport() 
	{
		this.setServices(new EC0302ServicesImpl());
	}
}
