package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��14��
 * @time ����6:58:56
 */
public class EB0201FindByIdAFRequestServlet extends EB0201ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "giveAFRequestEB0201";
	}

}
