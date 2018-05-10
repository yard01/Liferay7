package com.github.yard01.liferay7.portlet.multipaging.portlet;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.portlet.PortletBag;
import com.liferay.portal.kernel.portlet.PortletBagPool;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;
import com.liferay.portal.kernel.theme.ThemeDisplay;
import com.liferay.portal.kernel.util.PortalUtil;
import com.liferay.portal.kernel.util.WebKeys;

import java.io.IOException;
import java.util.Enumeration;

import javax.portlet.Portlet;
import javax.portlet.PortletException;
import javax.portlet.PortletRequestDispatcher;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.osgi.service.component.annotations.Component;

/**
 * @author yard
 */
@Component(immediate = true, property = { "com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.instanceable=true", 
		"javax.portlet.display-name=Multipaging Portlet",
		"javax.portlet.init-param.template-path=/", 
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.init-param.view-JspA=/viewA.jsp",
		"javax.portlet.init-param.view-JspB=/viewB.jsp",	
		"javax.portlet.security-role-ref=power-user,user" }, 
service = Portlet.class)

public class MultipagingPortlet extends MVCPortlet {
	
	protected String view_JspA;
	protected String view_JspB;
	
	@Override
	public void init() throws PortletException {
		
		view_JspA = getInitParameter("view-JspA");
		view_JspB = getInitParameter("view-JspB");
		//PortletBagPool pb;
		
		//request.getAttribute(WebKeys.THEME_DISPLAY);
		super.init();
	}
		
	
	@Override
	public void doView(RenderRequest request, RenderResponse response) throws IOException, PortletException {
		//super.doView(request, response);
		
		
		String viewJSP = "";
		PortletRequestDispatcher portletRequestDispatcher = null;

		ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);

		boolean isSignedIn = themeDisplay.isSignedIn();

		if (isSignedIn) {
			viewJSP = view_JspA;
		} else {
			viewJSP = view_JspB;
		}

		portletRequestDispatcher = getPortletContext().getRequestDispatcher(viewJSP);

		if (portletRequestDispatcher == null) {
			_log.error(viewJSP + " is not a valid include");
		}

		else {
			try {
				portletRequestDispatcher.include(request, response);
				
			} catch (Exception e) {
				_log.error("Error Occured:" + e);
			}
		}
				
	}

	private static Log _log = LogFactoryUtil.getLog(MultipagingPortlet.class);
}
