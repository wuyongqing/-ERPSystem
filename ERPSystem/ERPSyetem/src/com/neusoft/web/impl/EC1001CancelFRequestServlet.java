package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��12��
 * @time ����3:52:59
 */
public class EC1001CancelFRequestServlet extends EC1001ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("cancelRequest", "����ȡ��");
		this.savePageData();
		return "queryFRequestEC1001";
	}

}
