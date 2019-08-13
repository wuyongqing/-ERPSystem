package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月10日
 * @time 下午6:26:07
 * 修改教研底稿
 */
public class EC1101ModifyDraftServlet extends EC1101ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("modifyDraft", "修改");
		return "addDraftEC1101";
	}

}
