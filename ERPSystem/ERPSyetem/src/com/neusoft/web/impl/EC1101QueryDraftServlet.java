package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月9日
 * @time 下午11:14:31
 * 不定条件查询教研底稿
 */
public class EC1101QueryDraftServlet extends EC1101ControllerSupport 
{
	@Override
	public String execute() throws Exception
    {
		this.savePageData();
		return "queryDraftEC1101";
	}

}
