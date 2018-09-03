package com.github.yard01.liferay7.portlet.treeselector.utils;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;

import javax.portlet.PortletContext;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;

public class TreeselectorUtils {
	
	private static String readSource(InputStream source, String encoding) throws MalformedURLException, IOException {
		byte[] raw = IOUtils.toByteArray(source);	
		return  new String(raw, encoding).replaceAll("\\p{Cntrl}",""); 		
	}
		
	public static String loadResourceAsString(String path, ServletContext context, String encoding) throws MalformedURLException, IOException {
		return readSource(context.getResource(path).openStream(), encoding);
	}

	public static String loadResourceAsString(String path, PortletContext context, String encoding) throws MalformedURLException, IOException {
		return readSource(context.getResource(path).openStream(), encoding);
	}

	public static void setSessionAttribute(HttpServletRequest request, String attributeName, Object attribute) {
		request.getSession().setAttribute(attributeName, attribute);		
	}

	public static Object getSessionAttribute(HttpServletRequest request, String attributeName) {
		 return request.getSession().getAttribute(attributeName);		
	}
}
