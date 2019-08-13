package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月9日
 * @time 下午11:17:35
 * 添加教研成果
 */
public class EC1201AddResultServlet extends EC1201ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addResult", "添加成果");
		this.savePageDataForUpdate();
		return "queryResultEC1201";
	}

}
