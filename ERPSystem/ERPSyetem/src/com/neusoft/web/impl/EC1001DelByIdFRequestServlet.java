package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月12日
 * @time 下午3:41:45
 */
public class EC1001DelByIdFRequestServlet extends EC1001ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "删除申请");
		this.savePageDataForDelete();
		return "queryFRequestEC1001";
	}

}
