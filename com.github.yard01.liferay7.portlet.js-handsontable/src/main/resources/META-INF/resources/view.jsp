<%@ include file="/init.jsp" %>

<p>
	<b><liferay-ui:message key="js-hnt.caption"/></b>
	<div id = "examples"></div>	
	<script>
    	define._amd = define.amd;
    	define.amd = false;
	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/dist/handsontable.full.js">	
	</script>	
	
	<script>	
	var data = [
		  ["", "Ford", "Volvo", "Toyota", "Honda"],
		  ["2016", 10, 11, 12, 13],
		  ["2017", 20, 11, 14, 13],
		  ["2018", 30, 15, 12, 13]
		];
		 
		var container = document.getElementById('examples');
		var hot = new Handsontable(container, {
		  data: data,
		  rowHeaders: true,
		  colHeaders: true,
		  manualRowResize: true,
		  manualColumnResize: true
		});	    
	    
	</script>
		
	<script>
    	define.amd = define._amd;
	</script>		
	
</p>
