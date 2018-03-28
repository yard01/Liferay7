<%@ include file="/init.jsp" %>

<p>
	<b><liferay-ui:message key="ru.cbr.webpsd.jquery.examples.caption"/></b>
	
	<portlet:resourceURL var="sendData"/>
	
	<p id="hnt_context"></p>

<aui:script require="hnt-bundle/utils/handsontable.full.es">
	var fullAddr = '<%=sendData%>';
	var Handsontable = hntBundleUtilsHandsontableFullEs;

	 try {

         var data = [
	  ["", "Ford", "Volvo", "Toyota", "Honda"],
	  ["2016", 10, 11, 12, 13],
	  ["2017", 20, 11, 14, 13],
	  ["2018", 30, 15, 12, 13]
		];

         var container = document.getElementById('hnt_context');
		 console.log(Handsontable);
		 var hot = new Handsontable(container, {  data: data,
				  rowHeaders: true,
				  colHeaders: true,
				  manualRowResize: true,
				  manualColumnResize: true,
				  
				  beforeChange: function(change, source) {
					  console.log("BEFORE: " + change + " : " + source);
					  
				  },
		 
				  afterChange: function(change, source) {
			  			//source = edit or loadData
					    console.log("AFTER: " + change + " : " + source);
			  			if (change === null) return;
			  			jQuery.ajax({
							url : fullAddr,
							data : {<portlet:namespace/>changedCellInfo:change},
							type: 'POST',
							dataType: 'json',
							error: function(obj) {
								console.info('error: ');
								Object.getOwnPropertyNames(obj).forEach(function(val, idx, array){console.info(val +'->'+obj[val])});
							},				
							success: function(msg) {					
								console.info(msg.message);
							}
						});
		  		  }

				});

	    } catch (err) {
			console.log(err.message);
     	}   
	    
</aui:script>	
	
</p>