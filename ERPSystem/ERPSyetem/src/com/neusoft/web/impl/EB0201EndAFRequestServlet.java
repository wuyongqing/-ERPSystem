package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��14��
 * @time ����8:36:23
 */
public class EB0201EndAFRequestServlet extends EB0201ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("end", "����");
		this.saveSubPageData();
		return "endAFRequestEB0201";
	}

}
