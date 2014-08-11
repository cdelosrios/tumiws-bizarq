<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.tumi.com.pe/tumi-h" prefix="tumih"%>
	<!-- Empresa   : Cooperativa Tumi	-->
	<!-- Autor     : Arturo Julca   	-->
	<!-- Modulo    :                	-->
	<!-- Fecha     :                	-->




<h:form>
   	<rich:panel styleClass="rich-tabcell-noborder" style="border:1px solid #17356f;">
        	
        	<h:panelGrid style="margin:0 auto; margin-bottom:10px">
	    		<rich:columnGroup>
	    			<rich:column>
	    				<h:outputText value="REGISTRO DOCUMENTO SUNAT" style="font-weight:bold; font-size:14px"/>
	    			</rich:column>
	    		</rich:columnGroup>
    		</h:panelGrid>
        	
       		<h:panelGrid columns="11">
       			<rich:column width="70">
					<h:outputText value="Proveedor : "/>
				</rich:column>
				<rich:column width="100" style="text-align: left;">
					<h:selectOneMenu
						value="#{sunatController.personaFiltro.intEstadoCod}"
						style="width: 100px;">
						<f:selectItem itemValue="#{applicationScope.Constante.PARAM_T_OPCIONPERSONABUSQ_NOMBRE}" itemLabel="Nombre"/>
						<f:selectItem itemValue="#{applicationScope.Constante.PARAM_T_OPCIONPERSONABUSQ_RUC}" itemLabel="RUC"/>
						<f:selectItem itemValue="#{applicationScope.Constante.PARAM_T_OPCIONPERSONABUSQ_RAZONSOCIAL}" itemLabel="Raz�n Social"/>
					</h:selectOneMenu>
				</rich:column>
				<rich:column width="150" style="text-align: left;">
					<h:inputText size="22"
						value="#{sunatController.personaFiltro.strEtiqueta}"/>
				</rich:column>				
				<rich:column width="150" style="text-align: left;">
                	<h:selectOneMenu
						value="#{sunatController.documentoSunatFiltro.intTipoFiltroFecha}"
						style="width: 150px;">
						<f:selectItem itemValue="1" itemLabel="Fecha de Emisi�n"/>
						<f:selectItem itemValue="2" itemLabel="Fecha de Vencimiento"/>
						<f:selectItem itemValue="3" itemLabel="Fecha de Programaci�n"/>
					</h:selectOneMenu>
            	</rich:column>
            	<rich:column width="100" style="text-align: right;">
                	<rich:calendar datePattern="dd/MM/yyyy"  
						value="#{sunatController.dtDesdeFiltro}"  
						inputSize="10" 
						showApplyButton="true"/>
            	</rich:column>
            	<rich:column width="100" style="text-align: left;">
                	<rich:calendar datePattern="dd/MM/yyyy"  
						value="#{sunatController.dtHastaFiltro}"  
						inputSize="10" 
						showApplyButton="true"/>
            	</rich:column>
            	<rich:column width="80" style="text-align: left;">
					<h:outputText value="Estado Pago: "/>
				</rich:column>
				
				<%-- Modificado por cdelosrios, 08/10/2013
				<rich:column width="100">
					<h:selectOneMenu
						value="#{sunatController.documentoSunatFiltro.intParaEstadoPago}"
						style="width: 100px;">
						<f:selectItem itemValue="#{applicationScope.Constante.PARAM_T_ESTADOUNIVERSAL_ACTIVO}" itemLabel="Activo"/>
						<f:selectItem itemValue="#{applicationScope.Constante.PARAM_T_ESTADOUNIVERSAL_ANULADO}" itemLabel="Anulado"/>
					</h:selectOneMenu>
				</rich:column>
					Modificado por cdelosrios, 08/10/2013--%>
				<!-- Agregado por cdelosrios, 08/10/2013 -->
				<rich:column width="100">
					<h:selectOneMenu
						value="#{sunatController.documentoSunatFiltro.intParaEstadoPago}"
						style="width: 100px;">
						<tumih:selectItems var="sel"
							cache="#{applicationScope.Constante.PARAM_T_ESTADOPAGO}"
							itemValue="#{sel.intIdDetalle}"
							itemLabel="#{sel.strDescripcion}"
							propertySort="intOrden"
							tipoVista="#{applicationScope.Constante.CACHE_TOTAL}"/>
					</h:selectOneMenu>
				</rich:column>
				<!-- Fin agregado por cdelosrios, 08/10/2013 -->
            </h:panelGrid>
            
            <h:panelGrid columns="11">       			
				<rich:column width="70" style="text-align: left;">
					<h:outputText value="Estado : "/>
				</rich:column>
				<rich:column width="100">
					<h:selectOneMenu
						value="#{sunatController.documentoSunatFiltro.intParaEstado}"
						style="width: 100px;">
						<tumih:selectItems var="sel" 
							cache="#{applicationScope.Constante.PARAM_T_ESTADOUNIVERSAL}" 
							itemValue="#{sel.intIdDetalle}"
							itemLabel="#{sel.strDescripcion}"/>
					</h:selectOneMenu>
				</rich:column>
				
				<!-- Agregado por cdelosrios, 08/10/2013 -->
				<rich:column width="150" style="text-align: left;">
					<h:outputText value="Tipo de Comprobante : "/>
				</rich:column>
				<rich:column width="150">
					<h:selectOneMenu
						value="#{sunatController.documentoSunatFiltro.intParaTipoComprobante}"
						style="width: 150px;">
						<f:selectItem itemValue="0" itemLabel="Seleccione"/>
						<tumih:selectItems var="sel"
							value="#{sunatController.listaTipoComprobante}"
							itemValue="#{sel.intIdDetalle}"
							itemLabel="#{sel.strDescripcion}"
							propertySort="intOrden"/>
					</h:selectOneMenu>
				</rich:column>
				<rich:column width="160" style="text-align: left;">
					<h:outputText value="Nro. Documento Sunat : "/>
				</rich:column>
				<rich:column>
					<h:inputText value="#{sunatController.documentoSunatFiltro.id.intItemDocumentoSunat}" 
						size="10" onkeydown="return validarEnteros(event)"/>
				</rich:column>
				<rich:column width="80" style="text-align: left;">
					<h:outputText value="N�mero : "/>
				</rich:column>
				<rich:column>
					<h:inputText value="#{sunatController.documentoSunatFiltro.strNumeroDocumento}" 
						size="15" maxlength="20"/>
				</rich:column>
				<!-- Fin agregado por cdelosrios, 08/10/2013 -->
				
				<rich:column width="130" style="text-align: right;">
                	<a4j:commandButton styleClass="btnEstilos"
                		value="Buscar" 
                		reRender="panelTablaResultadosD,panelMensajeD"
                    	action="#{sunatController.buscar}" 
                    	style="width:130px"/>
            	</rich:column>
			</h:panelGrid>
				
            <rich:spacer height="12px"/>           
                
            <h:panelGrid id="panelTablaResultadosD">
	        	<rich:extendedDataTable id="tblResultadoD" 
	          		enableContextMenu="false" 
	          		sortMode="single" 
                    var="item" 
                    value="#{sunatController.listaDocumentoSunat}"  
					rowKeyVar="rowKey" 
					rows="5" 
					width="1030px" 
					height="160px" 
					align="center">
                    
                    <rich:column width="50" style="text-align: center">
                    	<f:facet name="header">
                        	<h:outputText value="Item"/>
                      	</f:facet>
                      	<h:outputText value="#{item.id.intItemDocumentoSunat}"/>
                    </rich:column>
                    <rich:column width="240" style="text-align: center">
                    	<f:facet name="header">
                      		<h:outputText value="Empresa Servicio"/>                      		
                      	</f:facet>
                      	<h:outputText 
							rendered="#{item.ordenCompra.personaProveedor.intTipoPersonaCod==applicationScope.Constante.PARAM_T_TIPOPERSONA_NATURAL}"
							value="DNI : #{item.ordenCompra.personaProveedor.documento.strNumeroIdentidad} - #{item.ordenCompra.personaProveedor.natural.strNombreCompleto}"
							title="DNI : #{item.ordenCompra.personaProveedor.documento.strNumeroIdentidad} - #{item.ordenCompra.personaProveedor.natural.strNombreCompleto}"
						/>
						<h:outputText
							rendered="#{item.ordenCompra.personaProveedor.intTipoPersonaCod==applicationScope.Constante.PARAM_T_TIPOPERSONA_JURIDICA}"
							value="RUC : #{item.ordenCompra.personaProveedor.strRuc} - #{item.ordenCompra.personaProveedor.juridica.strRazonSocial}"
							title="RUC : #{item.ordenCompra.personaProveedor.strRuc} - #{item.ordenCompra.personaProveedor.juridica.strRazonSocial}"
						/>
                  	</rich:column>
					<rich:column width="70" style="text-align: center">
			        	<f:facet name="header">
			           		<h:outputText value="Estado"/>
			         	</f:facet>
			         	<tumih:outputText cache="#{applicationScope.Constante.PARAM_T_ESTADOUNIVERSAL}"
							itemValue="intIdDetalle" 
							itemLabel="strDescripcion"
							property="#{item.intParaEstado}"/>
			   		</rich:column>
                  	<rich:column width="90" style="text-align: center">
			        	<f:facet name="header">
			           		<h:outputText value="Tipo"/>
			         	</f:facet>
			         	<tumih:outputText cache="#{applicationScope.Constante.PARAM_T_TIPOCOMPROBANTE}"
							itemValue="intIdDetalle" 
							itemLabel="strDescripcion"
							property="#{item.intParaTipoComprobante}"/>
			   		</rich:column>
			   		<rich:column width="120" style="text-align: center">
                    	<f:facet name="header">
                      		<h:outputText value="Fecha de Emision"/>
                      	</f:facet>
                      	<h:outputText value="#{item.dtFechaEmision}">
                      		<f:convertDateTime pattern="dd/MM/yyyy"/>
                      	</h:outputText>
                  	</rich:column>
                  	<rich:column width="100" style="text-align: center">
			        	<f:facet name="header">
			            	<h:outputText value="N�mero"/>
			          	</f:facet>
			          	<h:outputText value="#{item.strSerieDocumento}-#{item.strNumeroDocumento}"/>						
			    	</rich:column>
			    	<rich:column width="80" style="text-align: right">
                    	<f:facet name="header">
                      		<h:outputText value="Monto"/>                      		
                      	</f:facet>                      	
                      	<h:outputText value="#{item.detalleTotalGeneral.bdMontoTotal}">
	                    	<f:converter converterId="ConvertidorMontos"/>
	                 	</h:outputText>
                  	</rich:column>
                  	<rich:column width="80" style="text-align: center">
			        	<f:facet name="header">
			           		<h:outputText value="Moneda"/>
			         	</f:facet>
			         	<tumih:outputText cache="#{applicationScope.Constante.PARAM_T_TIPOMONEDA}"
							itemValue="intIdDetalle" 
							itemLabel="strDescripcion"
							property="#{item.intParaMoneda}"/>
			   		</rich:column>
                  	<rich:column width="100" style="text-align: center">
                    	<f:facet name="header">
                      		<h:outputText value="Estado Pago"/>
                      	</f:facet>
                      	<tumih:outputText cache="#{applicationScope.Constante.PARAM_T_ESTADOPAGO}"
							itemValue="intIdDetalle" 
							itemLabel="strDescripcion"
							property="#{item.intParaEstadoPago}"/>
                  	</rich:column>
                  	<rich:column width="100" style="text-align: center">
                    	<f:facet name="header">
                      		<h:outputText value="Programaci�n"/>
                      	</f:facet>
                      	<h:outputText value="#{item.dtFechaPago}">
                      		<f:convertDateTime pattern="dd/MM/yyyy"/>
                      	</h:outputText>
                  	</rich:column>
                  	
                  	<a4j:support event="onRowClick"
                   		actionListener="#{sunatController.seleccionarRegistro}"
                   		oncomplete="Richfaces.showModalPanel('pAlertaRegistroD')"
						reRender="pAlertaRegistroD">
                    	<f:attribute name="item" value="#{item}"/>
                   	</a4j:support>
                  	
                   	<f:facet name="footer">
						<rich:datascroller for="tblResultadoD" maxPages="10"/>   
					</f:facet>
					
                   	
            	</rich:extendedDataTable>
            	
         	</h:panelGrid>
	          	                 
			<h:panelGrid columns="2" style="margin-left: auto; margin-right: auto">
				<a4j:commandLink action="#">
					<h:graphicImage value="/images/icons/mensaje1.jpg" style="border:0px"/>
				</a4j:commandLink>
				<!-- Modificado por cdelosrios, 25/10/2013 -->
				<%-- <h:outputText value="Para Eliminar un Documento de SUNAT hacer click en el registro" style="color:#8ca0bd"/> --%>
				<h:outputText value="Para Modificar o Ver un Documento de SUNAT hacer click en el registro" style="color:#8ca0bd"/>
				<!-- Fin modificado por cdelosrios, 25/10/2013 -->
			</h:panelGrid>
				
		<h:panelGroup id="panelMensajeD" style="border: 0px solid #17356f;background-color:#DEEBF5;text-align: center"
			styleClass="rich-tabcell-noborder">
			<h:outputText value="#{sunatController.mensajeOperacion}" 
				styleClass="msgInfo"
				style="font-weight:bold"
				rendered="#{sunatController.mostrarMensajeExito}"/>
			<h:outputText value="#{sunatController.mensajeOperacion}" 
				styleClass="msgError"
				style="font-weight:bold"
				rendered="#{sunatController.mostrarMensajeError}"/>
		</h:panelGroup>
				 		
		<h:panelGroup style="border: 0px solid #17356f;background-color:#DEEBF5;" styleClass="rich-tabcell-noborder"
			id="panelBotonesD">
			<h:panelGrid columns="5">
				<a4j:commandButton value="Nuevo" styleClass="btnEstilos" style="width:90px" 
					action="#{sunatController.habilitarPanelInferior}" 
					reRender="contPanelInferiorD,panelMensajeD,panelBotonesD,pnDatosSunat" />
			    <!-- Modificado por cdelosrios, 01/11/2013 -->
			    <h:panelGroup rendered="#{sunatController.strSunat == applicationScope.Constante.MANTENIMIENTO_GRABAR}">
		         	<a4j:commandButton value="Grabar" styleClass="btnEstilos" style="width:90px"
				    	action="#{sunatController.grabar}"
				    	reRender="contPanelInferiorD,panelMensajeD,panelBotonesD,panelTablaResultadosD,pnDatosSunat"
				    	disabled="#{!sunatController.habilitarGrabar}"/>
		      	</h:panelGroup>
		      	<h:panelGroup rendered="#{sunatController.strSunat == applicationScope.Constante.MANTENIMIENTO_MODIFICAR}">
		         	<a4j:commandButton value="Grabar" styleClass="btnEstilos" style="width:90px"
				    	action="#{sunatController.modificar}"
				    	reRender="contPanelInferiorD,panelMensajeD,panelBotonesD,panelTablaResultadosD,pnDatosSunat"
				    	disabled="#{!sunatController.habilitarGrabar}"/>
		      	</h:panelGroup>
		      	<!-- Fin modificado por cdelosrios, 01/11/2013 -->
			    <a4j:commandButton value="Cancelar" styleClass="btnEstilos"style="width:90px"
			    	action="#{sunatController.deshabilitarPanelInferior}"
			    	reRender="contPanelInferiorD,panelMensajeD,panelBotonesD,pnDatosSunat"/>
			</h:panelGrid>
		</h:panelGroup>
		
		
		
	<h:panelGroup id="contPanelInferiorD">
	<rich:panel  rendered="#{sunatController.mostrarPanelInferior}"	style="border:1px solid #17356f;background-color:#DEEBF5;">
		
		<rich:spacer height="5px"/>
		
		<h:panelGroup rendered="#{empty sunatController.ordenCompra}">
			<h:panelGrid columns="8">
				<rich:column width=	"140">
					<h:outputText value="Documento Requisito : "/>
				</rich:column>
				<rich:column width="210">
					<h:inputText value="Orden Contable" style="width: 200px;background-color: #BFBFBF;font-weight:bold;"/>
				</rich:column>
				<rich:column width="170">
					<a4j:commandButton styleClass="btnEstilos"
	                	value="Buscar" 
	                	reRender="pBuscarOrdenCompra"
	                	oncomplete="Richfaces.showModalPanel('pBuscarOrdenCompra')"
	                    action="#{sunatController.abrirPopUpBuscarOrdenCompra}" 
	                    style="width:150px"/>
				</rich:column>
			</h:panelGrid>
		</h:panelGroup>		
		
		
		<rich:spacer height="3px"/>		
		
		
		<h:panelGroup rendered="#{not empty sunatController.ordenCompra}">		
		
		<!-- Agregado por cdelosrios, 27/10/2013 -->
		<%--
		<h:panelGrid columns="2" rendered="#{sunatController.documentoSunatNuevo.id.intItemDocumentoSunat!=null}">
			<rich:column width=	"120">
				<h:outputText value="Nro. Documento SUNAT :"/>
			</rich:column>
			<rich:column width="210">
				<h:inputText size="36"
					readonly="true"
					style="background-color: #BFBFBF;"
					value="#{sunatController.documentoSunatNuevo.id.intItemDocumentoSunat}"/>
			</rich:column>
		</h:panelGrid>--%>
		<!-- Fin agregado por cdelosrios, 27/10/2013 -->
		
		<h:panelGrid columns="16">
			<rich:column width=	"120">
				<h:outputText value="Documento Requisito : "/>
			</rich:column>
			<rich:column width="210">
				<h:inputText size="36"
					readonly="true"
					style="background-color: #BFBFBF;"
					value="Orden Contable"/>
			</rich:column>
			<rich:column width=	"500">
				<h:inputText size="105"
					readonly="true"
					value="#{sunatController.ordenCompra.strEtiqueta}"
					style="background-color: #BFBFBF;"/>
			</rich:column>			
		</h:panelGrid>
		
		<rich:spacer height="3px"/>
		
		<h:panelGrid columns="8">
			<rich:column width=	"120">
				<h:outputText value="Proveedor : "/>
			</rich:column>
			<rich:column width="497">
				<h:inputText 
					value="#{sunatController.ordenCompra.personaProveedor.strEtiqueta}"
					size="73"
					readonly="true"
					style="background-color: #BFBFBF;font-weight:bold;"/>				
			</rich:column>
		</h:panelGrid>
		
		<!-- Agregado por cdelosrios, 17/10/2013 -->
		<rich:spacer height="3px"/>
		<h:panelGrid columns="2">
			<rich:column width=	"120">
				<h:outputText value="Adelantos entregados : "/>
			</rich:column>
			<rich:column width="497">
				<h:inputText value="#{sunatController.bdMontoAdelantoEntregadoTotal}"
					size="10"
					readonly="true"
					style="background-color: #BFBFBF;font-weight:bold;">
				<f:converter converterId="ConvertidorMontos"/>
				</h:inputText>
			</rich:column>
		</h:panelGrid>
		<!-- Fin agregado por cdelosrios, 17/10/2013 -->
		
		<rich:spacer height="10px"/>
		<rich:separator lineType="double" width="990"/>
		<rich:spacer height="10px"/>
		
		<!-- Agregado por cdelosrios, 25/10/2013 -->
		<h:panelGroup id="pnDatosSunat" rendered="#{sunatController.mostrarPanelDatosSunat}">
			<h:panelGrid columns="9" id="panelTipoComprobante">			
				<rich:column width=	"120">
					<h:outputText value="Documento : "/>
				</rich:column>
				<rich:column width="210">
					<!-- Modificado por cdelosrios, 20/10/2013 -->
					<h:selectOneMenu
						disabled="#{(not empty sunatController.documentoSunatNuevo.id.intItemDocumentoSunat)}"
						style="width: 210px;"
						value="#{sunatController.documentoSunatNuevo.intParaTipoComprobante}">
						<tumih:selectItems var="sel"
							value="#{sunatController.listaTipoComprobante}"
							itemValue="#{sel.intIdDetalle}"
							itemLabel="#{sel.strDescripcion}"/>
						<%--
						<%--value="#{sunatController.listaTablaTipoComprobante}" 
						<a4j:support event="onchange"
							action="#{sunatController.seleccionarTipoComprobante}" 
							reRender="panelDocumentoD, panelTipoComprobante, panelModificadores"/> --%>
						<a4j:support event="onchange"
							action="#{sunatController.onChangeTipoDocumento}" 
							reRender="panelDocumentoD, chkIGV, chkPercepcion"/>
					</h:selectOneMenu>
					<!-- Fin modificado por cdelosrios, 20/10/2013 -->
				</rich:column>
				<rich:column width=	"120">
					<h:outputText value="Serie : "/>
				</rich:column>
				
				<!-- Modificado por cdelosrios, 14/11/2013 -->
				<rich:column width="170">
				<%--
					<h:inputText size="23" 
						rendered="#{sunatController.documentoSunatNuevo.intParaTipoComprobante!=applicationScope.Constante.PARAM_T_TIPOCOMPROBANTE_RECIBOHONORARIOS}"
						disabled="#{not empty sunatController.documentoSunatNuevo.id.intItemDocumentoSunat && !sunatController.modificarRegistro}"
						value="#{sunatController.documentoSunatNuevo.strSerieDocumento}"/>
					<h:inputText size="23" 
						rendered="#{sunatController.documentoSunatNuevo.intParaTipoComprobante==applicationScope.Constante.PARAM_T_TIPOCOMPROBANTE_RECIBOHONORARIOS}"
						disabled="true"
						value="#{sunatController.documentoSunatNuevo.strSerieDocumento}"/> --%>
				<h:inputText size="23"
						disabled="#{not empty sunatController.documentoSunatNuevo.id.intItemDocumentoSunat && !sunatController.modificarRegistro}"
						value="#{sunatController.documentoSunatNuevo.strSerieDocumento}"/>
				<!-- Modificado por cdelosrios, 14/11/2013 -->
				</rich:column>
				<rich:column width=	"120">
					<h:outputText value="N�mero : "/>
				</rich:column>
				<rich:column width="210">
					<h:inputText size="23" 
						disabled="#{not empty sunatController.documentoSunatNuevo.id.intItemDocumentoSunat && !sunatController.modificarRegistro}"
						value="#{sunatController.documentoSunatNuevo.strNumeroDocumento}"/>
				</rich:column>
				
			</h:panelGrid>
			
			<rich:spacer height="3px"/>
			
			<h:panelGrid columns="8">
				<rich:column width=	"120">
					<h:outputText value="Fecha Emisi�n : "/>
				</rich:column>
				<rich:column width="210">
					<rich:calendar datePattern="dd/MM/yyyy"  
						disabled="#{(not empty sunatController.documentoSunatNuevo.id.intItemDocumentoSunat)}"
						value="#{sunatController.documentoSunatNuevo.dtFechaEmision}"  
						jointPoint="top-right" 
						direction="right" 
						inputSize="32" 
						showApplyButton="true">
						<a4j:support event="ondateselected" 
							action="#{sunatController.calcularMontos}" 
							reRender="panelDocumentoD"/>
					</rich:calendar>
				</rich:column>
				<rich:column width=	"120">
					<h:outputText value="Fecha Vencimiento : "/>
				</rich:column>
				<rich:column width="170">
					<rich:calendar datePattern="dd/MM/yyyy"  
						disabled="#{not empty sunatController.documentoSunatNuevo.id.intItemDocumentoSunat && !sunatController.modificarRegistro}"
						value="#{sunatController.documentoSunatNuevo.dtFechaVencimiento}"  
						jointPoint="top-right" 
						direction="right" 
						inputSize="20" 
						showApplyButton="true"/>
				</rich:column>
				<rich:column width=	"120">
					<h:outputText value="Programaci�n Pago : "/>
				</rich:column>
				<rich:column width="210">
					<rich:calendar datePattern="dd/MM/yyyy"  
						disabled="#{not empty sunatController.documentoSunatNuevo.id.intItemDocumentoSunat && !sunatController.modificarRegistro}"
						value="#{sunatController.documentoSunatNuevo.dtFechaPago}"  
						jointPoint="top-right" 
						direction="right" 
						inputSize="20" 
						showApplyButton="true"/>
				</rich:column>			
			</h:panelGrid>
			
			<rich:spacer height="3px"/>
			
			<h:panelGrid columns="8" id="panelModificadores">
				<rich:column width=	"120">
					<h:outputText value="Fecha de Provisi�n : "/>
				</rich:column>
				<rich:column width="210">
					<h:inputText size="36"
						readonly="true"
						style="background-color: #BFBFBF;"					 
						value="#{sunatController.documentoSunatNuevo.tsFechaProvision}">
						<f:convertDateTime pattern="dd/MM/yyyy" />
		   			</h:inputText>
				</rich:column>
				<rich:column width=	"120">
					<h:selectBooleanCheckbox id="chkInafecto" value="#{sunatController.documentoSunatNuevo.seleccionaInafecto}"
						disabled="#{not empty sunatController.documentoSunatNuevo.id.intItemDocumentoSunat}">
						<a4j:support event="onclick"
							action="#{sunatController.calcularMontos}" 
							reRender="panelDocumentoD"/>
					</h:selectBooleanCheckbox>
					<h:outputText value="Inafecto"/>
				</rich:column>
				<rich:column width=	"120">
					<h:selectBooleanCheckbox id="chkIGV" value="#{sunatController.documentoSunatNuevo.seleccionaIGV}"
						disabled="#{not empty sunatController.documentoSunatNuevo.id.intItemDocumentoSunat
									|| (sunatController.documentoSunatNuevo.intParaTipoComprobante==applicationScope.Constante.PARAM_T_TIPOCOMPROBANTE_BOLETA)}">
					</h:selectBooleanCheckbox>
					<h:outputText value="IGV"/>
				</rich:column>
				<rich:column width=	"120">
					<h:selectBooleanCheckbox id="chkPercepcion" value="#{sunatController.documentoSunatNuevo.seleccionaPercepcion}"
						disabled="#{not empty sunatController.documentoSunatNuevo.id.intItemDocumentoSunat
									|| (sunatController.documentoSunatNuevo.intParaTipoComprobante==applicationScope.Constante.PARAM_T_TIPOCOMPROBANTE_FACTURA)}">
						<a4j:support event="onclick"
							action="#{sunatController.calcularMontos}" 
							reRender="panelDocumentoD"/>
					</h:selectBooleanCheckbox>
					<h:outputText value="Percepci�n"/>
				</rich:column>
			</h:panelGrid>
			
			<rich:spacer height="3px"/>
			
			<h:panelGrid columns="16">
				<rich:column width=	"120" style="vertical-align: top">
					<h:outputText value="Glosa : "/>
				</rich:column>
				<rich:column width="470">
					<h:inputTextarea cols="89" rows="2"
						disabled="#{not empty sunatController.documentoSunatNuevo.id.intItemDocumentoSunat && !sunatController.modificarRegistro}"
						value="#{sunatController.documentoSunatNuevo.strGlosa}"/>
				</rich:column>
			</h:panelGrid>
			
			<!-- Agregado por cdelosrios, 01/11/2013 -->
			<h:panelGrid columns="8" id="panelDocumentoSunat">
				<rich:column width=	"120">
					<h:outputText value="Documento : "/>
				</rich:column>
				<rich:column width="497">
					<h:inputText rendered="#{empty sunatController.documentoSunatNuevo.archivoDocumento}" 
						size="88"
						readonly="true" 
						style="background-color: #BFBFBF;"/>
					<h:inputText rendered="#{not empty sunatController.documentoSunatNuevo.archivoDocumento}"
						value="#{sunatController.documentoSunatNuevo.archivoDocumento.strNombrearchivo}"
						size="88"
						readonly="true" 
						style="background-color: #BFBFBF;"/>
				</rich:column>
				<rich:column width=	"170"
					rendered="#{empty sunatController.documentoSunatNuevo.id.intItemDocumentoSunat}">
					<a4j:commandButton styleClass="btnEstilos"
						value="Adjuntar Documento"
		                reRender="pAdjuntarDocumentoSunat"
		                oncomplete="Richfaces.showModalPanel('pAdjuntarDocumentoSunat')"
		                style="width:150px"/>
				</rich:column>
			</h:panelGrid>
			<!-- Fin agregado por cdelosrios, 01/11/2013 -->
		
			<rich:spacer height="15px"/>
		
			<h:panelGrid columns="8">
				<rich:column width=	"120">
					<h:outputText value="Detalle : "/>
				</rich:column>
				<rich:column width="210">
					<!-- Modificado por cdelosrios, 29/10/2013 -->
					<%--disabled="#{(not empty sunatController.documentoSunatNuevo.id.intItemDocumentoSunat)}" --%>
					<a4j:commandButton styleClass="btnEstilos"
	                	value="Agregar" 
	                	reRender="pAgregarDetalleSunat"
		                oncomplete="Richfaces.showModalPanel('pAgregarDetalleSunat')"
	                    action="#{sunatController.abrirPopUpAgregarDetalleSunat}" 
	                    style="width:200px"/>
	                <!-- Fin modificado por cdelosrios, 29/10/2013 -->
				</rich:column>
			</h:panelGrid>
		
			<h:panelGroup id="panelDocumentoD">
				<h:panelGrid columns="2">
					<rich:column width=	"910">
					<rich:dataTable
						sortMode="single"
						var="item"
						value="#{sunatController.documentoSunatNuevo.listaDocumentoSunatDetalle}"
						rowKeyVar="rowKey"
						width="955px"
						rows="#{fn:length(sunatController.documentoSunatNuevo.listaDocumentoSunatDetalle)}">
						
						<rich:column width="30" style="text-align: center">
							<f:facet name="header">
				           		<h:outputText value="Nro"/>
				         	</f:facet>
				         	<h:outputText value="#{rowKey + 1}"/>
						</rich:column>
						<rich:column width="70" style="text-align: right">
				        	<f:facet name="header">
				           		<h:outputText value="Cantidad"/>
				         	</f:facet>
				         	<h:outputText value="#{item.ordenCompraDetalle.bdCantidad}">
				         		<f:converter converterId="ConvertidorMontos"/>
				         	</h:outputText>
				   		</rich:column>
				        <rich:column width="80" style="text-align: center">
				        	<f:facet name="header">
				            	<h:outputText value="U.M."/>
				          	</f:facet>
				          	<tumih:outputText cache="#{applicationScope.Constante.PARAM_T_UNIDADMEDIDA}" 
								itemValue="intIdDetalle"
								itemLabel="strDescripcion"
								property="#{item.ordenCompraDetalle.intParaUnidadMedida}"/>
				    	</rich:column>
				    	<rich:column width="125" style="text-align: center">
				        	<f:facet name="header">
				            	<h:outputText value="Descripci�n"/>
				          	</f:facet>
				          	<h:outputText value="#{item.ordenCompraDetalle.strDescripcion}"/>
				    	</rich:column>
				    	<rich:column width="150" style="text-align: center">
				        	<f:facet name="header">
				            	<h:outputText value="Centro Costo"/>
				          	</f:facet>
				          	<h:outputText 
				          		value="#{item.ordenCompraDetalle.sucursal.juridica.strRazonSocial}-#{item.ordenCompraDetalle.area.strDescripcion}"/>
				    	</rich:column>
				    	<rich:column width="100" style="text-align: right">
				        	<f:facet name="header">
				            	<h:outputText value="P.U."/>
				          	</f:facet>
				          	<h:outputText value="#{item.ordenCompraDetalle.bdPrecioUnitario}">
				         		<f:converter converterId="ConvertidorMontos"/>
				         	</h:outputText>
				    	</rich:column>
				    	<rich:column width="100" style="text-align: center">
				        	<f:facet name="header">
				            	<h:outputText value="Moneda"/>
				          	</f:facet>
				          	<tumih:outputText cache="#{applicationScope.Constante.PARAM_T_TIPOMONEDA}" 
								itemValue="intIdDetalle" 
								itemLabel="strDescripcion" 
								property="#{item.intParaTipoMoneda}"/>
				    	</rich:column>
				    	<rich:column width="100" style="text-align: right">
				        	<f:facet name="header">
				            	<h:outputText value="Sin IGV"/>
				          	</f:facet>
				          	<h:outputText value="#{item.bdMontoSinIGV}">
				         		<f:converter converterId="ConvertidorMontos"/>
				         	</h:outputText>
				    	</rich:column>
				    	<rich:column width="100" style="text-align: right">
				        	<f:facet name="header">
				            	<h:outputText value="IGV"/>
				          	</f:facet>
				          	<h:outputText value="#{item.bdMontoIGV}">
				         		<f:converter converterId="ConvertidorMontos"/>
				         	</h:outputText>
				    	</rich:column>
				    	<rich:column width="100" style="text-align: right">
				        	<f:facet name="header">
				            	<h:outputText value="Final"/>
				          	</f:facet>
				          	<h:outputText value="#{item.bdMontoTotal}">
				         		<f:converter converterId="ConvertidorMontos"/>
				         	</h:outputText>
				    	</rich:column>
				  	</rich:dataTable>
				  	</rich:column>
				</h:panelGrid>
			
				<rich:spacer height="3px"/>
			
				<h:panelGrid columns="10">
					<rich:column width="100" style="text-align: right">
						<h:outputText style="padding-right:10px;" value="T.C :"/>
					</rich:column>
					<rich:column width="140" style="text-align: left">
						<h:inputText size="15"
							readonly="true"
							value="#{sunatController.tipoCambio.bdPromedio}"
							style="background-color: #BFBFBF;font-weight:bold;">
							<f:converter converterId="ConvertidorMontos"/>
						</h:inputText>
				    </rich:column>
				    <rich:column width="80" style="text-align: right">
						<h:outputText style="padding-right:10px;" value="Subtotal :"/>
					</rich:column>
					<rich:column width="140" style="text-align: left">
						<h:inputText size="15"
							readonly="true"
							style="background-color: #BFBFBF;font-weight:bold;"
							value="#{sunatController.documentoSunatNuevo.detalleSubTotal.bdMontoTotal}">
							<f:converter converterId="ConvertidorMontos"/>
						</h:inputText>
				    </rich:column>
				    <rich:column width="90" style="text-align: right">
						<h:outputText style="padding-right:10px;" value="Descuento :"/>
					</rich:column>
					<rich:column width="140" style="text-align: left">
						<h:inputText size="15"
							rendered="#{!sunatController.poseePermisoDescuento || (not empty sunatController.documentoSunatNuevo.id.intItemDocumentoSunat)}"
							readonly="true"
							style="background-color: #BFBFBF;font-weight:bold;"/>
						<h:inputText size="19"
							rendered="#{sunatController.poseePermisoDescuento && (empty sunatController.documentoSunatNuevo.id.intItemDocumentoSunat)}"
							value="#{sunatController.documentoSunatNuevo.detalleDescuento.bdMontoTotal}"
							onkeypress="return soloNumerosDecimalesPositivos(this)">
							<a4j:support event="onkeyup" 
								action="#{sunatController.calcularMontos}"
								ignoreDupResponses="true"
								requestDelay="500" 
								reRender="panelDocumentoD" 
								focus="input" />
						</h:inputText>
				    </rich:column>
				    <rich:column width="90" style="text-align: right">
						<h:outputText style="padding-right:10px;" value="Valor Venta :"/>
					</rich:column>
					<rich:column width="140" style="text-align: left">
						<h:inputText size="15"
							readonly="true"
							style="background-color: #BFBFBF;font-weight:bold;"
							value="#{sunatController.documentoSunatNuevo.detalleValorVenta.bdMontoTotal}">
							<f:converter converterId="ConvertidorMontos"/>
						</h:inputText>
				    </rich:column>
				</h:panelGrid>
			
				<h:panelGrid columns="10">
					<rich:column width="100" style="text-align: right">
						<h:outputText style="padding-right:10px;" value="IGV :"/>
					</rich:column>
					<rich:column width="140" style="text-align: left">
						<h:inputText size="15"
							readonly="true"
							style="background-color: #BFBFBF;font-weight:bold;"					
							value="#{sunatController.documentoSunatNuevo.detalleIGV.bdMontoTotal}">
							<f:converter converterId="ConvertidorMontos"/>
						</h:inputText>
				    </rich:column>
				    <rich:column width="80" style="text-align: right">
						<h:outputText style="padding-right:10px;" value="Otros :"/>
					</rich:column>
					<rich:column width="140" style="text-align: left">
						<h:inputText size="19"
							rendered="#{empty sunatController.documentoSunatNuevo.id.intItemDocumentoSunat}"
							value="#{sunatController.documentoSunatNuevo.detalleOtros.bdMontoTotal}"
							onkeypress="return soloNumerosDecimales(this)">
							<a4j:support event="onkeyup" 
								action="#{sunatController.calcularMontos}"
								ignoreDupResponses="true"
								requestDelay="500" 
								reRender="panelDocumentoD" 
								focus="input" />
						</h:inputText>
						<h:inputText size="15"
							rendered="#{not empty sunatController.documentoSunatNuevo.id.intItemDocumentoSunat}"
							readonly="true"
							style="background-color: #BFBFBF;font-weight:bold;"					
							value="#{sunatController.documentoSunatNuevo.detalleOtros.bdMontoTotal}">
							<f:converter converterId="ConvertidorMontos"/>
						</h:inputText>
				    </rich:column>
				    <rich:column width="90" style="text-align: right">
						<h:outputText style="padding-right:10px;" value="Total :"/>
					</rich:column>
					<rich:column width="140" style="text-align: left">
						<h:inputText size="15"
							readonly="true"
							style="background-color: #BFBFBF;font-weight:bold;"					
							value="#{sunatController.documentoSunatNuevo.detalleTotal.bdMontoTotal}">
							<f:converter converterId="ConvertidorMontos"/>
						</h:inputText>
				    </rich:column>
				    <rich:column width="90" style="text-align: right">
						<h:outputText value="Percepci�n 2% :"/>
					</rich:column>
					<rich:column width="140" style="text-align: left">
						<h:inputText size="15"
							readonly="true"
							style="background-color: #BFBFBF;font-weight:bold;"					
							value="#{sunatController.documentoSunatNuevo.detallePercepcion.bdMontoTotal}">
							<f:converter converterId="ConvertidorMontos"/>
						</h:inputText>
				    </rich:column>
				</h:panelGrid>
			
				<h:panelGrid columns="10">
					<rich:column width="100" style="text-align: right">
						<h:outputText style="padding-right:10px;" value="Detracci�n #{sunatController.ordenCompra.detraccion.bdPorcentaje}% :"/>
					</rich:column>
					<rich:column width="140" style="text-align: left">
						<h:inputText size="15"
							readonly="true"
							style="background-color: #BFBFBF;font-weight:bold;"					
							value="#{sunatController.documentoSunatNuevo.detalleDetraccion.bdMontoTotal}">
							<f:converter converterId="ConvertidorMontos"/>
						</h:inputText>
				    </rich:column>
				    <rich:column width="80" style="text-align: right">
						<h:outputText style="padding-right:10px;" value="Retenci�n :"/>
					</rich:column>
					<rich:column width="140" style="text-align: left">
						<h:inputText size="15"
							readonly="true"
							style="background-color: #BFBFBF;font-weight:bold;"					
							value="#{sunatController.documentoSunatNuevo.detalleRetencion.bdMontoTotal}">
							<f:converter converterId="ConvertidorMontos"/>
						</h:inputText>
				    </rich:column>
				    <rich:column width="90" style="text-align: right">
						<h:outputText style="padding-right:10px;" value="Total General:"/>
					</rich:column>
					<rich:column width="140" style="text-align: left">
						<h:inputText size="15"
							readonly="true"
							style="background-color: #BFBFBF;font-weight:bold;"					
							value="#{sunatController.documentoSunatNuevo.detalleTotalGeneral.bdMontoTotal}">
							<f:converter converterId="ConvertidorMontos"/>
						</h:inputText>
				    </rich:column>
				</h:panelGrid>
			
			</h:panelGroup>
		</h:panelGroup>
		<!-- Fin modificado por cdelosrios, 25/10/2013 -->
		
		<!-- Agregado por cdelosrios, 11/11/2013 -->
		<rich:spacer height="10px"/>
		<rich:separator lineType="double" width="990"/>
		<rich:spacer height="10px"/>
		<!-- Fin agregado por cdelosrios, 11/11/2013 -->
		
		<rich:spacer height="15px"/>
		<h:outputText value="#{sunatController.strMensajeAgregar}" 
			styleClass="msgError"
			style="font-weight:bold"
			rendered="#{not empty sunatController.strMensajeAgregar}"/>
		<rich:spacer height="5px"/>
		
		<h:panelGrid columns="1">
			<rich:column width="960">
				<!-- Agregado por cdelosrios, 29/10/2013 -->
				<%-- disabled="#{(not empty sunatController.documentoSunatNuevo.id.intItemDocumentoSunat)}"
		 			rendered="#{(empty sunatController.documentoSunatNuevo.id.intItemDocumentoSunat)}" --%>
				<a4j:commandButton styleClass="btnEstilos"
		 			value="Agregar Documento Sunat"
		            reRender="contPanelInferiorD"
		            rendered="#{sunatController.mostrarPanelDatosSunat}"
		            action="#{sunatController.agregarDocumentoSunat}" 
		            style="width:955px"/>
		        <!-- Agregado por cdelosrios, 29/10/2013 -->
			</rich:column>
		</h:panelGrid>
		
		<rich:spacer height="20px"/>
		
		<h:panelGroup id="panelFinalDocumento" 
			rendered="#{not empty sunatController.listaDocumentoSunatGrabar}">
		
		<h:panelGrid columns="1">
			<rich:column width="940">
				<h:outputText value="Documento SUNAT"/>
			</rich:column>
		</h:panelGrid>
		<h:panelGrid id="pgDtDocumentoSunat" columns="2">
			<rich:column width=	"910">
				<rich:dataTable id="dtDocumentoSunat"
					sortMode="single"
					var="item"
					value="#{sunatController.listaDocumentoSunatGrabar}"
					rowKeyVar="rowKey"
					width="955px"
					rendered="#{not empty sunatController.listaDocumentoSunatGrabar}"
					rows="#{fn:length(sunatController.listaDocumentoSunatGrabar)}">
					<f:facet name="header">
	                	<rich:columnGroup>
	                		<rich:column>
	                			<h:outputText value="Nro"/>
	                		</rich:column>
	                		<rich:column>
	                			<h:outputText value="Tipo"/>
	                		</rich:column>
	                		<rich:column>
	                			<h:outputText value="N�mero"/>
	                		</rich:column>
	                		<rich:column>
	                			<h:outputText value="Provisi�n"/>
	                		</rich:column>
	                		<rich:column>
	                			<h:outputText value="Emisi�n"/>
	                		</rich:column>
	                		<rich:column>
	                			<h:outputText value="Moneda"/>
	                		</rich:column>
	                		<rich:column>
	                			<h:outputText value="Subtotal"/>
	                		</rich:column>
	                		<rich:column>
	                			<h:outputText value="IGV"/>
	                		</rich:column>
	                		<rich:column>
	                			<h:outputText value="Total"/>
	                		</rich:column>
	                		<rich:column>
	                			<h:outputText value="Estado Pago"/>
	                		</rich:column>
	                		<rich:column>
	                			<h:outputText value="Estado"/>
	                		</rich:column>
	                		<rich:column>
	                			<rich:spacer />
	                		</rich:column>
	                		<rich:column>
	                			<rich:spacer />
	                		</rich:column>
	                		<rich:column>
	                			<rich:spacer />
	                		</rich:column>
	                	</rich:columnGroup>
		            </f:facet>
		            <rich:columnGroup rendered="#{item.intParaEstado!=applicationScope.Constante.PARAM_T_ESTADOUNIVERSAL_ANULADO}">
		            	<rich:column width="30" style="text-align: center">
							<h:outputText value="#{item.id.intItemDocumentoSunat}"/>
						</rich:column>
						<rich:column width="185" style="text-align: left">
				        	<tumih:outputText cache="#{applicationScope.Constante.PARAM_T_TIPOCOMPROBANTE}"
								itemValue="intIdDetalle" 
								itemLabel="strDescripcion"
								property="#{item.intParaTipoComprobante}"/>
				   		</rich:column>
				        <rich:column width="100" style="text-align: center">
				        	<h:outputText value="#{item.strSerieDocumento}-#{item.strNumeroDocumento}"/>						
				    	</rich:column>
				    	<rich:column width="100" style="text-align: center">
				        	<h:outputText value="#{item.tsFechaProvision}">
				          		<f:convertDateTime pattern="dd/MM/yyyy"/>
				          	</h:outputText>
				    	</rich:column>
				    	<rich:column width="100" style="text-align: center">
				        	<h:outputText value="#{item.dtFechaEmision}">
				          		<f:convertDateTime pattern="dd/MM/yyyy"/>
				          	</h:outputText>
				    	</rich:column>
				    	<rich:column width="70" style="text-align: center">
				        	<tumih:outputText cache="#{applicationScope.Constante.PARAM_T_TIPOMONEDA}"
								itemValue="intIdDetalle" 
								itemLabel="strDescripcion"
								property="#{item.intParaMoneda}"/>
				    	</rich:column>
				    	<rich:column width="100" style="text-align: right">
				        	<h:outputText value="#{item.detalleSubTotal.bdMontoTotal}">
				          		<f:converter converterId="ConvertidorMontos"/>
				          	</h:outputText>
				    	</rich:column>
				    	<rich:column width="100" style="text-align: right">
				        	<h:outputText value="#{item.detalleIGV.bdMontoTotal}">
				          		<f:converter converterId="ConvertidorMontos"/>
				          	</h:outputText>
				    	</rich:column>
				    	<rich:column width="100" style="text-align: right">
				        	<h:outputText value="#{item.detalleTotalGeneral.bdMontoTotal}">
				          		<f:converter converterId="ConvertidorMontos"/>
				          	</h:outputText>
				    	</rich:column>
				    	<rich:column width="100" style="text-align: center">
				        	<tumih:outputText cache="#{applicationScope.Constante.PARAM_T_ESTADOPAGO}"
								itemValue="intIdDetalle"
								itemLabel="strDescripcion"
								property="#{item.intParaEstadoPago}"/>
				   		</rich:column>
				   		<!-- Agregado por cdelosrios, 04/11/2013 -->
				   		<rich:column width="100" style="text-align: center">
			         		<tumih:outputText cache="#{applicationScope.Constante.PARAM_T_ESTADOUNIVERSAL}"
								itemValue="intIdDetalle"
								itemLabel="strDescripcion"
								property="#{item.intParaEstado}"/>
				   		</rich:column>
				   		<!-- Fin agregado por cdelosrios, 04/11/2013 -->
				   		<rich:column>
				   			<a4j:commandLink id="idLnkVerRegistroSunat" value="Ver"
								reRender="pVerDocumentoSunat"
								disabled="#{item.intParaEstadoPago==applicationScope.Constante.PARAM_T_ESTADOPAGO_CANCELADO}"
								actionListener="#{sunatController.verDocumentoSunat}"
								ajaxSingle="true" process="idLnkVerRegistroSunat"
								oncomplete="Richfaces.showModalPanel('pVerDocumentoSunat')">
								<f:attribute name="item" value="#{item}"/>
							</a4j:commandLink>
				   		</rich:column>
				   		<rich:column>
				   			<a4j:commandLink value="Eliminar"
								disabled="#{sunatController.habilitarVerRegistro}"
								action="#{sunatController.eliminarDocumentoSunat}"
								reRender="dtDocumentoSunat,pAgregarDetalleSunat,fAgregarDetalleSunat" >
								<f:param name="rowKeyDocSunat" value="#{rowKey}"/>
							</a4j:commandLink>
				   		</rich:column>
				   		<rich:column>
				   			<h:commandLink value="Imprimir"
								rendered="#{not empty item.id.intItemDocumentoSunat}"
								action="#{sunatController.imprimirDocumentoSunat}">
							</h:commandLink>
				   		</rich:column>
		            </rich:columnGroup>
			  	</rich:dataTable>
		  	</rich:column>
		</h:panelGrid>
		
		<rich:spacer height="30px"/>
		
		<h:panelGrid columns="1">
			<rich:column width="940">
				<h:outputText value="Documento Adelantos"/>
			</rich:column>
		</h:panelGrid>
		<h:panelGrid columns="2">
			<rich:column width=	"910">
				<rich:dataTable id="dtDocumentoAdelanto"
					sortMode="single"
					var="item"
					value="#{sunatController.ordenCompra.listaOrdenCompraDocumento}"
					rowKeyVar="rowKey"
					width="955px"
					rows="#{fn:length(sunatController.ordenCompra.listaOrdenCompraDocumento)}">
					
					<rich:column width="60" style="text-align: center;">
						<f:facet name="header">
	                    	<h:outputText value="Item"/>
	                 	</f:facet>
			        	<h:outputText value="#{item.id.intItemOrdenCompraDocumento}"/>
			      	</rich:column>
					<rich:column width="130" style="text-align: center">
                    	<f:facet name="header">
                        	<h:outputText value="Documento"/>
                      	</f:facet>
                      	<tumih:outputText cache="#{applicationScope.Constante.PARAM_T_DOCUMENTOGENERAL}" 
							itemValue="intIdDetalle"
							itemLabel="strDescripcion"
							property="#{item.intParaDocumentoGeneral}"/>
                    </rich:column>
					<rich:column width="100" style="text-align: center">
                    	<f:facet name="header">
                        	<h:outputText value="Fecha"/>
                      	</f:facet>
                      	<h:outputText value="#{item.tsFechaDocumento}">
                      		<f:convertDateTime pattern="dd/MM/yyyy" />
                      	</h:outputText>
                    </rich:column>
	                <rich:column width="90" style="text-align: center">
                    	<f:facet name="header">
                        	<h:outputText value="Monto"/>
                      	</f:facet>
                      	<h:outputText value="#{item.bdMontoDocumento}">
	                    	<f:converter converterId="ConvertidorMontos"/>
	                 	</h:outputText>
                    </rich:column>
                    <rich:column width="85" style="text-align: center">
                    	<f:facet name="header">
                      		<h:outputText value="Moneda"/>                      		
                      	</f:facet>
                      	<tumih:outputText cache="#{applicationScope.Constante.PARAM_T_TIPOMONEDA}" 
							itemValue="intIdDetalle" 
							itemLabel="strDescripcion" 
							property="#{item.intParaTipoMoneda}"/>   
                  	</rich:column>
	                <rich:column width="150" style="text-align: center">
                    	<f:facet name="header">
                        	<h:outputText value="Centro Costo"/>
                      	</f:facet>
                      	<h:outputText value="#{item.sucursal.juridica.strRazonSocial}-#{item.area.strDescripcion}"/>
                    </rich:column>
	                <rich:column width="90" style="text-align: right">
                    	<f:facet name="header">
                        	<h:outputText value="Pagado"/>
                      	</f:facet>
                      	<h:outputText value="#{item.bdMontoPagado}">
	                    	<f:converter converterId="ConvertidorMontos"/>
	                 	</h:outputText>
                    </rich:column>
                    <rich:column width="90" style="text-align: right">
                    	<f:facet name="header">
                        	<h:outputText value="Saldo"/>
                      	</f:facet>
                      	<h:outputText value="#{item.bdMontoPagado - item.bdMontoIngresado}">
	                    	<f:converter converterId="ConvertidorMontos"/>
	                 	</h:outputText>
                    </rich:column>
                    <rich:column width="90" style="text-align: right">
                    	<f:facet name="header">
                        	<h:outputText value="Aplicado"/>
                      	</f:facet>
                      	<h:inputText size="10"
                      		disabled="#{!item.checked}"
                      		onkeypress="return soloNumerosDecimales(this)" 
                      		value="#{item.bdMontoUsarTotal}"/>
                    </rich:column>
                    <rich:column>
			   			<a4j:commandLink id="idLnkVerDocAdelantos" value="Ver"
							reRender="pVerDocumentoAdelanto"
							
							actionListener="#{sunatController.verDocumentoAdelanto}"
							ajaxSingle="true" process="idLnkVerDocAdelantos"
							oncomplete="Richfaces.showModalPanel('pVerDocumentoAdelanto')">
							<f:attribute name="item" value="#{item}"/>
						</a4j:commandLink>
			   		</rich:column>
			   		<rich:column>
			   			<a4j:commandLink value="Eliminar"
							disabled="#{sunatController.habilitarVerRegistro}"
							action="#{sunatController.eliminarDocumentoAdelanto}"
							reRender="dtDocumentoAdelanto" >
							<f:param name="rowKeyDocSunat" value="#{rowKey}"/>
						</a4j:commandLink>
			   		</rich:column>
				</rich:dataTable>
			</rich:column>
		</h:panelGrid>	
		</h:panelGroup>
		
		<h:panelGroup id="panelLetrasDocumento"	rendered="#{sunatController.agregarLetras}">
		
		<h:panelGrid columns="8">
			<rich:column width=	"120">
				<h:outputText value="Letras : "/>
			</rich:column>
			<rich:column width="150">
				<a4j:commandButton styleClass="btnEstilos"
	               	disabled="#{sunatController.deshabilitarNuevo}"
	               	value="Agregar" 
	               	reRender="pAgregarLetraSunat"
		            oncomplete="Richfaces.showModalPanel('pAgregarLetraSunat')"
	                action="#{sunatController.abrirPopUpAgregarLetra}" 
	                style="width:120px"/>
			</rich:column>
		</h:panelGrid>
		
		<h:panelGrid columns="2">
			<rich:column width=	"910">
				<rich:dataTable
					sortMode="single"
					var="item"
					value="#{sunatController.listaDocumentoSunatLetra}"
					rowKeyVar="rowKey"
					width="955px"
					rows="#{fn:length(sunatController.listaDocumentoSunatLetra)}">
					
					<rich:column width="30" style="text-align: center">
						<f:facet name="header">
			           		<h:outputText value="Nro"/>
			         	</f:facet>
			         	<h:outputText value="#{rowKey + 1}"/>
					</rich:column>
					<rich:column width="100" style="text-align: center">
			        	<f:facet name="header">
			           		<h:outputText value="Tipo"/>
			         	</f:facet>
			         	<tumih:outputText cache="#{applicationScope.Constante.PARAM_T_TIPOCOMPROBANTE}"
							itemValue="intIdDetalle" 
							itemLabel="strDescripcion"
							property="#{item.intParaTipoComprobante}"/>
			   		</rich:column>
			        <rich:column width="110" style="text-align: center">
			        	<f:facet name="header">
			            	<h:outputText value="Fecha"/>
			          	</f:facet>
			          	<h:outputText value="#{item.dtFechaEmision}">
			          		<f:convertDateTime pattern="dd/MM/yyyy"/>
			          	</h:outputText>
			    	</rich:column>
			    	<rich:column width="100" style="text-align: right">
			        	<f:facet name="header">
			            	<h:outputText value="Monto"/>
			          	</f:facet>
			          	<h:outputText value="#{item.detalleLetra.bdMontoTotal}">
			         		<f:converter converterId="ConvertidorMontos"/>
			         	</h:outputText>
			    	</rich:column>
			    	<rich:column width="100" style="text-align: center">
			        	<f:facet name="header">
			            	<h:outputText value="Moneda"/>
			          	</f:facet>
			          	<tumih:outputText cache="#{applicationScope.Constante.PARAM_T_TIPOMONEDA}"
							itemValue="intIdDetalle" 
							itemLabel="strDescripcion"
							property="#{item.intParaMoneda}"/>
			    	</rich:column>
			    	<rich:column width="150" style="text-align: center">
			        	<f:facet name="header">
			            	<h:outputText value="Centro Costo"/>
			          	</f:facet>
			          	<h:outputText 
			          		value="#{item.detalleLetra.ordenCompraDetalle.sucursal.juridica.strRazonSocial}-#{item.detalleLetra.ordenCompraDetalle.area.strDescripcion}"/>
		    		</rich:column>			    	
			  	</rich:dataTable>
		  	</rich:column>
		</h:panelGrid>
					
		</h:panelGroup>
		
		
		</h:panelGroup>
		
	</rich:panel>
	
	</h:panelGroup>	

</rich:panel>
</h:form>