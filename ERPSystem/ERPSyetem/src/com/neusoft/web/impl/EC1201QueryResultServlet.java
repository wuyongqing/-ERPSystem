package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月9日
 * @time 下午11:14:31
 * 不定条件查询教研结果
 */
public class EC1201QueryResultServlet extends EC1201ControllerSupport 
{
	@Override
	public String execute() throws Exception
    {
		this.savePageData();
		return "queryResultEC1201";
	}

}
