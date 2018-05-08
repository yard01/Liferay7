package com.github.yard01.liferay7.portlet.handsontable.loadfromserver;

import com.liferay.portal.kernel.json.JSONArray;
import com.liferay.portal.kernel.json.JSONException;
import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.PortalUtil;

import java.io.IOException;

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
		"javax.portlet.display-name=com.github.yard01.liferay7.portlet.handsontable.load-from-server Portlet",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"com.liferay.portlet.header-portlet-css=/css/handsontable.full.css",
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class HandsontableLoadFromServerPortlet extends MVCPortlet {
	public static final String PAGE_PARAMETER = "PAGE";
	JSONObject json = JSONFactoryUtil.createJSONObject();
	
	private int page = 1;
	
	
	
	public int getPage() {
		return page;
	}
	
	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
		
		super.doView(renderRequest, renderResponse);		
	}
	
	@Override
	public void processAction(
			ActionRequest actionRequest, ActionResponse actionResponse)
		throws PortletException {
				
		actionResponse.setRenderParameter(PAGE_PARAMETER, actionRequest.getParameter(PAGE_PARAMETER));
		
	}

	
	@Override	
	public void serveResource(ResourceRequest resourceRequest, ResourceResponse resourceResponse) throws IOException, PortletException {
				
		JSONArray ar = null;
		try {
			ar = JSONFactoryUtil.createJSONArray("["
					
+"[\"\", \"Moskvich\", \"VAZ-2109\", \"Tawria\", \"Zaporozhets\"],"       
+"[\"1992\", 100,       110,      12,          13],"                      
+"[\"1993\", 200,       110,      14,          8],"                      
+"[\"1994\", 300,       150,      12,          13],"                      

+"[\"\", \"Jawa\", \"Izh\", \"Minsk\", \"Voskhod\"],"
+"[\"1987\", 10,       11,      12,          13],"
+"[\"1988\", 20,       11,      14,          13],"
+"[\"1989\", 30,       15,      12,          13],"

+"[\"\", \"Desna\", \"Salut\", \"Aist\", \"Sport-Shosse\"],"
+"[\"1987\", 123,       151,      132,          213],"
+"[\"1988\", 220,       161,      124,          133],"
+"[\"1989\", 130,       145,      212,          113]"

  +"]");
			//json.put("message", "Successful get");		
			
			
			
			json.put("dataArray", ar );
			
		
			
		} catch (JSONException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		json.put("message", "Successful get");		
				
		resourceResponse.getWriter().write(json.toJSONString());
				
		super.serveResource(resourceRequest, resourceResponse);
			
	}
}