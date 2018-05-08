<%@ include file="/init.jsp" %>
<%@ page import="java.lang.String" %>
<%@ page import="java.lang.Integer" %>
<%@ page import="com.github.yard01.liferay7.portlet.handsontable.loadfromserver.HandsontableLoadFromServerPortlet" %>
<p>
<%
String currentPageDirect = request.getParameter(HandsontableLoadFromServerPortlet.PAGE_PARAMETER);
Object currentPageParameter = request.getSession().getAttribute(HandsontableLoadFromServerPortlet.PAGE_PARAMETER);
Integer currentPage = 1;
if (currentPageParameter != null) currentPage = Integer.valueOf(currentPageParameter.toString());

if (currentPageDirect != null) currentPage+=Integer.valueOf(currentPageDirect);
if (currentPage==0) currentPage = 1;
request.getSession().setAttribute(HandsontableLoadFromServerPortlet.PAGE_PARAMETER, currentPage.toString());
%>
	<b><liferay-ui:message key="com.github.yard01.liferay7.portlet.handsontable.load-from-server.caption"/></b>
	
	<style type = 'text/css'>
		.table_block {
			width: 500px;
			height: 300px;
			background: #cgc;
			overflow: hidden;
		}
		.button_columns {
			background: #cgc;			
		}
		
	</style>
	<!--!!!!PORTLET ADDRESS!!!!-->
	<portlet:resourceURL var="sendData"/>
	<!--!!!!!!!!!!!!!!!!!!!!!!!-->
	
	<liferay-portlet:actionURL var="editAction" name="addEvent"/>
	<br>
		Page <%=currentPage %>
	<br>
	
	<aui:container>
		<aui:row>
			<aui:col md="4" sm="4" cssClass="button_columns">
				<aui:form action="<%=editAction%>" method="post">
					<aui:input i="pg" name="<%=HandsontableLoadFromServerPortlet.PAGE_PARAMETER %>" type="hidden" value="-1">		</aui:input>					
					<aui:button id="page1" name="PAGE1" type="submit" value="Prev"></aui:button>
				</aui:form>
					
			</aui:col>
			<aui:col md="4" sm="4" cssClass="button_columns">
				<aui:form action="<%=editAction%>" method="post">
					<aui:input i="pg" name="<%=HandsontableLoadFromServerPortlet.PAGE_PARAMETER %>" type="hidden" value="1">		</aui:input>										
					<aui:button id="page2" name="PAGE1" type="submit" value="Next"></aui:button>
				</aui:form>	
					
			</aui:col>			
		</aui:row>
	</aui:container>
			
	<div class="table_block" id="hnt_context"></div>

	<aui:script require="hnt-bundle/utils/handsontable.full.es">
	
		var fullAddr = '<%=sendData%>';
		var Handsontable = hntBundleUtilsHandsontableFullEs;
	
	
	 	try {
		
        var data = "";
		
		jQuery.ajax({
			url : fullAddr,
			data : {<portlet:namespace/>query:'content'},
			type: 'GET',
			dataType: 'json',
			error: function(obj) {
				console.info('error: ');
				Object.getOwnPropertyNames(obj).forEach(function(val, idx, array){console.info(val +'->'+obj[val])});
			},				
			success: function(msg) {
								
				var getData = (function () {				 
					var load_data = msg.dataArray;
								
					return function() {
						var page = <%=currentPage%>,//parseInt(window.location.hash.replace('#',''),10) || 1, 
						limit = 4, 
						row = (page - 1)*limit,
						count = page * limit,
						part = [];
						
						for (;row < count;row++) {
							part.push(load_data[row]);
						}
						
						return part;
					}
				})();
								
				
				 var container = document.getElementById('hnt_context');
				 console.log(Handsontable);
				 
				 function firstRowRenderer(instance, td, row, col, prop, value, cellProperties) {
					 Handsontable.renderers.TextRenderer.apply(this, arguments);
					 td.style.fontWeight = 'bold';
					 td.style.color = 'green';
					 td.style.background = '#CEC';
				 }
				 function alternateRowRenderer(instance, td, row, col, prop, value, cellProperties) {
					 Handsontable.renderers.TextRenderer.apply(this, arguments);
					 td.style.background = '#CCE';
				 }
				 
				
				 var hot = new Handsontable(container, {  data: getData(),
						  rowHeaders: true,
						  colHeaders: true,
						  manualRowResize: true,
						  manualColumnResize: true,
						  fixedRowsTop: 1,
						  fixedColumnsLeft: 1,
						  width: 500,
						  heigh: 300,
						  overflow: 'hidden',
						  colWidths: 98,
						  rowHeigths: 23,
				  		  cells: function(row, col, prop) {
				  			  var cellProperties = {};
			  				  cellProperties.editor = false;

				  			  if (row === 0) {
				  				  cellProperties.renderer = firstRowRenderer;
				  			  } else {
				  				  if (row & 1 === 1) {
					  				 cellProperties.renderer = alternateRowRenderer;
				  				  }
				  			  }	  
				  			  return cellProperties;
				  		  }

						});
				 
				Handsontable.dom.addEvent(window, 'hashchange', function (event) {
					hot.loadData(getData());
				});
				 
			}
		});                
	    } catch (err) {
			console.log(err.message);
     	}   
	    
	</aui:script>	
	
</p>