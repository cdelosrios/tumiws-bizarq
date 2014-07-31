<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://www.tumi.com.pe/tumi-h" prefix="tumih"%>
	<!-- Empresa   : Cooperativa Tumi         		-->
	<!-- Autor     : Christian De los R�os 			-->
	<!-- Modulo    : Cr�ditos                 		-->
	<!-- Prototipo : PROTOTIPO GARANTES SOLIDARIOS  -->
	<!-- Fecha     : 13/08/2012               		-->

	<script language="JavaScript" src="/js/main.js"  type="text/javascript">
		
	</script>
	
	<rich:panel style="border: 0px solid #17356f;background-color:#DEEBF5;width: 860px;">
		<h:panelGrid columns="3">
   			<rich:column>
				<a4j:commandButton value="Grabar" actionListener="#{solicitudRefinanController.grabarGarante}" reRender="pgListGarantesSolidarios, pgSolicitudRefinan,frmGaranteSolidario,pgMsgError,cgGarantes"
					oncomplete="if(#{solicitudRefinanController.validGaranteSolidario}){Richfaces.hideModalPanel('mpGarantesSolidariosRef')}" styleClass="btnEstilos"/>
   			</rich:column>
   			<rich:column>
   				<a4j:commandButton value="Cancelar" actionListener="#{solicitudRefinanController.cancelarGarante}" reRender="pgListGarantesSolidarios, pgSolicitudRefinan" styleClass="btnEstilos"
   				oncomplete="{Richfaces.hideModalPanel('mpGarantesSolidariosRef')}"/>
   			</rich:column>
   		</h:panelGrid>
   		
   		<h:panelGrid id="pgGaranteSolidarioRef">
   			<rich:panel style="width: 880px;border:1px solid #17356f;background-color:#DEEBF5;">
   				<h:panelGroup rendered="#{solicitudRefinanController.blnValidaDatosGarante}" layout="block">
   					<h:panelGrid columns="2">
   						<rich:column width="90px">
	        				<h:outputText value="DNI: "/>
	        			</rich:column>
	        			<rich:column>
	        				<h:inputText size="11" value="#{solicitudRefinanController.strNroDocumento}" onkeydown="return validarEnteros(event);" maxlength="8"/>
	        			</rich:column>
   					</h:panelGrid>
   					
   					<h:panelGrid style="width: 100%">
	        			<a4j:commandButton id="btnValidar" value="Validar Datos" styleClass="btnEstilos1" style="width:100%" 
	        				actionListener="#{solicitudRefinanController.validarGarante}" reRender="pgGaranteSolidarioRef,pgMsgError"/>
	        		</h:panelGrid>
   				</h:panelGroup>
   				<rich:panel rendered="#{solicitudRefinanController.blnDatosGarante}" style="width: 860px;border:1px solid #17356f;background-color:#DEEBF5;">
   					<h:panelGrid>
		         		<h:outputText value="DATOS PERSONALES" style="font-weight:bold;text-decoration:underline;"/>
		         	</h:panelGrid>
		         	
		         	<h:panelGrid columns="6">
		         		<rich:column >
		         			<h:outputText value="Ap. Paterno:"/>
		         		</rich:column>
		         		<rich:column>
		         			<h:inputText value="#{solicitudRefinanController.beanSocioCompGarante.persona.natural.strApellidoPaterno}" size="30" disabled="true"/>
		         		</rich:column>
		         		<rich:column>
		         			<h:outputText value="Ap. Materno: "/>
		         		</rich:column>
		         		<rich:column>
		         			<h:inputText value="#{solicitudRefinanController.beanSocioCompGarante.persona.natural.strApellidoMaterno}" size="30" disabled="true"/>
		         		</rich:column>
		         		<rich:column>
		         			<h:outputText value="Nombres: "/>
		         		</rich:column>
		         		<rich:column>
		         			<h:inputText value="#{solicitudRefinanController.beanSocioCompGarante.persona.natural.strNombres}" size="40" disabled="true"/>
		         		</rich:column>
			         </h:panelGrid>
			         
			         <h:panelGrid columns="3">
		          		 <rich:column  width="110px;">
		          		 	<h:outputText value="Fec. de Nacimiento"/>
		          		 </rich:column>
		          		 <rich:column >
		          			<h:outputText value=":"/>
		          		 </rich:column>
		          		 <rich:column style="padding-left:10px;">
		          			<rich:calendar popup="true" enableManualInput="true" disabled="true"
		          			value="#{solicitudRefinanController.beanSocioCompGarante.persona.natural.dtFechaNacimiento}"
		                    datePattern="dd/MM/yyyy" inputStyle="width:70px;"
		                    cellWidth="10px" cellHeight="20px"/>
		          		 </rich:column>
		          	 </h:panelGrid>

	          		<!-- 
	          		 <h:panelGrid columns="3">
	          		 	<rich:column width="110px;">
		          			<h:outputText value="Sexo"/>
		          		</rich:column>
		          		<rich:column>
		          			<h:outputText value=":"/>
		          		</rich:column>
		          		<rich:column style="padding-left:10px;">
		          			<h:selectOneRadio value="#{solicitudRefinanController.beanSocioCompGarante.persona.natural.intSexoCod}" disabled="true">
		          				<tumih:selectItems var="sel" cache="#{applicationScope.Constante.PARAM_T_TIPOSEXO}" 
			                     itemValue="#{sel.intIdDetalle}" itemLabel="#{sel.strDescripcion}" 
			                     propertySort="intOrden"/>
		          			</h:selectOneRadio>
		          		</rich:column>
		          	 </h:panelGrid>
		          	 	
	          		 <h:panelGrid columns="3">
		          		<rich:column width="110px;">
		          			<h:outputText value="Estado Civil"/>
		          		</rich:column>
		          		<rich:column>
		          			<h:outputText value=":"/>
		          		</rich:column>
		          		<rich:column style="padding-left:10px;">
		          			<h:selectOneMenu value="#{solicitudRefinanController.beanSocioCompGarante.persona.natural.intEstadoCivilCod}" disabled="true">
		          				<f:selectItem itemLabel="Seleccione.." itemValue="0"/>
		          				<tumih:selectItems var="sel" cache="#{applicationScope.Constante.PARAM_T_ESTADOCIVIL}" 
									itemValue="#{sel.intIdDetalle}" itemLabel="#{sel.strDescripcion}"/>
		          			</h:selectOneMenu>
		          		</rich:column>
	          		 </h:panelGrid>
	          		 -->
	          		 <h:panelGrid columns="3">
	          		 	<rich:column width="110px;">
		          			<h:outputText value="Sucursal"/>
		          		</rich:column>
		          		<rich:column>
		          			<h:outputText value=":"/>
		          		</rich:column>
		          		<tumih:inputText value="#{solicitudRefinanController.listSucursal}" 
											itemValue="id.intIdSucursal" itemLabel="juridica.strRazonSocial" size="50" disabled="true"
											property="#{solicitudRefinanController.beanSocioCompGarante.socio.socioEstructura.intIdSucursalAdministra}"/>		          	 
					<!--
	          		 	<rich:column width="110px;">
		          			<h:outputText value="Unidad Ejecutora"/>
		          		</rich:column>
		          		<rich:column>
		          			<h:outputText value=":"/>
		          		</rich:column>
		          		<tumih:inputText size="40" disabled="true"
                                             itemValue="intIdSubsucurAdministra" itemLabel="strEntidad" 
                                             property="#{solicitudRefinanController.beanSocioCompGarante.socio.socioEstructura.intIdSubsucurAdministra}"/>
		          	 -->
		          	 </h:panelGrid>  
		          	 
		          	 
		          	 <h:panelGrid columns="3">
		          	 	<rich:column width="110px;">
		          			<h:outputText value="Tipo Trabajador"/>
		          		</rich:column>
		          		<rich:column>
		          			<h:outputText value=":"/>
		          		</rich:column>
		          		<tumih:inputText cache="#{applicationScope.Constante.PARAM_T_CONDICIONLABORAL}" size="50" disabled="true"
                                             itemValue="intIdDetalle" itemLabel="strDescripcion" 
                                             property="#{solicitudRefinanController.beanSocioCompGarante.persona.natural.perLaboral.intCondicionLaboral}"/>
		          	 </h:panelGrid>                      
                          <!--   beanSocioCompGarante.getPersona().getJuridica().getStrRazonSocial()    -->               
   				</rich:panel>
   			</rich:panel>
   		</h:panelGrid>
   		
   		<h:panelGrid id="pgMsgError">
   			<h:outputText value="#{solicitudRefinanController.msgTxtPersonaNoExiste}" styleClass="msgError"/>
   			<h:outputText value="#{solicitudRefinanController.msgTxtRolSocio}" styleClass="msgError"/>
   			<h:outputText value="#{solicitudRefinanController.msgTxtTipoGarantiaPersonal}" styleClass="msgError"/>
   			<h:outputText value="#{solicitudRefinanController.msgTxtCondicionSocio}" styleClass="msgError"/>
   			<h:outputText value="#{solicitudRefinanController.msgTxtCondicionSocioNinguno}" styleClass="msgError"/>
   			<h:outputText value="#{solicitudRefinanController.msgTxtSubCondicionSocio}" styleClass="msgError"/>
   			<h:outputText value="#{solicitudRefinanController.msgTxtCondicionLaboralGarante}" styleClass="msgError"/>
   			<h:outputText value="#{solicitudRefinanController.msgTxtCondicionLaboralGaranteNinguno}" styleClass="msgError"/>
   			<h:outputText value="#{solicitudRefinanController.msgTxtSituacionLaboralGarante}" styleClass="msgError"/>
   			<h:outputText value="#{solicitudRefinanController.msgTxtSituacionLaboralGaranteNinguno}" styleClass="msgError"/>
   			<h:outputText value="#{solicitudRefinanController.msgTxtMaximaGarantia}" styleClass="msgError"/>
   			<h:outputText value="#{solicitudRefinanController.msgTxtSocioEstructuraGarante}" styleClass="msgError"/>
   			<h:outputText value="#{solicitudRefinanController.msgTxtSocioEstructuraOrigenGarante}" styleClass="msgError"/>
   			<h:outputText value="#{solicitudRefinanController.msgTxtCuentaGarante}" styleClass="msgError"/>
   			<h:outputText value="#{solicitudRefinanController.msgTxtGarante}" styleClass="msgError"/>
   			<h:outputText value="#{solicitudRefinanController.msgTxtMaxNroGarantes}" styleClass="msgError"/>
   			<h:outputText value="#{solicitudRefinanController.msgTxtDescuentoJudicial}" styleClass="msgError"/>
   			<h:outputText value="#{solicitudRefinanController.msgTxtYaExisteGaranteCOnfiguracionIgual}" styleClass="msgError"/>
   			
   		</h:panelGrid>
	</rich:panel>