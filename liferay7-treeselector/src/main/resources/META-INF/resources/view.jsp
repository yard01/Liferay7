<%@ include file="/init.jsp" %>
<%@ page import="java.lang.String" %>

<%@ page import="com.github.yard01.liferay7.portlet.treeselector.controller.TreeselectorController" %>

<p>
	<b><liferay-ui:message key="liferay7-treeselector.caption"/></b>

	<aui:container>
		<aui:form action="<%= openDetailAction %>" method="post" name="formSelector">
			<aui:row>	
				<aui:fieldset>	
					<aui:col>
						<aui:input
							id="BOOKNAME"
							label="Book Name"  		 
							value="<%=controller.getBookName()%>"
							name="bookname"
							type="text" 				
						/>
						<aui:input
							id="BOOKCODE"
							value="<%=controller.getBookCode()%>"
							name="code"
							type="hidden" 
							fieldParam="<%=TreeselectorController.BOOK_CODE_PARAMETER%>"
						/>					
					</aui:col>

					<aui:col>
						<aui:button type="submit"></aui:button>
					</aui:col>
	
				</aui:fieldset>
			</aui:row>
		</aui:form>	
	</aui:container>
		
	<div id="tree_selector"></div>
	
	<aui:script>
		YUI().use(
  			'aui-tree-view',
  				function(Y) {
				    var children = JSON.parse('<%=TreeselectorController.getTreeData(request)%>');
  
					var treeView = new Y.TreeView({
        				boundingBox: '#tree_selector',
        				children: children
      				}).render();

 //   				treeView.on('click', function(event) {  	
 //   					console.info(event);
 //     	
 //  					});
    
    				treeView.after('lastSelectedChange', function(event) {
     					document.getElementById('_<%=portletId%>_BOOKCODE').value=event.newVal.get('id');
    					document.getElementById('_<%=portletId%>_BOOKNAME').value=event.newVal.get('label');
    	    	
    				});	
  				}
		);
	</aui:script>		
</p>