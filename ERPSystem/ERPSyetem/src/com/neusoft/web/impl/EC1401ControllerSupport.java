package com.neusoft.web.impl;

import com.neusoft.services.impl.EC.EC1401ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * @author susheng
 * @date 2019��7��11��
 * @time ����11:31:48
 * Ϊ����ʹ�ü�¼�ṩ������
 */
public abstract class EC1401ControllerSupport extends ControllerSupport 
{
     public EC1401ControllerSupport()
     {
    	 this.setServices(new EC1401ServicesImpl());
     }
}
