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
						request.setAttribute("check", "��½�ɹ�");
						toPath="menu";
					}
					else
					{
						toPath="login";
						request.setAttribute("check", "��½ʧ�ܣ��˺�����������ͣ��");
					}
				}
				else
				{
					toPath="login";
					request.setAttribute("check", "��½ʧ�ܣ��˺�����������ͣ��");
				}
				
				
				
			} catch (Exception e) {
				toPath="login";
				// TODO Auto-generated catch block
				request.setAttribute("check", "��½ʧ�ܣ��˺�����������ͣ��");
				e.printStackTrace();
			}
			request.getRequestDispatcher("/"+toPath+".jsp").forward(request, response);
		}
		else
		{
			System.out.println("token��ƥ��");
			System.out.println("session token:"+token+";");
			System.out.println("request token:"+token2+";");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
		
		
	}

	private void parseRueqestAttribute(HttpServletRequest request,Map<String,Object> rueqestAttribute)
	{
		//1.��ԭ���еļ�ֵ��,�γɼ���
		Set<Map.Entry<String, Object>> entrySet=rueqestAttribute.entrySet();
		//2.ѭ������
		for(Map.Entry<String, Object> entry:entrySet)
		{
			//3.��map��ÿ����ֵ��,ת����request������
			request.setAttribute(entry.getKey(), entry.getValue());
		}
		//������е�request����������
		rueqestAttribute.clear();
	}
	
	
	/**
	 *  DTO��Ƭ
	 * @param request
	 * @return
	 */
	private  Map<String,Object> createDto(HttpServletRequest request)
	{
		//1.��ȡҳ������
		Map<String,String[]> tem=request.getParameterMap();
		int initSize=((int)(tem.size()/0.75))+1;
		//2.�������м�ֵ��,�γɼ�ֵ�Լ���
		Set<Entry<String,String[]>> entrySet=tem.entrySet();
		//3.��������,��ʾEnetry��value����
		String value[]=null;
		
		//4.����DTO����
		Map<String,Object> dto=new HashMap<>(initSize);
		//5.ѭ����ȡentrySet,��ȡÿ����ֵ��
		for(Entry<String,String[]> entry :entrySet)
		{
			//��ȡvalue���ֵ�����
			value=entry.getValue();
			//���ݳ����ж�ҳ��ؼ������
			if(value.length==1)  //��checkbox��ؼ�
			{
		        //���˵�ҳ��δ�����Ŀ
				if(value[0]!=null && !value[0].equals(""))
				{
					dto.put(entry.getKey(), value[0]);
				}
			}
			else     //checkbox��ؼ�
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
