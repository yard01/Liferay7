<%@ include file="/init.jsp" %>

<p>
	<b><liferay-ui:message key="caption.B"/></b>
	
</p>

<p id="context"></p>

<aui:script require="hnt-bundle/utils/handsontable.full.es">

// original by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
	function strip_tags(input, allowed) {
    	var tags = /<\/?([a-z][a-z0-9]*)\b[^>]*>/gi,
      commentsAndPhpTags = /<!--[\s\S]*?-->|<\?(?:php)?[\s\S]*?\?>/gi;

    // making sure the allowed arg is a string containing only tags in lowercase (<a><b><c>)
    	allowed = (((allowed || "") + "").toLowerCase().match(/<[a-z][a-z0-9]*>/g) || []).join('');

    	return input.replace(commentsAndPhpTags, '').replace(tags, function ($0, $1) {
      		return allowed.indexOf('<' + $1.toLowerCase() + '>') > -1 ? $0 : '';
    	});
  	}
  	
	function safeHtmlRenderer(instance, td, row, col, prop, value, cellProperties) {
	    var escaped = Handsontable.helper.stringify(value);
	    escaped = strip_tags(escaped, '<em><b><strong><a><big>'); //be sure you only allow certain HTML tags to avoid XSS threats (you should also remove unwanted HTML attributes)
	    td.innerHTML = escaped;

	    return td;
	}
  	
	function customRenderer(instance, td) {
	    Handsontable.renderers.TextRenderer.apply(this, arguments);

	    if (isChecked) {
	      td.style.backgroundColor = 'yellow';
	    }
	    else {
	      td.style.backgroundColor = 'white';
	    }

	    return td;
	  }
	
	var Handsontable = hntBundleUtilsHandsontableFullEs;

	 try {

		 
         var data = [
	  ["", "Ford", "Volvo", "Toyota", "Honda"],
	  ["2016", "<a href='<%= viewPageDetailURL %>'> 555</a>", 11, 12, 13],
	  ["2017", 20, 11, "<big>14</big>", "<b>13</b>"],
	  ["2018", 30, 15, "<strong>12</strong>", 13]
		];

         var container = document.getElementById('context');
		 //console.log(Handsontable);
		 var isChecked;
		 
		 var hot = new Handsontable(container, {  data: data,
				  rowHeaders: true,
				  //colHeaders: true,
				  manualRowResize: true,
				  manualColumnResize: true,
				  columns: [
					  {renderer: "html"},
				      {renderer: "html"},
				      {renderer: customRenderer},
				      {renderer: safeHtmlRenderer},
				      {renderer: "html"}
				    ],
				    
				    colHeaders: function (col) {
				        var txt;

				        switch (col) {
				          case 0:
				            return '<b>Bold</b> and <em>Beautiful</em>';
				          case 1: return "1";
				          case 2:
				            txt = "Some <input type='checkbox' class='checker' ";
				            txt += isChecked ? 'checked="checked"' : '';
				            txt += "> checkbox";

				            return txt;
				          case 3: return "3";
				          case 4: return "4";
				          
				        }
				      }
				});
		  	
		 	Handsontable.dom.addEvent(container, 'mousedown', function (event) {
			    if (event.target.nodeName == 'INPUT' && event.target.className == 'checker') {
			      event.stopPropagation();
			    }
			  });

			  Handsontable.dom.addEvent(container, 'mouseup', function (event) {
			    if (event.target.nodeName == 'INPUT' && event.target.className == 'checker') {
			      isChecked = !event.target.checked;
			      hot.render();
			    }
			  });


	    } catch (err) {
			console.log(err.message);
     	}   	
</aui:script>