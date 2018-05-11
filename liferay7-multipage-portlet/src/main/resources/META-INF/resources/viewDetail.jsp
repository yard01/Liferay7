<%@ include file="/init.jsp" %>
<%@ page import="java.util.Enumeration"%>
<p>

	<b><liferay-ui:message key="caption.C"/></b>
	<br>
	Details<br>
	<%Enumeration <String> en = request.getParameterNames();
			
		while (en.hasMoreElements()) {
	%>
		<br>
		<%String par = en.nextElement(); %>
		<%=par%>: <%=request.getParameter(par) %>  
	<%} %>
	<br>
	<a href="<%=viewPageBURL%>" >Back</a>
</p>