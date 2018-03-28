package com.github.yard01.liferay7.portlet.handsontable.savetoserver;

import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;
import com.liferay.portal.kernel.servlet.SessionMessages;
import com.liferay.portal.kernel.util.ParamUtil;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;
import java.util.Map;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.Portlet;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.osgi.service.component.annotations.Component;

/**
 * @author yard
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.instanceable=true",
		"javax.portlet.display-name=Save to server data of Handsontable",
		"javax.portlet.init-param.template-path=/",
		"com.liferay.portlet.header-portlet-css=/css/handsontable.full.css",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class HandsontableSaveDataPortlet extends MVCPortlet {
	
	JSONObject json = JSONFactoryUtil.createJSONObject();
	
	public static final String CHANGED_CELL_PARAMETER = "changedCellInfo";	
	
	@Override	
	public void serveResource(ResourceRequest resourceRequest, ResourceResponse resourceResponse) throws IOException, PortletException {
		
		String[] values = resourceRequest.getParameterValues(CHANGED_CELL_PARAMETER+"[0][]");
		
		System.out.println(String.format("Cell info \r\n  row: %s, column: %s, \r\n first value: %s, last value: %s",values[0],values[1],values[2],values[3]));	
		
		json.put("message", "Successful changes!");		
		
		resourceResponse.getWriter().write(json.toJSONString());//jsonResponse.getBytes());
		
		super.serveResource(resourceRequest, resourceResponse);
			
	}
	

}