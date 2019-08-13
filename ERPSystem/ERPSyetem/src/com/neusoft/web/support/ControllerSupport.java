package com.neusoft.web.support;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.BaseServices;

public abstract class ControllerSupport implements BaseController
{

	/*****************************************
	 * 	        业务逻辑组件及架构注入
	 *****************************************/
	
	private BaseServices services=null;
	
	/**
	 * 子类通过该方法,为Services变量传递引用的具体类对象
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
	 * 	        子类业务流程封装
	 *****************************************/
	/**
	 * 数据批量查询
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
			this.saveAttribute("msg", "提示：没有符合条件的数据!");
		}	
	}
	
	/**
	 * 单一实例 查询
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
			this.saveAttribute("msg", "提示:该数据已删除或禁止访问!");
		}	
	}
	
	/**
	 * 删除/修改后的数据检索
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
	 * 删除/修改后的单一数据检索
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
	 * 根据流水号查询一实例与一批与之相关的数据,这里是房间信息与住宿人员信息
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
				this.saveAttribute("msg", "提示：房间没有人员入住!");
			}
		}
		else
		{
			if(num!=1)
			{
				this.saveAttribute("msg", "提示:该数据已删除或禁止访问!");
			}
		}
	}
	
	/**
	 * 下拉选择框信息1 
	 * @throws Exception
	 */
	protected final void savePageSelectRows()throws Exception
	{
		List<Map<String,String>> selects = this.services.queryForSelect();
		this.saveAttribute("selects", selects);
	}
	
	/**
	 * 下拉选择框信息2
	 * @throws Exception
	 */
	protected final void savePageMemRows()throws Exception
	{
		List<Map<String,String>> mem = this.services.queryForMem();
		this.saveAttribute("mem", mem);
	}
	
	/*********************************************************************
	 * 							苏胜
	 **************************************************************/
	/**
	 * 数据批量查询
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
			this.saveAttribute("msg", "提示：没有符合条件的数据!");
		}	
	}
	
	/*********************************************************************
	 * 							周航
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
			this.saveAttribute("msg", "提示：没有符合条件的数据!");
		}	
	}
	/**
	 * 单一实例 查询
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
			this.saveAttribute("msg", "提示:该数据已删除或禁止访问!");
		}	
	}
	
	/**
	 * 通过反射执行更新方法
	 * @param methodName
	 * @return
	 * @throws Exception
	 */
	private boolean executeUpdateMethod(String methodName)throws Exception
	{
		//1.获取需要调用的方法对象
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.调用方法
		return  (boolean)method.invoke(services);
	}
	
	
	/**
	 * 更新行为的总开关
	 * <
	 *   简单消息提示
	 * >
	 * @param utype
	 * @param msgText
	 * @throws Exception
	 */
	protected final void update(String methodName,String msgText)throws Exception
	{
		String msg=this.executeUpdateMethod(methodName)?"成功!":"失败!";
		this.saveAttribute("msg", msgText+msg);
	}
	
	/**
	 * 带有编号的消息提示的更新行为
	 * @param utype
	 * @param typeText
	 * @param msgText
	 * @param key
	 * @throws Exception
	 */
	protected final void update(String methodName,String typeText,String msgText,String key)throws Exception
	{
		String msg=typeText+"失败!";
    	if(this.executeUpdateMethod(methodName))
    	{
    		msg=msgText+"[ <msg> "+this.dto.get(key)+" </msg> ]";
    	}
    	//Servlet向页面输出数据
    	this.saveAttribute("msg", msg);

	}
	
	/**
	 * 删除后的数据检索
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
	 * 删除后的数据检索
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
	 * 	        数据输入流
	 *****************************************/
	private Map<String,Object> dto=null;
    @Override
    public final void setMapDto(Map<String, Object> dto) 
    {
        this.dto=dto;	
        //同步为Services传递DTO
        this.services.setMapDto(dto);
        
    }
    
    protected final void showDto()
    {
    	System.out.println(this.dto);
    }

    
	/*****************************************
	 * 	        数据输出流
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
