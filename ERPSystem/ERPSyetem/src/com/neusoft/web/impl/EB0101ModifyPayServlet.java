package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月16日
 * @time 下午2:31:28
 */
public class EB0101ModifyPayServlet extends EB0101ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("modifyPay", "修改");
		return "addPayEB0101";
	}

}
