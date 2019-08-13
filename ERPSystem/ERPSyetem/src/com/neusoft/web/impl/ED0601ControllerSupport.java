package com.neusoft.web.impl;

import com.neusoft.services.impl.ED.ED0601ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author susheng
 * @date 2019年7月16日
 * @time 下午6:38:06
 */
public abstract class ED0601ControllerSupport extends ControllerSupport
{
   public ED0601ControllerSupport()
   {
	   this.setServices(new ED0601ServicesImpl());
   }

}
