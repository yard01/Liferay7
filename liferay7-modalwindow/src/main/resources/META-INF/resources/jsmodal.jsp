<%@ include file="/init.jsp" %>
<p>
Java Script Modal Window
</p>
<aui:select name="testSelect" id="testSelect" label ="Test Select">
	
            <aui:option selected="true" value="ALL">All</aui:option>
	
            <aui:option  value="YES">Yes</aui:option>
	
            <aui:option  value="NO">No</aui:option>
	
</aui:select>    
	
<aui:script>
	
AUI().use('aui-base', function(A){
	
A.one("#<portlet:namespace/>testSelect").on('change',function(){
	
var selectedValue = A.one('#<portlet:namespace/>testSelect').get('value');
	
console.info(selectedValue);
	
})
	

	
});
	
</aui:script>