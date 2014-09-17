<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.tumi.com.pe/tumi-h" prefix="tumih"%>
	
	<!-- Empresa   : Cooperativa Tumi         -->
	<!-- Autor     : Arturo Julca    		  -->		

<a4j:include viewId="/pages/conciliacion/popup/buscarBancoCuenta.jsp"/>

<h:form>
   	<h:panelGroup layout="block" style="padding:15px;border:1px solid #B3B3B3;text-align: left;">
        	
        	<h:panelGrid style="margin:0 auto; margin-bottom:10px">
	    		<rich:columnGroup>
	    			<rich:column>
	    				<h:outputText value="CONCILIACION BANCARIA" style="font-weight:bold; font-size:14px"/>
	    			</rich:column>
	    		</rich:columnGroup>
    		</h:panelGrid>
             
            <h:panelGrid columns="11">
				<rich:column width="130" style="text-align: right;">
                	<a4j:commandButton styleClass="btnEstilos"
                		value="Buscar" 
                		reRender="panelTablaResultados,panelMensaje"
                    	action="#{conciliacionController.buscar}"
                    	style="width:130px"/>
            	</rich:column>
			</h:panelGrid>
            
            <rich:spacer height="12px"/>
                
            <h:panelGrid id="panelTablaResultados">
	        	<rich:extendedDataTable id="tblResultado" 
	          		enableContextMenu="false" 
	          		sortMode="single" 
                    var="item" 
                    value="#{conciliacionController.listaConciliacion}"  
					rowKeyVar="rowKey" 
					rows="5" 
					width="1030px" 
					height="160px" 
					align="center">
                                
					<rich:column width="40" style="text-align: center">
                    	<f:facet name="header">
                        	<h:outputText value="Nro"/>
                      	</f:facet>
                    </rich:column>
                    <rich:column width="130" style="text-align: center">
                    	<f:facet name="header">
                        	<h:outputText value="Documento"/>
                      	</f:facet>
                    </rich:column>
					<rich:column width="250" style="text-align: center">
                    	<f:facet name="header">
                        	<h:outputText value="Entidad de Pago"/>
                      	</f:facet>	
                    </rich:column>
                  	<rich:column width="180" style="text-align: center">
                    	<f:facet name="header">
                        	<h:outputText value="Sucursal"/>
                      	</f:facet>
                    </rich:column>
                    <rich:column width="80" style="text-align: center">
                    	<f:facet name="header">
                      		<h:outputText value="Fecha"/>
                      	</f:facet>
                  	</rich:column>
                    <rich:column width="100" style="text-align: center">
                    	<f:facet name="header">
                        	<h:outputText value="Tipo Operaci�n"/>
                      	</f:facet>
                    </rich:column>
                    <rich:column width="80" style="text-align: center">
                    	<f:facet name="header">
                      		<h:outputText value="Periodo"/>
                      	</f:facet>
                  	</rich:column>
                    <rich:column width="80" style="text-align: center">
                    	<f:facet name="header">
                      		<h:outputText value="Monto"/>
                      	</f:facet>
                  	</rich:column>
                    <rich:column width="100" style="text-align: center">
                    	<f:facet name="header">
                        	<h:outputText value="Estado Pago"/>
                      	</f:facet>
                    </rich:column>
                    
                  	<a4j:support event="onRowClick"
                   		actionListener="#{conciliacionController.seleccionarRegistro}"
                   		oncomplete="Richfaces.showModalPanel('pAlertaRegistro')"
						reRender="pAlertaRegistro">
                    	<f:attribute name="item" value="#{item}"/>
                   	</a4j:support>
                   	<f:facet name="footer">
						<rich:datascroller for="tblResultado" maxPages="10"/>   
					</f:facet>
                   	
            	</rich:extendedDataTable>
            	
         	</h:panelGrid>
	          	                 
			<h:panelGrid columns="2" style="margin-left: auto; margin-right: auto">
				<a4j:commandLink action="#">
					<h:graphicImage value="/images/icons/mensaje1.jpg" style="border:0px"/>
				</a4j:commandLink>
				<h:outputText value="Para anular o ver una Conciliacion Bancaria hacer click en el registro" style="color:#8ca0bd"/>
			</h:panelGrid>

				
		<h:panelGroup id="panelMensaje" style="border: 0px solid #17356f;background-color:#DEEBF5;text-align: center"
			styleClass="rich-tabcell-noborder">
			<h:outputText value="#{conciliacionController.mensajeOperacion}" 
				styleClass="msgInfo"
				style="font-weight:bold"
				rendered="#{conciliacionController.mostrarMensajeExito}"/>
			<h:outputText value="#{conciliacionController.mensajeOperacion}" 
				styleClass="msgError"
				style="font-weight:bold"
				rendered="#{conciliacionController.mostrarMensajeError}"/>
		</h:panelGroup>
				 		
		<h:panelGroup style="border: 0px solid #17356f;background-color:#DEEBF5;" styleClass="rich-tabcell-noborder"
			id="panelBotones">
			<h:panelGrid columns="4">
				<a4j:commandButton value="Nuevo" 
					styleClass="btnEstilos" 
					style="width:90px" 
					action="#{conciliacionController.habilitarPanelInferior}" 
					reRender="contPanelInferior,panelMensaje,panelBotones" />                     
			    <a4j:commandButton value="Grabar" 
			    	styleClass="btnEstilos" 
			    	style="width:90px"
			    	action="#{conciliacionController.grabar}" 
			    	reRender="contPanelInferior,panelMensaje,panelBotones,panelTablaResultados"
			    	disabled="#{!conciliacionController.habilitarGrabar}"/>
			    <a4j:commandButton value="Cancelar" 
			    	styleClass="btnEstilos"
			    	style="width:90px"
			    	action="#{conciliacionController.deshabilitarPanelInferior}" 
			    	reRender="contPanelInferior,panelMensaje,panelBotones"/>      
			</h:panelGrid>
		</h:panelGroup>
		
		
		
	<h:panelGroup id="contPanelInferior">
	
	<rich:panel  rendered="#{conciliacionController.mostrarPanelInferior}"	style="border:1px solid #17356f;background-color:#DEEBF5;">
	<rich:spacer height="12px"/>
		
		<h:panelGroup id="panelDatosSinValidar">
		<h:panelGrid columns="16" id="panelMonto">
			<rich:column width=	"120">
				<h:outputText value="Fecha Conciliaci�n : "/>
			</rich:column>
			<rich:column width="160">
				<h:inputText size="20"
					readonly="true"
					value="#{conciliacionController.conciliacionNuevo.tsFechaConciliacion}"
					style="background-color: #BFBFBF;font-weight:bold;">
					<f:convertDateTime pattern="dd/MM/yyyy"/>
				</h:inputText>
			</rich:column>
			<rich:column width=	"140">
				<h:outputText value="Tipo de Documento : "/>
			</rich:column>
			<rich:column width="160">
				<h:selectOneMenu
					style="width: 150px;"
					value="#{conciliacionController.conciliacionNuevo.intParaDocumentoGeneralFiltro}"
					disabled="#{conciliacionController.datosValidados}">
					<tumih:selectItems var="sel"
						cache="#{applicationScope.Constante.PARAM_T_DOCUMENTOGENERAL}"
						itemValue="#{sel.intIdDetalle}"
						itemLabel="#{sel.strDescripcion}"/>
				</h:selectOneMenu>
			</rich:column>
			<rich:column width=	"140">
				<h:outputText value="Estado de Registro : "/>
			</rich:column>
			<rich:column width="160">
				<h:selectOneMenu
					disabled="#{conciliacionController.datosValidados}"
					style="width: 150px;"
					value="#{conciliacionController.conciliacionNuevo.intEstadoCheckFiltro}">
					<f:selectItem itemValue="1" itemLabel="Todos"/>
					<f:selectItem itemValue="1" itemLabel="No Conciliado"/>
					<f:selectItem itemValue="1" itemLabel="Chekeado"/>
				</h:selectOneMenu>
			</rich:column>
		</h:panelGrid>
		
		<rich:spacer height="10px"/>
		
		<h:panelGrid columns="8">
			<rich:column width=	"120">
				<h:outputText value="Cuenta Bancaria : "/>
			</rich:column>
			<rich:column width="450">
				<h:inputText
					rendered="#{empty conciliacionController.conciliacionNuevo.bancoCuenta}"
					size="70"
					readonly="true"
					style="background-color: #BFBFBF;font-weight:bold;"/>
				<h:inputText
					rendered="#{not empty conciliacionController.conciliacionNuevo.bancoCuenta}"
					value="#{conciliacionController.conciliacionNuevo.bancoCuenta.strNombrecuenta} - #{conciliacionController.conciliacionNuevo.bancoCuenta.strNumerocuenta}"
					size="70"
					readonly="true"
					style="background-color: #BFBFBF;font-weight:bold;"/>
			</rich:column>
			<rich:column width="150">
				<a4j:commandButton styleClass="btnEstilos"
					value="Buscar Cuenta"
	                disabled="#{conciliacionController.datosValidados}"
	                reRender="pBuscarBancoCuenta"
	                oncomplete="Richfaces.showModalPanel('pBuscarBancoCuenta')"
	                action="#{conciliacionController.abrirPopUpBuscarBancoCuenta}"
	                style="width:150px"/>
			</rich:column>
		</h:panelGrid>
		
		<rich:spacer height="5px"/>
		
		<h:panelGrid columns="1" rendered="#{!conciliacionController.datosValidados}">
			<rich:column width="940">
				<a4j:commandButton styleClass="btnEstilos"
		        	disabled="#{empty conciliacionController.conciliacionNuevo.bancoCuenta}"
		        	value="Validar Datos"
		            reRender="contPanelInferior,panelBotones"
		            action="#{conciliacionController.validarDatos}"
		            style="width:940px"/>
			</rich:column>
		</h:panelGrid>
	
		</h:panelGroup>
		
		
		<h:panelGrid id="panelDatosValidados" rendered="#{conciliacionController.datosValidados}">
		
		<rich:column width=	"910">
			<rich:dataTable
				sortMode="single"
				var="item"
				value="#{conciliacionController.conciliacionNuevo.listaConciliacionDetalle}"
				rowKeyVar="rowKey"
				width="955px"
				rows="#{fn:length(conciliacionController.conciliacionNuevo.listaConciliacionDetalle)}">
				
				<rich:column width="30" style="text-align: center">
					<f:facet name="header">
		           		<h:outputText value="Tipo"/>
		         	</f:facet>
		         	<h:outputText rendered="#{not empty item.egreso}" value="E"/>
		         	<h:outputText rendered="#{not empty item.ingreso}" value="I"/>
				</rich:column>
				<rich:column width="150" style="text-align: right">
		        	<f:facet name="header">
		           		<h:outputText value="Documento"/>
		         	</f:facet>
		         	<h:panelGroup rendered="#{not empty item.egreso}">
		         	<tumih:outputText cache="#{applicationScope.Constante.PARAM_T_DOCUMENTOGENERAL}" 
						itemValue="intIdDetalle"
						itemLabel="strDescripcion" 
						property="#{item.egreso.intParaDocumentoGeneral}"/>
		         	</h:panelGroup>
		         	<h:panelGroup rendered="#{not empty item.ingreso}">
		         	<tumih:outputText cache="#{applicationScope.Constante.PARAM_T_DOCUMENTOGENERAL}" 
						itemValue="intIdDetalle"
						itemLabel="strDescripcion" 
						property="#{item.ingreso.intParaDocumentoGeneral}"/>
		         	</h:panelGroup>
		   		</rich:column>
		  	</rich:dataTable>
		</rich:column>
		
		</h:panelGrid>
	</rich:panel>
	</h:panelGroup>	

</h:panelGroup>
</h:form>