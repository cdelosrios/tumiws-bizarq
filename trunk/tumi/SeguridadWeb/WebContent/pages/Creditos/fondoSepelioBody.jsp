<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
	<!-- Empresa   : Cooperativa Tumi         					-->
	<!-- Autor     : Christian De los R�os    					-->
	<!-- Modulo    : Cr�ditos                 					-->
	<!-- Prototipo : CONFIGURACI�N DE APORTES - FONDO DE SEPELIO-->			
	<!-- Fecha     : 14/02/2012               					-->

	<script language="JavaScript" src="/tumi/js/main.js"  type="text/javascript"></script>
	
	<script type="text/javascript">
		function jsSeleccionAportacion(itemIdEmpresa, itemIdTipoCaptacion, itemIdCodigo){
			document.getElementById("frmAportacionModalPanel:hiddenIdEmpresa").value=itemIdEmpresa;
			document.getElementById("frmAportacionModalPanel:hiddenIdTipoCaptacion").value=itemIdTipoCaptacion;
			document.getElementById("frmAportacionModalPanel:hiddenIdCodigo").value=itemIdCodigo;
		}
	</script>
	
	<rich:modalPanel id="panelUpdateDeleteFondoSepelio" width="400" height="155"
	 resizeable="false" style="background-color:#DEEBF5;">
        <f:facet name="header">
            <h:panelGrid>
              <rich:column style="border: none;">
                <h:outputText value="Actualizar/Eliminar Aportaci�n"/>
              </rich:column>
            </h:panelGrid>
        </f:facet>
        <f:facet name="controls">
            <h:panelGroup>
               <h:graphicImage value="/images/icons/remove_20.png" styleClass="hidelink" id="hidelinkAportacion"/>
               <rich:componentControl for="panelUpdateDeleteFondoSepelio" attachTo="hidelinkAportacion" operation="hide" event="onclick"/>
           </h:panelGroup>
        </f:facet>
        <h:form id="frmAportacionModalPanel">
        	<rich:panel style="border: 0px solid #17356f;background-color:#DEEBF5;width: 370px;">                 
                <h:panelGrid columns="2"  border="0" cellspacing="4" >
                    <h:outputText value="�Desea Ud. Actualizar o Eliminar una Aportaci�n?" style="padding-right: 35px;"/>
                </h:panelGrid>
                <rich:spacer height="16px"/>
                <h:panelGrid columns="2" border="0"  style="width: 200px;">
                    <h:commandButton value="Actualizar" actionListener="#{aportacionesController.modificarAportaciones}" styleClass="btnEstilos"/>
                    <h:commandButton value="Eliminar" actionListener="#{aportacionesController.eliminarAportacion}" onclick="if (!confirm('Est� Ud. Seguro de Eliminar este Registro?')) return false;" styleClass="btnEstilos"/>
                </h:panelGrid>
				<h:inputHidden id="hiddenIdEmpresa"/>
				<h:inputHidden id="hiddenIdTipoCaptacion"/>
				<h:inputHidden id="hiddenIdCodigo"/>
             </rich:panel>
             <rich:spacer height="4px"/><rich:spacer height="8px"/>
        </h:form>
    </rich:modalPanel>
	
    <h:form id="frmPrincipal">
       	<rich:panel id="pMarco1" style="border:1px solid #17356f ;width:930px; background-color:#DEEBF5">
       		<rich:panel style="border: 0px solid #17356f;background-color:#DEEBF5;" >
       			<h:panelGrid id="pgBusq1" columns="6" border="0">
       				<rich:column width="110">
                    	<h:outputText id="lblbusqTipoConv" value="Estado de Sepelio : "/>
                    </rich:column>
                    <rich:column>
                    	<h:selectOneMenu value="#{aportacionesController.intIdEstadoAportacion}">
					  		<f:selectItems value="#{parametersController.cboEstadoAportacion}"/>
						</h:selectOneMenu>
                    </rich:column>
                    <rich:column>
          				<h:outputText value="Nombre del Sepelio"/>
          			</rich:column>
                    <rich:column>
                    	<h:inputText value="#{aportacionesController.strNombreAporte}" size="60" disabled="#{aportacionesController.enabDisabNombAporte}"/>
                    </rich:column>
                    <rich:column>
                    	<h:selectBooleanCheckbox />
                    </rich:column>
                    <rich:column><h:outputText value="Todos"/></rich:column>
                </h:panelGrid>
                  
                <h:panelGrid id="pgBusq2" columns="9" border="0">
                  	<rich:column width="110">
                    	<h:outputText value="Condici�n : "/>
                    </rich:column>
                    <rich:column>
                    	<h:selectOneMenu value="#{aportacionesController.intIdCondicionAportacion}">
                    		<f:selectItems value="#{parametersController.cboCondicionSocio}"/>
                    	</h:selectOneMenu>
                    </rich:column>
                    <rich:column style="padding-left:15px;">
                    	<h:outputText value="Tipo Configuraci�n:"/>
                    </rich:column>
                    <rich:column style="padding-left:15px;">
                    	<h:selectOneMenu value="#{aportacionesController.intIdTipoConfig}">
                    		<f:selectItems value="#{parametersController.cboTipoCobroAport}"/>
                    	</h:selectOneMenu>
                    </rich:column>
                    <rich:column style="padding-left:15px;">
                    	<h:selectBooleanCheckbox value="#{aportacionesController.chkFechas}">
                    		<a4j:support event="onclick" actionListener="#{aportacionesController.enableDisableControls}" reRender="pgBusq2"/>
                    	</h:selectBooleanCheckbox> 
                    </rich:column>
                    <rich:column><h:outputText value="Fecha" /></rich:column>
                    <rich:column style="padding-left:15px;">
                    	<h:selectOneMenu disabled="#{aportacionesController.enabDisabFechasAport}">
                    		<f:selectItem itemLabel="Inicio" itemValue="1"/>
                    		<f:selectItem itemLabel="Fin" 	 itemValue="2"/>
                    	</h:selectOneMenu>
                    </rich:column>
                    <rich:column style="border:none; padding-left:10px;">
	          			<rich:calendar popup="true" enableManualInput="true"
	          			disabled="#{aportacionesController.enabDisabFechasAport}"
	                   	value="#{aportacionesController.daFecIni}"
	                    datePattern="dd/MM/yyyy" inputStyle="width:70px;"
	                    cellWidth="10px" cellHeight="20px"/>
	          		</rich:column>
                    <rich:column style="border:none; padding-left:10px;">
	          			<rich:calendar popup="true" enableManualInput="true"
	          			disabled="#{aportacionesController.enabDisabFechasAport}"
	                   	value="#{aportacionesController.daFecIni}"
	                    datePattern="dd/MM/yyyy" inputStyle="width:70px;"
	                    cellWidth="10px" cellHeight="20px"/>
	          		</rich:column>
                </h:panelGrid>
                
                <h:panelGrid columns="9">
                  	<rich:column width="110">
                  		<h:outputText value="Tipo de Persona :"/>
                  	</rich:column>
                  	<rich:column>
                  		<h:selectOneMenu value="#{aportacionesController.intIdTipoPersona}">
                  			<f:selectItems value="#{parametersController.cboTiposPersona}"/>
                  		</h:selectOneMenu>
                  	</rich:column>
                  	<rich:column style="padding-left:15px;">
                  		<h:selectBooleanCheckbox value="#{aportacionesController.chkLimEdad}"/>
                  	</rich:column>
                  	<rich:column>
                  		<h:outputText value="Limite de Edad"/>
                  	</rich:column>
                  	<rich:column style="padding-left:15px;">
                  		<h:selectBooleanCheckbox value="#{aportacionesController.chkAportVigentes}"/>
                  	</rich:column>
                  	<rich:column>
                  		<h:outputText value="Sepelios Vigentes"/>
                  	</rich:column>
                  	<rich:column style="padding-left:15px;">
                  		<h:selectBooleanCheckbox value="#{aportacionesController.chkAportCaduco}"/>
                  	</rich:column>
                  	<rich:column>
                  		<h:outputText value="Sepelios Caducos"/>
                  	</rich:column>
                  	<rich:column style="padding-left:100px;">
                  		<a4j:commandButton value="Buscar" actionListener="#{aportacionesController.listarAportaciones}" styleClass="btnEstilos" reRender="pgListFondoSepelio"/>
                  	</rich:column>
                </h:panelGrid>
                
                <h:panelGrid id="pgListFondoSepelio" border="0">
                  	<rich:extendedDataTable id="edtFondoSepelio" value="#{aportacionesController.beanListAportaciones}"
                  		onRowClick="jsSeleccionAportacion(#{item.intIdEmpresa}, #{item.intIdTipoCaptacion}, #{item.intIdCodigo});"
                  		rows="#{aportacionesController.rows}"
                      	enableContextMenu="false" var="item" rowKeyVar="rowKey" width="900px" height="170px">
                            <rich:column width="15">
                                <div align="center"><h:outputText value="#{rowKey+1}"></h:outputText></div>
                            </rich:column>
                            <rich:column width="130">
                                <f:facet name="header">
                                    <h:outputText value="Nombre de Sepelio"></h:outputText>
                                </f:facet>
                                <h:outputText value="#{item.strDescripcion}"></h:outputText>
                            </rich:column>
                            <rich:column>
                                <f:facet name="header">
                                    <h:outputText value="Fec. de Inicio"></h:outputText>
                                </f:facet>
                                <h:outputText value="#{item.daFecIni}"></h:outputText>
                            </rich:column>
                            <rich:column width="80px">
                                <f:facet name="header">
                                    <h:outputText value="Fec. de Fin"></h:outputText>
                                </f:facet>
                                <h:outputText value="#{item.daFecFin}"></h:outputText>
                            </rich:column>
                            <rich:column width="70px">
                                <f:facet name="header">
                                    <h:outputText value="Estado"></h:outputText>
                                </f:facet>
                                <h:outputText value="#{item.strEstSolicitud}"></h:outputText>
                            </rich:column>
                            <rich:column width="135px">
                                <f:facet name="header">
                                    <h:outputText value="Condici�n de Socio"></h:outputText>
                                </f:facet>
                                <h:outputText id="strCondSoc" value="#{item.strCondicionSocio}">
                                	<rich:toolTip for="strCondSoc" value="#{item.strCondicionSocio}" followMouse="true" 
                                  		styleClass="tooltip" showDelay="500"/>
                                </h:outputText>
                            </rich:column>
                            <rich:column width="150px">
                                <f:facet name="header">
                                    <h:outputText value="Tipo de Configuraci�n"></h:outputText>
                                </f:facet>
                                <h:outputText value="#{item.strTipoConfig}"></h:outputText>
                            </rich:column>
                            <rich:column width="115px">
                                <f:facet name="header">
                                    <h:outputText value="Modelo Contable"></h:outputText>
                                </f:facet>
                                <h:outputText value="xxxx"></h:outputText>
                            </rich:column>
                            <rich:column>
                                <f:facet name="header">
                                    <h:outputText value="Fecha de Reg." />
                                </f:facet>
                                <h:outputText value="#{item.strFecRegistro}"></h:outputText>
                            </rich:column>
                            
                            <f:facet name="footer">
                              <rich:datascroller for="edtFondoSepelio" maxPages="10"/>
                            </f:facet>
            		</rich:extendedDataTable>
           		</h:panelGrid>
            
	            <h:panelGrid columns="2">
					<h:outputLink value="#" id="linkFondoSepelio">
				        <h:graphicImage value="/images/icons/mensaje1.jpg"
							style="border:0px"/>
				        <rich:componentControl for="panelUpdateDeleteFondoSepelio" attachTo="linkFondoSepelio" operation="show" event="onclick"/>
					</h:outputLink>
					<h:outputText value="Para Anular o Modificar el FONDO DE SEPELIO hacer click en el Registro" style="color:#8ca0bd"/>                                     
			    </h:panelGrid>
		 	</rich:panel>
		 
	    	<h:panelGrid columns="3">
	    		<a4j:commandButton value="Nuevo" actionListener="#{aportacionesController.habilitarGrabarAportaciones}" styleClass="btnEstilos" reRender="pAportaciones"/>                     
	            <a4j:commandButton id="btnGuardarAportacion" value="Grabar" actionListener="#{aportacionesController.grabarAportaciones}" styleClass="btnEstilos" reRender="pAportaciones"/>												                 
	            <a4j:commandButton value="Cancelar" actionListener="#{aportacionesController.cancelarGrabarAportaciones}" styleClass="btnEstilos" reRender="pAportaciones"/>
	      	</h:panelGrid>
         
    	 <h:panelGrid id="pAportaciones">
	    	 <rich:panel style="width: 900px;border:1px solid #17356f;background-color:#DEEBF5;">
	    	 	<h:panelGrid columns="5">
	    	 		<rich:column width="140"><h:outputText value="Nombre del Sepelio" /></rich:column>
	    	 		<rich:column><h:outputText value=":"/></rich:column>
	    	 		<rich:column>
	     	 		<h:inputText value="#{aportacionesController.beanAportacion.strDescripcion}" size="80"/>
	              </rich:column>
	              <rich:column width="150px"><h:outputText value="Estado de la Solicitud :" style="padding-left:10px;"/></rich:column>
	              <rich:column width="100px" style="border:1px solid #17356f;background-color:#DEEBF5;">
	              	<div align="center"><h:outputText style="font-weight:bold;" value="#{aportacionesController.beanAportacion.strEstSolicitud}"/></div>
	              </rich:column>
	    	 	</h:panelGrid>
	    	 	<h:outputText value="#{aportacionesController.msgTxtDescripcion}" styleClass="msgError"/>
	    	 	
	    	 	<h:panelGrid id="pgRanFec" columns="5">
	    	 		<rich:column width="140"><h:outputText value="Fecha de Inicio"/></rich:column>
	    	 		<rich:column><h:outputText value=":"/></rich:column>
	    	 		<rich:column>
	    	 			<rich:calendar enableManualInput="true"
	              	value="#{aportacionesController.daFechaIni}"
	               datePattern="dd/MM/yyyy" inputStyle="width:70px;"
	               cellWidth="10px" cellHeight="20px"/>
	    	 		</rich:column>
	    	 		<rich:column>
	     	 		<h:selectOneRadio value="#{aportacionesController.rbFecIndeterm}">
	     	 			<f:selectItem itemLabel="Fecha de Fin" itemValue="1"/>
	     	 			<f:selectItem itemLabel="Indeterminado" itemValue="2"/>
	     	 			<a4j:support event="onclick" actionListener="#{aportacionesController.enableDisableControls}" reRender="pgRanFec"/>
	     	 		</h:selectOneRadio>
	              </rich:column>
	              <rich:column>
	    	 			<rich:calendar enableManualInput="true"
	    	 			rendered="#{aportacionesController.fecFinAportacionRendered}"
	              	value="#{aportacionesController.daFechaFin}"
	               datePattern="dd/MM/yyyy" inputStyle="width:70px;"
	               cellWidth="10px" cellHeight="20px"/>
	    	 		</rich:column>
	    	 	</h:panelGrid>
	    	 	<h:outputText value="#{aportacionesController.msgTxtFechaIni}" styleClass="msgError"/>
	    	 	
	    	 	<h:panelGrid columns="4">
	    	 		<rich:column width="140"><h:outputText value="Estado del Aporte"/></rich:column>
	    	 		<rich:column><h:outputText value=":"/></rich:column>
	    	 		<rich:column>
	    	 			<h:selectOneMenu value="#{aportacionesController.beanAportacion.intIdEstado}">
	    	 				<f:selectItems value="#{parametersController.cboEstados}"/>
	    	 			</h:selectOneMenu>
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:outputText value="#{aportacionesController.msgTxtEstadoAporte}" styleClass="msgError"/>
	    	 		</rich:column>
	    	 	</h:panelGrid>
	    	 	
	    	 	<h:panelGrid columns="6">
	    	 		<rich:column width="140"><h:outputText value="Tipo de Persona"/></rich:column>
	    	 		<rich:column><h:outputText value=":"/></rich:column>
	    	 		<rich:column>
	    	 			<h:selectOneMenu value="#{aportacionesController.beanAportacion.intIdTipoPersona}">
	    	 				<f:selectItems value="#{parametersController.cboTiposPersona}"/>
	    	 			</h:selectOneMenu>
	    	 		</rich:column>
	    	 		<rich:column><h:outputText value="Tipo de relaci�n: "/></rich:column>
	    	 		<rich:column>
	    	 			<h:selectOneMenu value="#{aportacionesController.beanAportacion.intIdTipoPersona}">
	    	 				<f:selectItem itemLabel="Todos los Tipos" itemValue="0"/>
	    	 				<f:selectItem itemLabel="Socio" 	itemValue="1"/>
	    	 				<f:selectItem itemLabel="Usuario" 	itemValue="2"/>
	    	 			</h:selectOneMenu>
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:outputText value="#{aportacionesController.msgTxtTipoPersona}" styleClass="msgError"/>
	    	 		</rich:column>
	    	 	</h:panelGrid>
	    	 	
	    	 	<h:panelGrid columns="4">
	    	 		<rich:column width="140"><h:outputText value="Condici�n de Socio"/></rich:column>
	    	 		<rich:column><h:outputText value=":"/></rich:column>
	    	 		<rich:column>
	    	 			<h:selectOneRadio value="#{aportacionesController.rbCondSocio}">
	    	 				<f:selectItem itemLabel="Todos"  itemValue="1"/>
	    	 				<f:selectItem itemLabel="Elegir" itemValue="2"/>
	    	 				<a4j:support event="onclick" actionListener="#{aportacionesController.listarCondSocio}" reRender="dtCondSocio"/>
	    	 			</h:selectOneRadio>
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:outputText value="#{aportacionesController.msgTxtCondSocio}" styleClass="msgError"/>
	    	 		</rich:column>
	    	 	</h:panelGrid>
	    	 	<h:panelGrid id="dtCondSocio">
	   	 			<rich:dataTable value="#{aportacionesController.beanListCondSocio}" rows="10"
		    			rendered="#{not empty aportacionesController.beanListCondSocio}"
		               var="item" rowKeyVar="rowKey" sortMode="single" width="500px">
			         <rich:column width="15px;">
			             <h:selectBooleanCheckbox value="#{item.chkSocio}"/>
			         </rich:column>
			         <rich:column width="500">
			         	<h:outputText value="#{item.strDescripcion}"/>
			         </rich:column>
		            </rich:dataTable>
	   	 		</h:panelGrid>
	    	 	
	    	 	<h:panelGrid columns="4">
	    	 		<rich:column width="140"><h:outputText value="Tipo de Descuento"/></rich:column>
	    	 		<rich:column><h:outputText value=":"/></rich:column>
	    	 		<rich:column>
	    	 			<h:selectOneMenu value="#{aportacionesController.beanAportacion.intIdTipoDcto}">
	    	 				<f:selectItems value="#{parametersController.cboTipoDscto}"/>
	    	 			</h:selectOneMenu>
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:outputText value="#{aportacionesController.msgTxtTipoDscto}" styleClass="msgError"/>
	    	 		</rich:column>
	    	 	</h:panelGrid>
	    	 	
	    	 	<h:panelGrid columns="4">
	    	 		<rich:column width="140"><h:outputText value="Tipo de Configuraci�n"/></rich:column>
	    	 		<rich:column><h:outputText value=":"/></rich:column>
	    	 		<rich:column>
	    	 			<h:selectOneMenu value="#{aportacionesController.beanAportacion.intIdTipoConfig}">
	    	 				<f:selectItems value="#{parametersController.cboTipoCobroAport}"/>
	    	 			</h:selectOneMenu>
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:outputText value="#{aportacionesController.msgTxtTipoConfig}" styleClass="msgError"/>
	    	 		</rich:column>
	    	 	</h:panelGrid>
	    	 	
	    	 	<h:panelGrid columns="7">
	    	 		<rich:column width="140"><h:outputText value="Valor de Aportaci�n"/></rich:column>
	    	 		<rich:column><h:outputText value=":"/></rich:column>
	    	 		<rich:column>
	    	 			<h:selectOneMenu value="#{aportacionesController.beanAportacion.intIdMoneda}">
	    	 				<f:selectItems value="#{parametersController.cboTipoMoneda}"/>
	    	 			</h:selectOneMenu>
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:selectOneRadio value="#{aportacionesController.strValAporte}">
	    	 				<f:selectItem itemLabel="Importe" itemValue="1"/>
	    	 				<f:selectItem itemLabel="%" itemValue="2"/>
	    	 			</h:selectOneRadio>
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:inputText value="#{aportacionesController.beanAportacion.flValorConfig}" onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" size="10"/>
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:selectOneMenu value="#{aportacionesController.beanAportacion.intIdAplicacion}">
	    	 				<f:selectItem itemLabel="RMV" itemValue="1"/>
	    	 			</h:selectOneMenu>
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:outputText value="#{aportacionesController.msgTxtMoneda}" styleClass="msgError"/>
	    	 		</rich:column>
	    	 	</h:panelGrid>
	    	 	
	    	 	<h:panelGrid id="pgLimiteEdad" columns="5">
	    	 		<rich:column>
	    	 			<h:selectBooleanCheckbox value="#{aportacionesController.chkLimiteEdad}">
	    	 				<a4j:support event="onclick" actionListener="#{aportacionesController.enableDisableControls}" reRender="pgLimiteEdad"/>
	    	 			</h:selectBooleanCheckbox>
	    	 		</rich:column>
	    	 		<rich:column width="115px">
	    	 			<h:outputText value="Limite de Edad"/>
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:outputText value=":"/>
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:inputText value="#{aportacionesController.beanAportacion.intEdadLimite}" onkeypress="return soloNumeros(event);" size="5" maxlength="2" disabled="#{aportacionesController.enabDisabLimiteEdad}"/>
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:outputText value="a�os"/>
	    	 		</rich:column>
	    	 	</h:panelGrid>
	    	 	
	    	 	<h:panelGrid columns="6">
	    	 		<rich:column width="140">
	    	 			<h:outputText value="Requisitos de Beneficio"/>
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:outputText value=":"/>
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:selectBooleanCheckbox />
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:outputText value="Tiempo de presentaci�n de sustento"/>
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:selectOneMenu>
	    	 				<f:selectItem itemLabel="1" itemValue="1"/>
	    	 				<f:selectItem itemLabel="2" itemValue="2"/>
	    	 				<f:selectItem itemLabel="3" itemValue="3"/>
	    	 				<f:selectItem itemLabel="4" itemValue="4"/>
	    	 			</h:selectOneMenu> a�o(s)
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:selectOneMenu>
	    	 				<f:selectItem itemLabel="m�ximo" itemValue="1"/>
	    	 				<f:selectItem itemLabel="m�nimo" itemValue="2"/>
	    	 			</h:selectOneMenu>
	    	 		</rich:column>
	    	 	</h:panelGrid>
	    	 	
	    	 	<h:panelGrid columns="2">
	    	 		<rich:column width="152"></rich:column>
	    	 		<rich:column>
	    	 			<h:selectBooleanCheckbox /> Escala
	    	 		</rich:column>
	    	 	</h:panelGrid>
	    	 	
	    	 	<h:panelGrid columns="2">
	    	 		<rich:column width="152"></rich:column>
	    	 		<rich:column style="border:1px solid #17356f;background-color:#DEEBF5;">
	    	 			<h:panelGrid columns="3" width="710px">
	    	 				<rich:column width="120px">
	    	 					<h:outputText value="Tipo de Beneficiario : "/>
	    	 				</rich:column>
	    	 				<rich:column>
	    	 					<h:selectOneMenu>
	    	 						<f:selectItems value="#{parametersController.cboTipoVinculo}"/>
	    	 					</h:selectOneMenu>
	    	 				</rich:column>
	    	 				<rich:column>
	    	 					<h:commandButton value="Agregar" styleClass="btnEstilos"/>
	    	 				</rich:column>
	    	 			</h:panelGrid>
	    	 		</rich:column>
	    	 	</h:panelGrid>
	    	 	
	    	 	<h:panelGrid columns="2">
	    	 		<rich:column width="152"></rich:column>
	    	 		<rich:column style="border:1px solid #17356f;background-color:#DEEBF5;border-top:none;">
	    	 			<h:panelGrid columns="10" width="710px">
	    	 				<rich:column width="120px">
	    	 					<h:outputText value="Cuotas Canceladas:"/>
	    	 				</rich:column>
	    	 				<rich:column>
	    	 					<h:selectOneMenu>
	    	 						<f:selectItem itemLabel="Mas de" itemValue="1"/>
	    	 						<f:selectItem itemLabel="Menos a" itemValue="2"/>
	    	 						<f:selectItem itemLabel="Igual a" itemValue="3"/>
	    	 					</h:selectOneMenu>
	    	 				</rich:column>
	    	 				<rich:column>
	    	 					<h:inputText size="9"/>
	    	 				</rich:column>
	    	 				<rich:column>
	    	 					<h:outputText value="Beneficio"/>
	    	 				</rich:column>
	    	 				<rich:column>
	    	 					<h:inputText size="10"/>
	    	 				</rich:column>
	    	 				<rich:column>
	    	 					<h:outputText value="Gasto Adm."/>
	    	 				</rich:column>
	    	 				<rich:column>
	    	 					<h:inputText size="6"/>
	    	 				</rich:column>
	    	 				<rich:column>
	    	 					<h:outputText value="%"/>
	    	 				</rich:column>
	    	 				<rich:column>
	    	 					<h:commandButton value="Agregar" styleClass="btnEstilos"/>
	    	 				</rich:column>
	    	 				<rich:column>
	    	 					<h:commandButton value="Eliminar" styleClass="btnEstilos"/>
	    	 				</rich:column>
	    	 			</h:panelGrid>
	    	 		</rich:column>
	    	 	</h:panelGrid>
	    	 	
	    	 	<h:panelGrid id="pgCeseBenef" columns="5">
	    	 		<rich:column>
	    	 			<h:selectBooleanCheckbox value="#{aportacionesController.chkLimiteEdad}">
	    	 				<a4j:support event="onclick" actionListener="#{aportacionesController.enableDisableControls}" reRender="pgLimiteEdad"/>
	    	 			</h:selectBooleanCheckbox>
	    	 		</rich:column>
	    	 		<rich:column width="115px">
	    	 			<h:outputText value="Cese del Beneficio"/>
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:outputText value=":"/>
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:outputText value="Meses de no descuento consecutivo"/>
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:inputText value="#{aportacionesController.beanAportacion.intEdadLimite}" onkeypress="return soloNumeros(event);" size="5" maxlength="2" disabled="#{aportacionesController.enabDisabLimiteEdad}"/>meses
	    	 		</rich:column>
	    	 	</h:panelGrid>
	    	 	
	    	 	<h:panelGrid id="pgModelosCont" columns="3">
	    	 		<rich:column width="140">
	    	 			<h:outputText value="Modelos Contables"/>
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:outputText value=":"/>
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:commandButton value="Solicitar" styleClass="btnEstilos"/>
	    	 		</rich:column>
	    	 	</h:panelGrid>
	    	 	
	    	 	<h:panelGrid columns="3">
	    	 		<rich:column width="152"/>
	    	 		<rich:column width="250">
	    	 			<h:selectBooleanCheckbox/> Provisi�n
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:commandButton value="Detalle" styleClass="btnEstilos"/>
	    	 		</rich:column>
	    	 	</h:panelGrid>
	    	 	
	    	 	<h:panelGrid columns="3">
	    	 		<rich:column width="152"/>
	    	 		<rich:column width="250">
	    	 			<h:selectBooleanCheckbox/> Extorno de Provisi�n
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:commandButton value="Detalle" styleClass="btnEstilos"/>
	    	 		</rich:column>
	    	 	</h:panelGrid>
	    	 	
	    	 	<h:panelGrid columns="3">
	    	 		<rich:column width="152"/>
	    	 		<rich:column width="250">
	    	 			<h:selectBooleanCheckbox/> Regularizaci�n de cuotas
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:commandButton value="Detalle" styleClass="btnEstilos"/>
	    	 		</rich:column>
	    	 	</h:panelGrid>
	    	 	
	    	 	<h:panelGrid columns="3">
	    	 		<rich:column width="152"/>
	    	 		<rich:column width="250">
	    	 			<h:selectBooleanCheckbox/> Cese del Beneficio
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:commandButton value="Detalle" styleClass="btnEstilos"/>
	    	 		</rich:column>
	    	 	</h:panelGrid>
	    	 	
	    	 	<h:panelGrid columns="3">
	    	 		<rich:column width="152"/>
	    	 		<rich:column width="250">
	    	 			<h:selectBooleanCheckbox/> Solicitud de Beneficio
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:commandButton value="Detalle" styleClass="btnEstilos"/>
	    	 		</rich:column>
	    	 	</h:panelGrid>
	    	 	
	    	 	<h:panelGrid columns="3">
	    	 		<rich:column width="152"/>
	    	 		<rich:column width="250">
	    	 			<h:selectBooleanCheckbox/> Aprobaci�n de Beneficio
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:commandButton value="Detalle" styleClass="btnEstilos"/>
	    	 		</rich:column>
	    	 	</h:panelGrid>
	    	 	
	    	 	<h:panelGrid columns="3">
	    	 		<rich:column width="152"/>
	    	 		<rich:column width="250">
	    	 			<h:selectBooleanCheckbox/> Anulaci�n o Rechazo del Beneficio
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:commandButton value="Detalle" styleClass="btnEstilos"/>
	    	 		</rich:column>
	    	 	</h:panelGrid>
	    	 	
	    	 	<h:panelGrid columns="3">
	    	 		<rich:column width="152"/>
	    	 		<rich:column width="250">
	    	 			<h:selectBooleanCheckbox/> Giro de Beneficio
	    	 		</rich:column>
	    	 		<rich:column>
	    	 			<h:commandButton value="Detalle" styleClass="btnEstilos"/>
	    	 		</rich:column>
	    	 	</h:panelGrid>
	    	 	
	    	 </rich:panel>
    	 </h:panelGrid>
	</rich:panel>
   </h:form>