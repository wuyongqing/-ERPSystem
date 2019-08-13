package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月9日
 * @time 下午11:17:35
 * 添加底稿
 */
public class EC1101AddDraftServlet extends EC1101ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addDraft", "添加底稿");
		return "addDraftEC1101";
	}

}
