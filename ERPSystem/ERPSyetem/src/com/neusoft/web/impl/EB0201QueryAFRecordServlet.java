package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��14��
 * @time ����9:29:29
 */
public class EB0201QueryAFRecordServlet extends EB0201ControllerSupport {
	@Override
	public String execute() throws Exception
	{
		this.saveSubPageData();
		return "endAFRequestEB0201";
	}

}
