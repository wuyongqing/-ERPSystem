package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��14��
 * @time ����3:40:25
 */
public class EC1401SubmitAllRecordServlet extends EC1401ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("submitRecord", "�ύ");
		this.savePageData();
		return "queryRecordEC1401";
	}

}
