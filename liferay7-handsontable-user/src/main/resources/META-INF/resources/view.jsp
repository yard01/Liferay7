<%@ include file="/init.jsp" %>

<p id="context"></p>
<div id="examples"></div>

<aui:script require="hnt-bundle/utils/handsontable.full.es">

	var Handsontable = hntBundleUtilsHandsontableFullEs;

	 try {

         var data = [
	  ["", "Ford", "Volvo", "Toyota", "Honda"],
	  ["2016", 10, 11, 12, 13],
	  ["2017", 20, 11, 14, 13],
	  ["2018", 30, 15, 12, 13]
		];

         var container = document.getElementById('context');
		 console.log(Handsontable);
		 var hot = new Handsontable(container, {  data: data,
				  rowHeaders: true,
				  colHeaders: true,
				  manualRowResize: true,
				  manualColumnResize: true
				});

	    } catch (err) {
			console.log(err.message);
     	}   	
</aui:script>