package com.github.yard01.liferay7.portlet.treeselector;

import com.github.yard01.liferay7.portlet.treeselector.controller.TreeselectorController;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;
import java.io.IOException;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.Portlet;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.osgi.service.component.annotations.Component;

/**
 * @author yard
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.instanceable=true",
		"javax.portlet.display-name=liferay7-treeselector Portlet",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.init-param.pages-detail=/detail.jsp",		
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class TreeselectorPortlet extends MVCPortlet {
	public static final String JSP_PAGE_PARAMETER = "jspPage"; 	
	
	@Override
	public void render(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
		super.render(renderRequest, renderResponse);
	}
			
	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
		super.doView(renderRequest, renderResponse);
	}	
	
	public void openDetail(
			ActionRequest actionRequest, ActionResponse actionResponse)
		throws PortletException {
		//fill parameters		
		TreeselectorController.getInstance(actionRequest).readParameters(actionRequest);
		////////////////
		String redirectUrl = (String)actionRequest.getParameter(JSP_PAGE_PARAMETER);		
		actionResponse.setRenderParameter(JSP_PAGE_PARAMETER, redirectUrl);
	}	

}