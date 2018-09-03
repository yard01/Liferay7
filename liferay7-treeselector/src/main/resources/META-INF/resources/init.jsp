<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %><%@
taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %><%@
taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %><%@
taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>

<%@ page import="com.liferay.portal.kernel.util.WebKeys"%>
<%@ page import="com.liferay.portal.kernel.theme.ThemeDisplay"%>
<%@ page import="com.liferay.portal.kernel.portlet.PortletBag"%>
<%@ page import="com.liferay.portal.kernel.portlet.PortletBagPool"%>
<%@ page import="com.github.yard01.liferay7.portlet.treeselector.TreeselectorPortlet"%>
<%@ page import="com.github.yard01.liferay7.portlet.treeselector.controller.TreeselectorController"%>
<%
	//!INFO!
	//ThemeDisplay themeDisplay = (ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
	//the variable "themeDisplay" is aleready defined
	//themeDisplay can be used in view JSP pages 
	
	ThemeDisplay tDisplay = (ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);		
	PortletBag portletBag = PortletBagPool.get(tDisplay.getPortletDisplay().getRootPortletId());
	TreeselectorPortlet thisPortlet =(TreeselectorPortlet)portletBag.getPortletInstance();		
	String portletId = tDisplay.getPortletDisplay().getId();
%>

<liferay-theme:defineObjects />

<portlet:defineObjects />

<portlet:actionURL var="openDetailAction" name="openDetail">
    <portlet:param name="jspPage" value="<%=thisPortlet.getInitParameter("pages-detail") %>" />  
</portlet:actionURL>

<portlet:renderURL var="viewMainPageURL">
   	<portlet:param name="jspPage" value="<%=thisPortlet.getInitParameter("view-template") %>"  />
</portlet:renderURL>	

<%
TreeselectorController controller = TreeselectorController.getInstance(request);
%>

