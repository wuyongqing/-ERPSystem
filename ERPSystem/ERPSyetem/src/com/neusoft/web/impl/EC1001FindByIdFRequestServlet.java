package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月12日
 * @time 下午3:12:03
 */
public class EC1001FindByIdFRequestServlet extends EC1001ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "addFRequestEC1001";
	}

}
