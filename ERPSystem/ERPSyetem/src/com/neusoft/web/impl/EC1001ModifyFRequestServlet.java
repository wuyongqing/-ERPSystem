package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月12日
 * @time 下午3:25:11
 */
public class EC1001ModifyFRequestServlet extends EC1001ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("modifyRequest", "修改申请");
		return "addFRequestEC1001";
	}

}
