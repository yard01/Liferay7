<%@ include file="/init.jsp" %>

<%@ page import="com.liferay.portal.kernel.util.WebKeys"%>
<%@ page import="com.liferay.portal.kernel.theme.ThemeDisplay"%>
<%@ page import="com.liferay.portal.kernel.portlet.PortletBag"%>
<%@ page import="com.liferay.portal.kernel.portlet.PortletBagPool"%>
<%@ page import="com.github.yard01.liferay7.portlet.multipaging.portlet.MultipagingPortlet"%>
<p>
Main Page of Multipaging Portlet<br>
<b><liferay-ui:message key="com.github.yard01.liferay7.portlet.multipaging.caption"/></b><br>
<a href="<%= viewPageAURL %>"> Goto to Page A</a><br>

<%

	//
	//ThemeDisplay themeDisplay = (ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
	//the variable "themeDisplay" is aleready defined 
	
%>

<br><br><br>
<b>Miscellaneous Portlet info</b><br>
<b>portlet ID: </b><%=portletId %><br>
<b>current portlet: </b><%=thisPortlet.getClass().getName()%><br>
<b>Page A: </b><%= thisPortlet.getInitParameter("view-JspA")%><br>
	
</p>