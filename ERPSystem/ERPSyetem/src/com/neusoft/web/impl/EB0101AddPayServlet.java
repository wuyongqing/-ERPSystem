package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��16��
 * @time ����2:33:55
 */
public class EB0101AddPayServlet extends EB0101ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("addPay","���");
		return "addPayEB0101";
	}

}
