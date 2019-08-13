package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月10日
 * @time 下午5:48:07
 * 根据主键查找教研底稿
 */
public class EC1101FindByIdDraftServlet extends EC1101ControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "addDraftEC1101";
	}

}
