package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��12��
 * @time ����9:43:02
 */
public class EA1401UnAgreeCFRequestServlet extends EA1401ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("unAgreeCFRequest","�ܾ�����");
		this.savePageData();
		return "queryCFRequestEA1401";
	}

}
