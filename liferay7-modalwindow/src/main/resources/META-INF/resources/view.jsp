<%@ include file="/init.jsp" %>
<%@ page import="com.liferay.portal.kernel.portlet.LiferayWindowState" %>

<p>
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
	</aui:row>	
	
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
	</aui:script>
	
</p>