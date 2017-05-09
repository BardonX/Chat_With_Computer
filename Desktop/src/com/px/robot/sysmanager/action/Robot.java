package com.px.robot.sysmanager.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 
 * @ClassName: Robot
 * @Description: 控制器+功能实现
 * @author: Bardon
 * @date: 2017年5月4日 上午8:39:33
 * @version1.0
 */
public class Robot extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String text=req.getParameter("text");
		System.out.println(text);
		String result=query(text);
		System.out.println(result+query(text));
		resp.getWriter().print(result);
		
	}

	/**
	 * 主要方法，调用网络接口，返回信息
	 * @Title: query
	 * @Author: Bardon
	 * @Time: 2017年5月4日 上午8:39:55
	 * @params: @param text
	 * @params: @return
	 * @return: String
	 * @throws
	 */
	public static String query(String text){
		//涔辩爜
		//String INFO="";
		String ACTION="http://www.tuling123.com/openapi/api?key=1545a3cdeb544198abecbc5337137a01&info=";
		//String aPIKEY="";
		InputStream is=null;
		InputStreamReader ir=null;
		BufferedReader br=null;
		StringBuffer sBuffer=new StringBuffer();
		try {
			String question=URLEncoder.encode(text,"UTF-8");
			
			URL url=new URL(ACTION+question);
			URLConnection connection = url.openConnection();
			is = connection.getInputStream();
			ir=new InputStreamReader(is,"UTF-8");
			br=new BufferedReader(ir);
			String line="";
			
			while((line=br.readLine())!=null){
				sBuffer.append(line);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(br!=null){
					br.close();
				}
				if(ir!=null){
					ir.close();
				}
				if(is!=null){
					is.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			
		}
		System.out.println(sBuffer.toString());
		return sBuffer.toString();
	}
	public static void main(String[] args) {
		String string=query("早上好");
		System.out.println(string);
	}
}
