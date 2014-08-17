<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.tumi.com.pe/tumi-h" prefix="tumih"%>
<!-- Cod. Req. : REQ14-003       			-->
<!-- Empresa   : Cooperativa Tumi         	-->
<!-- Autor     : Christian De los R�os		-->
<!-- Modulo    : Seguridad         			-->
<!-- Prototipo : Sesiones desde BD			-->
<!-- Fecha     : 12/08/2014       			-->

<rich:panel style="border: 0px solid #17356f;"
	styleClass="rich-tabcell-noborder">

	<h:panelGrid columns="4">
		<rich:column style="width: 110px">
			<h:outputText value="Esquema : " />
		</rich:column>
		<rich:column width="200px">
			<h:inputText style="width: 150px;"
				value="#{liquidateSessionController.strEsquema}" />
		</rich:column>
		<rich:column style="width: 110px">
			<h:outputText value="Objeto : " />
		</rich:column>
		<rich:column width="200px">
			<h:inputText style="width: 150px;"
				value="#{liquidateSessionController.strObjecto}" />
		</rich:column>
	</h:panelGrid>
	<rich:spacer height="10px" />
	<h:panelGrid columns="3">
		<rich:column style="width: 110px">
			<h:outputText value="Programa:"  />
		</rich:column>
		<rich:column width="200px">
			<h:inputText style="width: 150px;"
				value="#{liquidateSessionController.strPrograma}" />
		</rich:column>
		<rich:column  style="width: 110px">
        	<a4j:commandButton styleClass="btnEstilos" value="Buscar"
            	action="#{liquidateSessionController.buscarBlockDataBase}" reRender="panelBlockDB"/>
        </rich:column>  
	</h:panelGrid>

	<rich:spacer height="12px" />

	<h:panelGrid id="panelBlockDB">
		<rich:extendedDataTable id="edtBlockSessionsDB" 
          		enableContextMenu="false" 
          		sortMode="single" 
                var="item" 
                value="#{liquidateSessionController.listaBlockDataBase}"  
				rowKeyVar="rowKey" 
				rows="5" 
				width="860px" 
				height="170px"
				align="center"
				rendered="#{not empty liquidateSessionController.listaBlockDataBase}">
                               
				<rich:column width="15px">
                   	<h:outputText value="#{rowKey + 1}"></h:outputText>                        	
                   </rich:column>
                   <rich:column >
                   	<f:facet name="header">
                       	<h:outputText value="SID"/>
                     	</f:facet>
                     	<h:outputText value="#{item.strSID}"/>
               	</rich:column>
                   <rich:column>
                   	<f:facet name="header">
                       	<h:outputText value="Serial"/>
                     	</f:facet>
                     	<h:outputText value="#{item.strSerial}"/>
               	</rich:column>
                 	<rich:column>
                   	<f:facet name="header">
                       	<h:outputText value="Usuario - PC"/>
                     	</f:facet>
                     	<h:outputText value="#{item.strUserName}"/>
                   </rich:column>
                   <rich:column >
                   	<f:facet name="header">
                       	<h:outputText value="Usuario - BD"/>
                     	</f:facet>
                     	<h:outputText value="#{item.strBdUser}"/>
                 	</rich:column>
                   <rich:column>
                  		<f:facet name="header">
                       	<h:outputText value="Objeto"/>
                       </f:facet>
                       <h:outputText value="#{item.strObjectName}"/>
                 	</rich:column>
                 	<rich:column>
                  		<f:facet name="header">
                       	<h:outputText value="Programa"/>
                       </f:facet>
                       <h:outputText value="#{item.strProgram}"/>
                 	</rich:column>
                   <rich:column >
                   	<f:facet name="header">
                       	<h:outputText value="Esquema"/>
                   	</f:facet>
                   	<h:outputText value="#{item.strOwner}"/>
                 	</rich:column>
                 	<rich:column >
                 		<f:facet name="header">
                       	<h:outputText value="Sentencia SQL"/>
                    	</f:facet>
                    	<h:outputText id="lblSentSql" value="#{item.strSqlQuery}"/>
                    	<rich:toolTip for="lblSentSql" value="#{item.strSqlQuery}" followMouse="true" />
                 	</rich:column>
                   
                   	<f:facet name="footer">   
						<rich:datascroller for="edtBlockSessionsDB" maxPages="20"/>   
					</f:facet>
					
					<a4j:support event="onRowClick"
						actionListener="#{liquidateSessionController.seleccionarRegistroBlockDB}"
						reRender="panelBlockDB"
						oncomplete="Richfaces.showModalPanel('panelInactiveBlockDB')">
                        	<f:attribute name="item" value="#{item}"/>
                   	</a4j:support>
           	</rich:extendedDataTable>
	</h:panelGrid>

	<h:panelGrid columns="2">
	   	<h:outputLink value="#" id="linkPanelBlockDB">
	        <h:graphicImage value="/images/icons/mensaje1.jpg"
				style="border:0px"/>
			<rich:componentControl for="panelInactiveBlockDB" attachTo="linkPanelBlockDB" operation="show" event="onclick"/>
	    </h:outputLink>
	    <h:outputText value="Para culminar con la sesi�n hacer clic en el Registro" style="color:#8ca0bd"/>
	</h:panelGrid>
</rich:panel>
