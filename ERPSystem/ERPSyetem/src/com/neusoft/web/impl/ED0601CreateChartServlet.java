package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��17��
 * @time ����4:03:02
 */
public class ED0601CreateChartServlet extends ED0601ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.saveSubPageInstance();
		return "createChartED0601";
	}

}
