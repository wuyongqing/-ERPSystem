package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月12日
 * @time 下午2:26:42
 */
public class EC1001AddFRequestServlet extends EC1001ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addRequest", "添加申请");
		return "addFRequestEC1001";
	}

}
