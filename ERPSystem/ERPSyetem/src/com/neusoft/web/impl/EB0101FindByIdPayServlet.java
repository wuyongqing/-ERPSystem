package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��16��
 * @time ����2:06:42
 */
public class EB0101FindByIdPayServlet extends EB0101ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "addPayEB0101";
	}

}
