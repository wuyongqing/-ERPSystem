package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��12��
 * @time ����11:04:28
 */
public class EC1001QueryFRequestServlet extends EC1001ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryFRequestEC1001";
	}

}
