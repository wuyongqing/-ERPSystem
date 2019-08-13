package com.neusoft.web.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neusoft.services.impl.EA.EA0102ServicesImpl;

@WebServlet("/EA0102Login.htm")
public class EA0102LoginServlet extends HttpServlet
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String token = (String)request.getSession().getAttribute("token");
		String token2 = (String)request.getParameter("token");
		if(token!=null&&token2!=null&&token2.equals(token))
		{
			String toPath=null;
			Map<String,Object> dto = this.createDto(request);
			EA0102ServicesImpl services = new EA0102ServicesImpl();
			services.setMapDto(dto);
			try 
			{
				System.out.println(request.getSession().getId());
				Map<String,String> result = services.checkLogin();
				if(result!=null)
				{
					if(result.get("ssa401")!=null)
					{
						System.out.println(result.get("aae102"));
						request.getSession().setAttribute("user", result.get("aae101"));
						request.getSession().setAttribute("role", result.get("ssa201"));
						request.getSession().setAttribute("name", result.get("aae102"));
						request.getSession().setAttribute("numb", result.get("aae103"));
						//request.getSession().setAttribute("token", "1");
						request.setAttribute("check", "登陆成功");
						toPath="menu";
					}
					else
					{
						toPath="login";
						request.setAttribute("check", "登陆失败，账号密码错误或已停用");
					}
				}
				else
				{
					toPath="login";
					request.setAttribute("check", "登陆失败，账号密码错误或已停用");
				}
				
				
				
			} catch (Exception e) {
				toPath="login";
				// TODO Auto-generated catch block
				request.setAttribute("check", "登陆失败，账号密码错误或已停用");
				e.printStackTrace();
			}
			request.getRequestDispatcher("/"+toPath+".jsp").forward(request, response);
		}
		else
		{
			System.out.println("token不匹配");
			System.out.println("session token:"+token+";");
			System.out.println("request token:"+token2+";");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
		
		
	}

	private void parseRueqestAttribute(HttpServletRequest request,Map<String,Object> rueqestAttribute)
	{
		//1.还原所有的键值对,形成集合
		Set<Map.Entry<String, Object>> entrySet=rueqestAttribute.entrySet();
		//2.循环集合
		for(Map.Entry<String, Object> entry:entrySet)
		{
			//3.将map的每个键值对,转换成request的属性
			request.setAttribute(entry.getKey(), entry.getValue());
		}
		//清除所有的request级属性数据
		rueqestAttribute.clear();
	}
	
	
	/**
	 *  DTO切片
	 * @param request
	 * @return
	 */
	private  Map<String,Object> createDto(HttpServletRequest request)
	{
		//1.获取页面数据
		Map<String,String[]> tem=request.getParameterMap();
		int initSize=((int)(tem.size()/0.75))+1;
		//2.导出所有键值对,形成键值对集合
		Set<Entry<String,String[]>> entrySet=tem.entrySet();
		//3.定义数组,表示Enetry的value部分
		String value[]=null;
		
		//4.定义DTO容器
		Map<String,Object> dto=new HashMap<>(initSize);
		//5.循环读取entrySet,获取每个键值对
		for(Entry<String,String[]> entry :entrySet)
		{
			//获取value部分的数组
			value=entry.getValue();
			//依据长度判断页面控件的类别
			if(value.length==1)  //非checkbox类控件
			{
		        //过滤掉页面未填充项目
				if(value[0]!=null && !value[0].equals(""))
				{
					dto.put(entry.getKey(), value[0]);
				}
			}
			else     //checkbox类控件
			{
				dto.put(entry.getKey(), value);
			}	
		}
		//System.out.println(dto);
		return dto;
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
