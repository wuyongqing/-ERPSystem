package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月14日
 * @time 下午9:29:29
 */
public class EB0201QueryAFRecordServlet extends EB0201ControllerSupport {
	@Override
	public String execute() throws Exception
	{
		this.saveSubPageData();
		return "endAFRequestEB0201";
	}

}
