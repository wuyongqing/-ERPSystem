package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��12��
 * @time ����4:48:17
 */
public class EC1001DelFRequestServlet extends EC1001ControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.update("batchDelete", "����ɾ��");
		this.savePageDataForDelete();
		return "queryFRequestEC1001";
	}

}
