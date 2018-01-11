package com.github.yard01.liferay7.portlet.handsontable.user;

import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;

import javax.portlet.Portlet;

import org.osgi.service.component.annotations.Component;

/**
 * @author yard
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.instanceable=true",
		"javax.portlet.display-name=Handsontable-Bundle user",
		"javax.portlet.init-param.template-path=/",
		"com.liferay.portlet.header-portlet-css=/css/handsontable.full.css",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class HandsontableUserPortlet extends MVCPortlet {
}