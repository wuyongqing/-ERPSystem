package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��12��
 * @time ����3:25:11
 */
public class EC1001ModifyFRequestServlet extends EC1001ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("modifyRequest", "�޸�����");
		return "addFRequestEC1001";
	}

}
