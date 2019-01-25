<%@ include file="/init.jsp" %>
<%@ page import="com.liferay.portal.kernel.portlet.LiferayWindowState" %>

<p>
- 	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jsmodal.css" />     

	<b><liferay-ui:message key="com.github.yard01.liferay7.portlet.modalwindow.caption"/></b>
	 
	<portlet:renderURL var ="popupUrl" windowState="<%=LiferayWindowState.POP_UP.toString() %>">
		<portlet:param name="mvcPath" value="/modal.jsp"/>
	</portlet:renderURL>
	
	<aui:row>
		<aui:col md="1" sd="2">
			<aui:button type="button" value="JSP Modal" onClick="openModalWindow()"></aui:button>
		</aui:col>
		<aui:col md="1" sd="2">
			<aui:button type="button" value="Easy HTML-Modal" onClick="openEasyModal()"></aui:button>
		</aui:col>
		<aui:col md="1" sd="2">
			<aui:button type="button" value="Java Script Modal" onClick="openJSModal()"></aui:button>
		</aui:col>				
	</aui:row>	
	
	<!-- The Modal -->
	<div id="myJSModal" class="modal_demo">
	<!-- Modal content -->
  		<div class="modal-content_demo">
    		<div class="modal-header_demo">
      			<span class="close">&times;</span>
      			<h2>Modal Header</h2>
    		</div>
    		
    		<div class="modal-body_demo">
      			<p>Some text in the Modal Body</p>      			
			    <p>Some other text...</p>
			    <br><jsp:include page="/jsmodal.jsp"/>
			    
		    </div>
		    
    		<div class="modal-footer_demo">
      			<h2>Modal Footer</h2>
    		</div>
  		</div>
	</div>	
	<aui:script>
		Liferay.provide(
		   window,
		   '<portlet:namespace/>closePopup',
		   function(data, customPopUpId) {
			    var dialog=Liferay.Util.Window.getById(customPopUpId);
			    console.info("Somthing data from the modal window: " + data);
			    dialog.destroy();			
		  },
		  ['liferay-util-window']	
		);
		
		function openModalWindow() {
			Liferay.Util.openWindow({dialog: {
				centered: true,
				height: 500,
				modal: true,
				width: 500
			},
			id: '<portlet:namespace/>dialog',
			title: 'Demo Dialog',
			uri: '<%=popupUrl%>'	
				});
		};	
			
		function openEasyModal() {
			   YUI({ filter:'raw' }).use('aui-modal', 'aui-io','resize-proxy', function(Y) {

			        console.time('How long does it take?');
					var nd = Y.Node.create('<div id="dialog">111111 <br><div></div></div>');

			        var modal = new Y.Modal({
			            bodyContent: 'One fine body...<br>'
			            + '<p id="tbl">This is HTML</p>'	          
			            ,
			            centered: true,
			            cssClass: 'foo',
			            destroyOnHide: true,
			            headerContent: '<h3>Modal header</h3>',
			            // height: 400,
			            modal: true,
			            render: '#content',
			            visible: true,
			            draggable: true
			        }).render();

			        modal.addToolbar([
			            {
			                label: 'Cancel',
			                on: {
			                    click: function() { modal.hide(); }
			                }
			            },
			            {
			                label: 'OK',
			                on: {
			                    click: function() { alert('This is the primary action!'); }
			                },
			                primary: true
			            }
			        ]);

			        console.timeEnd('How long does it take?');

			    });    
		
		};
		
		var modal = document.getElementById('myJSModal');
		var span = document.getElementsByClassName("close")[0];
		function openJSModal() {
			modal.style.display = "block";
		}
		
		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}
		
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
		  if (event.target == modal) {
		    modal.style.display = "none";
		  }
		}
	</aui:script>
	
</p>