package com.neusoft.web.impl;

import com.neusoft.services.impl.EC.EC1201ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author susheng
 * @date 2019年7月9日
 * @time 下午11:12:40
 * 为教研结果提供服务类
 */
public abstract class EC1201ControllerSupport extends ControllerSupport {

	public EC1201ControllerSupport() 
	{
		this.setServices(new EC1201ServicesImpl());
	}
}
