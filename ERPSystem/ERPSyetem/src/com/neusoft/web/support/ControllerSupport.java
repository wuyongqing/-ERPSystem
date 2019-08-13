package com.neusoft.web.support;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.BaseServices;

public abstract class ControllerSupport implements BaseController
{

	/*****************************************
	 * 	        ҵ���߼�������ܹ�ע��
	 *****************************************/
	
	private BaseServices services=null;
	
	/**
	 * ����ͨ���÷���,ΪServices�����������õľ��������
	 * @param services
	 */
	protected void setServices(BaseServices services)
	{
		this.services=services;
	}
	
	protected BaseServices getServices()
	{
		return this.services;
	}
	
	/*****************************************
	 * 	        ����ҵ�����̷�װ
	 *****************************************/
	/**
	 * ����������ѯ
	 * @throws Exception
	 */
	protected final void savePageData()throws Exception
	{
		List<Map<String,String>> rows=this.services.query();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "��ʾ��û�з�������������!");
		}	
	}
	
	/**
	 * ��һʵ�� ��ѯ
	 * @throws Exception
	 */
	protected final void savePageInstance()throws Exception
	{
		Map<String,String> ins=this.services.findById();
		if(ins!=null)
		{
			this.saveAttribute("ins",  ins);
		}
		else
		{
			this.saveAttribute("msg", "��ʾ:��������ɾ�����ֹ����!");
		}	
	}
	
	/**
	 * ɾ��/�޸ĺ�����ݼ���
	 * @throws Exception
	 */
	protected final void savePageDataForUpdate()throws Exception
	{
		List<Map<String,String>> rows=this.services.query();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
	}
	
	/**
	 * ɾ��/�޸ĺ�ĵ�һ���ݼ���
	 * @throws Exception
	 */
	protected final void savePageInsForUpdate()throws Exception
	{
		Map<String,String> ins=this.services.findById();
		if(ins!=null)
		{
			this.saveAttribute("ins",  ins);
		}	
	}

	/**
	 * ������ˮ�Ų�ѯһʵ����һ����֮��ص�����,�����Ƿ�����Ϣ��ס����Ա��Ϣ
	 * @param num
	 * @throws Exception
	 */
	protected final void savePageInsAndRows(final int num)throws Exception
	{
		Map<String, String> ins = this.services.findById();
		List<Map<String,String>> rows=this.services.query();
		if(ins.size()>0&&rows.size()>0)
		{
			this.saveAttribute("rows", rows);
			this.saveAttribute("ins", ins);
		}
		else if(ins.size()>0)
		{
			this.saveAttribute("ins", ins);
			if(num!=1)
			{
				this.saveAttribute("msg", "��ʾ������û����Ա��ס!");
			}
		}
		else
		{
			if(num!=1)
			{
				this.saveAttribute("msg", "��ʾ:��������ɾ�����ֹ����!");
			}
		}
	}
	
	/**
	 * ����ѡ�����Ϣ1 
	 * @throws Exception
	 */
	protected final void savePageSelectRows()throws Exception
	{
		List<Map<String,String>> selects = this.services.queryForSelect();
		this.saveAttribute("selects", selects);
	}
	
	/**
	 * ����ѡ�����Ϣ2
	 * @throws Exception
	 */
	protected final void savePageMemRows()throws Exception
	{
		List<Map<String,String>> mem = this.services.queryForMem();
		this.saveAttribute("mem", mem);
	}
	
	/*********************************************************************
	 * 							��ʤ
	 **************************************************************/
	/**
	 * ����������ѯ
	 * @throws Exception
	 */
	protected final void saveSubPageData()throws Exception
	{
		List<Map<String,String>>rows=this.services.querySub();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "��ʾ��û�з�������������!");
		}	
	}
	
	/*********************************************************************
	 * 							�ܺ�
	 **************************************************************/
	protected final void saveSubPageData2()throws Exception
	{
		List<Map<String,String>> rows=this.services.querySub2();
		if(rows.size()>0)
		{
			System.out.println("1");
			this.saveAttribute("rows", rows);
		}
		else
		{
			System.out.println("2");
			this.saveAttribute("msg", "��ʾ��û�з�������������!");
		}	
	}
	/**
	 * ��һʵ�� ��ѯ
	 * @throws Exception
	 */
	protected final void saveSubPageInstance()throws Exception
	{
		Map<String,String> subins=this.services.findByIdSub();
		if(subins!=null)
		{
			this.saveAttribute("subins",  subins);
		}
		else
		{
			this.saveAttribute("msg", "��ʾ:��������ɾ�����ֹ����!");
		}	
	}
	
	/**
	 * ͨ������ִ�и��·���
	 * @param methodName
	 * @return
	 * @throws Exception
	 */
	private boolean executeUpdateMethod(String methodName)throws Exception
	{
		//1.��ȡ��Ҫ���õķ�������
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.���÷���
		return  (boolean)method.invoke(services);
	}
	
	
	/**
	 * ������Ϊ���ܿ���
	 * <
	 *   ����Ϣ��ʾ
	 * >
	 * @param utype
	 * @param msgText
	 * @throws Exception
	 */
	protected final void update(String methodName,String msgText)throws Exception
	{
		String msg=this.executeUpdateMethod(methodName)?"�ɹ�!":"ʧ��!";
		this.saveAttribute("msg", msgText+msg);
	}
	
	/**
	 * ���б�ŵ���Ϣ��ʾ�ĸ�����Ϊ
	 * @param utype
	 * @param typeText
	 * @param msgText
	 * @param key
	 * @throws Exception
	 */
	protected final void update(String methodName,String typeText,String msgText,String key)throws Exception
	{
		String msg=typeText+"ʧ��!";
    	if(this.executeUpdateMethod(methodName))
    	{
    		msg=msgText+"[ <msg> "+this.dto.get(key)+" </msg> ]";
    	}
    	//Servlet��ҳ���������
    	this.saveAttribute("msg", msg);

	}
	
	/**
	 * ɾ��������ݼ���
	 * @throws Exception
	 */
	protected final void savePageDataForDelete()throws Exception
	{
		List<Map<String,String>> rows=this.services.query();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
	}
	/**
	 * ɾ��������ݼ���
	 * @throws Exception
	 */
	protected final void saveSubPageDataForDelete()throws Exception
	{
		List<Map<String,String>>rows=this.services.querySub();
		if(rows.size()>0)
		{
			this.saveAttribute("rows",rows);
		}
	}
	
	
	/*****************************************
	 * 	        ����������
	 *****************************************/
	private Map<String,Object> dto=null;
    @Override
    public final void setMapDto(Map<String, Object> dto) 
    {
        this.dto=dto;	
        //ͬ��ΪServices����DTO
        this.services.setMapDto(dto);
        
    }
    
    protected final void showDto()
    {
    	System.out.println(this.dto);
    }

    
	/*****************************************
	 * 	        ���������
	 *****************************************/
    private Map<String,Object> attribute=new HashMap<>();
    protected final void  saveAttribute(String key,Object value)
    {
    	this.attribute.put(key, value);
    }
    
    @Override
    public final Map<String, Object> getAttribute() 
    {
    	return this.attribute;
    }
}
