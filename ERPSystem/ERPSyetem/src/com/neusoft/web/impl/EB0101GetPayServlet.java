package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��16��
 * @time ����2:26:43
 */
public class EB0101GetPayServlet extends EB0101ControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.update("getPay","�ɷ�");
		this.savePageData();
		return "queryPayEB0101";
	}

}
