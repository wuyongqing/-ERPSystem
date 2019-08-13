package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月17日
 * @time 下午4:03:02
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
