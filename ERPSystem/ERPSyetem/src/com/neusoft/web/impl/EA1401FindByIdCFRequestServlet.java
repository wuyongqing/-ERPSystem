package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��12��
 * @time ����9:48:55
 */
public class EA1401FindByIdCFRequestServlet extends EA1401ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.savePageInstance();
		return "checkCFRequestEA1401";
	}

}
