package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��16��
 * @time ����2:31:28
 */
public class EB0101ModifyPayServlet extends EB0101ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("modifyPay", "�޸�");
		return "addPayEB0101";
	}

}
