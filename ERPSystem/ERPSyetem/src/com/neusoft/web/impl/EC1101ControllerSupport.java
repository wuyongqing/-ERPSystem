package com.neusoft.web.impl;

import com.neusoft.services.impl.EC.EC1101ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author susheng
 * @date 2019年7月9日
 * @time 下午11:12:40
 * 提供底稿的服务对象
 */
public abstract class EC1101ControllerSupport extends ControllerSupport 
{

	public EC1101ControllerSupport() 
	{
		this.setServices(new EC1101ServicesImpl());
	}
}
