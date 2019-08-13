package com.neusoft.web.impl;

import com.neusoft.services.impl.EC.EC0901ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author susheng
 * @date 2019年7月5日
 * @time 下午2:58:23
 * 为教研方案及活动提供服务类
 */
public abstract class EC0901ControllerSupport extends ControllerSupport 
{
	public EC0901ControllerSupport()
	{
		this.setServices(new EC0901ServicesImpl());
	}
}
