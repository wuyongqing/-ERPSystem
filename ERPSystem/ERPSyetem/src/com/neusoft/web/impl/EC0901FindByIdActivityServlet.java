package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��8��
 * @time ����9:11:15
 * �����������ҽ��л
 */
public class EC0901FindByIdActivityServlet extends EC0901ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.saveSubPageInstance();
		return "modifyActivityEC0901";
	}

}
