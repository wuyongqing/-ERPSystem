package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��12��
 * @time ����3:41:45
 */
public class EC1001DelByIdFRequestServlet extends EC1001ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "ɾ������");
		this.savePageDataForDelete();
		return "queryFRequestEC1001";
	}

}
