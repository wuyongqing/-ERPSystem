package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��14��
 * @time ����2:31:58
 */
public class EC1201FindByIdResultServlet extends EC1201ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "lookResultEC1201";
	}

}
