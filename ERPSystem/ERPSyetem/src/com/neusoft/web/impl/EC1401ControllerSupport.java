package com.neusoft.web.impl;

import com.neusoft.services.impl.EC.EC1401ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author susheng
 * @date 2019年7月11日
 * @time 上午11:31:48
 * 为经费使用记录提供服务类
 */
public abstract class EC1401ControllerSupport extends ControllerSupport 
{
     public EC1401ControllerSupport()
     {
    	 this.setServices(new EC1401ServicesImpl());
     }
}
