package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��14��
 * @time ����10:14:15
 */
public class EB0201LookAFRecordServlet extends EB0201ControllerSupport {
	@Override
	public String execute() throws Exception 
	{
		this.saveSubPageInstance();
		return "lookAFRecordEB0201";
	}

}
