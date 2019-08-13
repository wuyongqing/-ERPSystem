package com.neusoft.web.support;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.html")
public class BaseServlet extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		 String user = (String)request.getSession().getAttribute("user");
		 if(user==null)
		 {
			 request.getRequestDispatcher("/login.jsp").forward(request,response);
		 }
		 else
		 {
			 request.setAttribute("user", request.getSession().getAttribute("user"));
			 request.setAttribute("role", request.getSession().getAttribute("role"));
			 request.setAttribute("numb", request.getSession().getAttribute("numb"));
			 request.setAttribute("name", request.getSession().getAttribute("name"));
		 }
		 String toPath=null;   //��ת��Ŀ��ҳ��
         try
         {
        	 
        	/************************************************************
        	 *      ��������·��,��ȡĿ���������
        	 ************************************************************/
     		//��������ķ���·��
     		String  uri=request.getRequestURI();
     		//��ȡ������Դ�����ļ���
     		String baseName=uri.substring(uri.lastIndexOf("/")+1).replace(".html", "");
     		
     		//�������,��������ҵ��������Ļ���������
     		String basePackageName="com.neusoft.web.impl.";
     		//��ȡ��������ǰ׺��
     		String controllerFirstName=baseName.substring(0,1).toUpperCase()+baseName.substring(1);
     		
     		
     		/***********************************************************
     		 *                        ʵ����Ŀ����---ҵ�������
     		 ***********************************************************/
     		//ʵ����ҵ�������
     		BaseController controller=(BaseController)Class.forName(basePackageName+controllerFirstName+"Servlet").newInstance();
     		
     		
     		/***********************************************************
     		 *                        ��ҵ�������,���ҳ������     i
     		 ***********************************************************/
     		//Ϊҵ�������֯��DTO��Ƭ
     		controller.setMapDto(this.createDto(request));

     		/***********************************************************
     		 *                        ����ҵ������������̿��Ʒ���
     		 ***********************************************************/
     		//�������̿��Ʒ���
     		toPath=controller.execute();

     		/***********************************************************
     		 *                      �����������ҳ�����������     o
     		 ***********************************************************/
     		//��������
     		Map<String,Object> rueqestAttribute=controller.getAttribute();
     		//֯�����Դ�����Ƭ
     		this.parseRueqestAttribute(request, rueqestAttribute);
         }	
         catch(Exception ex)
         {
        	 request.setAttribute("msg", "��ʾ:�������!");
        	 ex.printStackTrace();
         }
         request.getRequestDispatcher("/"+toPath+".jsp").forward(request, response);
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
		int initSize=((int)((tem.size()+4)/0.75))+1;
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
		dto.put("user",(String)request.getAttribute("user"));
		dto.put("role",(String)request.getAttribute("role"));
		dto.put("numb",(String)request.getAttribute("numb"));
		dto.put("name",(String)request.getAttribute("name"));
		return dto;
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		this.doGet(request, response);
	}
}
