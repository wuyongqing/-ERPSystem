package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��12��
 * @time ����2:26:42
 */
public class EC1001AddFRequestServlet extends EC1001ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addRequest", "�������");
		return "addFRequestEC1001";
	}

}
