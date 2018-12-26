<%@ include file="/init.jsp" %>
<%@ page import="java.lang.String" %>
<%@ page import="java.util.Date" %>
<p>
	Hello! This is a modal window with a JSP-content.<br><br>
	<%=(new Date().toString()).toString()%> <br><br>
	<aui:container cssClass='super-awesome-container'>
		<aui:button type="button" value="OK"       onClick="closeDialog()"/>
		<aui:button type="button" value="Info..."  onClick="showInfo()"/>
	</aui:container>
	
	<aui:script>
		function closeDialog() {
			var data = "MODAL WINDOW [something data]";	
			Liferay.Util.getOpener().<portlet:namespace/>closePopup(data, '<portlet:namespace/>dialog');
		}
	
		function showInfo() {
			alert("Info...")
		}
	</aui:script>

</p>