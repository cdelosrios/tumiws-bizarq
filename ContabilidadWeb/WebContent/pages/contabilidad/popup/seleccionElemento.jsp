<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.tumi.com.pe/tumi-h" prefix="tumih"%>
	<!-- Empresa   : Cooperativa Tumi         		-->
	<!-- Autor     : Christian De los R�os 			-->
	<!-- Modulo    : Cr�ditos                 		-->
	<!-- Prototipo : SELECCIONAR ELEMENTO		    -->
	<!-- Fecha     : 15/09/2013               		-->

	<h:form id="frmSeleccionarElemento">
	   	<h:panelGrid >	   	
			<h:panelGrid columns="11">
              	<rich:column width="110" style="text-align: right;">
					<h:outputText value="Estado Financiero : "/>
		        </rich:column>
		        <rich:column width="252">
					<h:selectOneMenu
						style="width: 252px;"
						value="#{anexoPopupController.intTipoEstadoFinanciero}">
						<f:selectItem itemValue="0" itemLabel="Seleccionar"/>
						<tumih:selectItems var="sel" 
							value="#{anexoPopupController.listaTipoAnexoPopUp}" 
							itemValue="#{sel.intIdDetalle}"
							itemLabel="#{sel.strDescripcion}"/>
						<a4j:support event="onchange" 
							action="#{anexoPopupController.seleccionarEstadoFinanciero}" 
							reRender="panelSelecElementos"  />
					</h:selectOneMenu>
		        </rich:column>
            </h:panelGrid>		
	    </h:panelGrid>
	    
	    <rich:spacer height="6px"/>           
        
        <rich:panel style="text-align: center;border:0px;width=500px;overflow: scroll;height:220px;" >    
      		<h:panelGroup id="panelDesElemento">
		    	<h:panelGroup rendered="#{anexoPopupController.intNumeroOperando==1}">
		    		<h:panelGroup rendered="#{empty anexoPopupController.ratioDetalleSeleccionado.intAndeItemAnexoDetalle}">
		    			<h:outputText value="Operando 1 : No posee un elemento seleccionado actualemente"/>
		    		</h:panelGroup>
		    		<h:panelGroup rendered="#{!empty anexoPopupController.ratioDetalleSeleccionado.intAndeItemAnexoDetalle}">
		    			<h:outputText value="Operando 1 : Elemento seleccionado actualemente : '#{anexoPopupController.ratioDetalleSeleccionado.operando1.strTexto}' "/>
		    			<a4j:commandLink 
		    				value="Deseleccionar"
							action="#{anexoPopupController.deseleccionarElemento}"
							reRender="panelDesElemento,panelFormula">
						</a4j:commandLink>
		    		</h:panelGroup>
		    	</h:panelGroup>
		    	<h:panelGroup rendered="#{anexoPopupController.intNumeroOperando==2}">
		    		<h:panelGroup rendered="#{empty anexoPopupController.ratioDetalleSeleccionado.intAndeItemAnexoDetalle2}">
		    			<h:outputText value="Operando 2 : No posee un elemento seleccionado actualemente"/>
		    		</h:panelGroup>
		    		<h:panelGroup rendered="#{!empty anexoPopupController.ratioDetalleSeleccionado.intAndeItemAnexoDetalle2}">
		    			<h:outputText value="Operando 2 : Elemento seleccionado actualemente : '#{anexoPopupController.ratioDetalleSeleccionado.operando2.strTexto}' "/>
		    			<a4j:commandLink 
		    				value="Deseleccionar"
							action="#{anexoPopupController.deseleccionarElemento}"
							reRender="panelDesElemento,panelFormula">
						</a4j:commandLink>
		    		</h:panelGroup>
		    	</h:panelGroup>
		    	<h:panelGroup rendered="#{anexoPopupController.intNumeroOperando==0}">
		    		<h:panelGroup rendered="#{empty anexoPopupController.anexoDetalleSeleccionado.anexoDetalleReferencia}">
		    			<h:outputText value="No posee un elemento seleccionado actualemente"/>
		    		</h:panelGroup>
		    		<h:panelGroup rendered="#{!empty anexoPopupController.anexoDetalleSeleccionado.anexoDetalleReferencia}">
		    			<h:outputText value="Elemento seleccionado actualemente : '#{anexoPopupController.anexoDetalleSeleccionado.strTexto}' "/>
		    			<a4j:commandLink 
		    				value="Deseleccionar"
							action="#{anexoPopupController.deseleccionarElemento}"
							reRender="panelDesElemento,colListaTextoRatio">
						</a4j:commandLink>
		    		</h:panelGroup>
		    	</h:panelGroup>		    	
	    	</h:panelGroup>
	    	<rich:spacer height="4px"/>
      	<h:panelGrid width="480" id="panelSelecElementos">
			<rich:dataTable 
				id="tablaElementosSelec"
				sortMode="single" 
				var="item" 
				value="#{anexoPopupController.listaAnexoDetallePopUp}"  
				rowKeyVar="rowKey" 
				width="460px" 
				rows="#{fn:length(anexoPopupController.listaAnexoDetallePopUp)}">					
				
				<rich:column width="60" style="text-align: center">
	            	<f:facet name="header">
	                	<h:outputText value="Seleccionar"/>	                	
	                </f:facet>
	                <h:selectOneRadio style="text-align: center;">
	                	<f:selectItem itemValue="#{rowKey}"/>
						<a4j:support event="onclick"
							actionListener="#{anexoPopupController.agregarElemento}" 
							ajaxSingle="true"
							reRender="divTblEstadoFinanciero"
							oncomplete="Richfaces.hideModalPanel('pSeleccionElemento')">
								<f:attribute name="item" value="#{item}"/>
						</a4j:support>
					</h:selectOneRadio>
			   	</rich:column>
			    <rich:column width="400px" style="text-align: left" filterMethod="#{anexoPopupController.filtrarElementos}">
					<f:facet name="header">
						<h:panelGroup>
							<h:outputText value="Buscar : "/>
					        <h:inputText value="#{anexoPopupController.strTextoFiltrar}" id="input">
						   		<a4j:support event="onkeyup" ignoreDupResponses="true"
									requestDelay="500" reRender="tablaElementosSelec" focus="input" />
							</h:inputText>
					     </h:panelGroup>
					</f:facet>
					<b><h:outputText value="#{item.strNumeracion}.- " escape="false"/></b>
					<h:outputText value="#{item.strTexto}"/>
				</rich:column>
			</rich:dataTable>

		</h:panelGrid>
		</rich:panel>
	</h:form>