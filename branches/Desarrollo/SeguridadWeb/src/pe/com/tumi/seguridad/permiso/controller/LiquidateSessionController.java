package pe.com.tumi.seguridad.permiso.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import pe.com.tumi.common.util.Constante;
import pe.com.tumi.common.util.DaoException;
import pe.com.tumi.empresa.domain.Sucursal;
import pe.com.tumi.framework.negocio.ejb.factory.EJBFactory;
import pe.com.tumi.framework.negocio.ejb.factory.EJBFactoryException;
import pe.com.tumi.framework.negocio.exception.BusinessException;
import pe.com.tumi.parametro.tabla.facade.TablaFacadeRemote;
import pe.com.tumi.persona.core.facade.PersonaFacadeRemote;
import pe.com.tumi.seguridad.empresa.facade.EmpresaFacadeLocal;
import pe.com.tumi.seguridad.login.domain.Session;
import pe.com.tumi.seguridad.login.domain.Usuario;
import pe.com.tumi.seguridad.login.domain.composite.SessionComp;
import pe.com.tumi.seguridad.login.facade.LoginFacadeLocal;
import pe.com.tumi.seguridad.permiso.domain.LiquidateSession;

public class LiquidateSessionController {
	protected static Logger log = Logger
			.getLogger(LiquidateSessionController.class);
	private Integer intTipoAcceso;
	private LiquidateSession objLiqSess;
	private List listaEmpresas;
	private List listaEstados;
	private PersonaFacadeRemote personaFacade;
	private Usuario usuario;
	private TablaFacadeRemote tablaFacade;
	private List<Sucursal> listaJuridicaSucursal;
	private List<SessionComp> listaSesionWeb;
	private List listaBlockDataBase;
	private List listaSesionDataBase;
	private LoginFacadeLocal loginFacade;
	private String strEsquema;
	private String strObjecto;
	private String strPrograma;
	private SessionComp objSelSessionWeb;
	

	public SessionComp getObjSelSessionWeb() {
		return objSelSessionWeb;
	}

	public void setObjSelSessionWeb(SessionComp objSelSessionWeb) {
		this.objSelSessionWeb = objSelSessionWeb;
	}

	public String getStrEsquema() {
		return strEsquema;
	}

	public void setStrEsquema(String strEsquema) {
		this.strEsquema = strEsquema;
	}

	public String getStrObjecto() {
		return strObjecto;
	}

	public void setStrObjecto(String strObjecto) {
		this.strObjecto = strObjecto;
	}

	public String getStrPrograma() {
		return strPrograma;
	}

	public void setStrPrograma(String strPrograma) {
		this.strPrograma = strPrograma;
	}

	public List getListaBlockDataBase() {
		return listaBlockDataBase;
	}

	public void setListaBlockDataBase(List listaBlockDataBase) {
		this.listaBlockDataBase = listaBlockDataBase;
	}

	public List getListaSesionDataBase() {
		return listaSesionDataBase;
	}

	public void setListaSesionDataBase(List listaSesionDataBase) {
		this.listaSesionDataBase = listaSesionDataBase;
	}

	public List<SessionComp> getListaSesionWeb() {
		return listaSesionWeb;
	}

	public void setListaSesionWeb(List<SessionComp> listaSesionWeb) {
		this.listaSesionWeb = listaSesionWeb;
	}

	public List<Sucursal> getListaJuridicaSucursal() {
		return listaJuridicaSucursal;
	}

	public void setListaJuridicaSucursal(List<Sucursal> listaJuridicaSucursal) {
		this.listaJuridicaSucursal = listaJuridicaSucursal;
	}

	public List getListaEstados() {
		return listaEstados;
	}

	public void setListaEstados(List listaEstados) {
		this.listaEstados = listaEstados;
	}

	public List getListaEmpresas() {
		return listaEmpresas;
	}

	public void setListaEmpresas(List listaEmpresas) {
		this.listaEmpresas = listaEmpresas;
	}

	public LiquidateSession getObjLiqSess() {
		return objLiqSess;
	}

	public void setObjLiqSess(LiquidateSession objLiqSess) {
		this.objLiqSess = objLiqSess;
	}

	public Integer getIntTipoAcceso() {
		return intTipoAcceso;
	}

	public void setIntTipoAcceso(Integer intTipoAcceso) {
		this.intTipoAcceso = intTipoAcceso;
	}

	public LiquidateSessionController() {
		try {
			usuario = (Usuario) getRequest().getSession().getAttribute(
					"usuario");
			objLiqSess = new LiquidateSession();
			if (usuario != null) {
				personaFacade = (PersonaFacadeRemote) EJBFactory
						.getRemote(PersonaFacadeRemote.class);
				tablaFacade = (TablaFacadeRemote) EJBFactory.getRemote(TablaFacadeRemote.class);
				listaEmpresas = personaFacade.getListaJuridicaDeEmpresa();
				listaEstados = tablaFacade.getListaTablaPorIdMaestroYNotInIdDetalle(Constante.INT_ONE, Constante.PARAM_T_ESTADO_ANULADO);
				loginFacade = (LoginFacadeLocal) EJBFactory.getLocal(LoginFacadeLocal.class);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void reloadCboSucursales(ActionEvent event) throws DaoException {
		log.info("-----------------------Debugging EmpresaController.reloadCboSucursales-----------------------------");
		Integer intIdEmpresa = objLiqSess.getIntPersEmpresa();
		log.info("intIdEmpresa = "+intIdEmpresa);
		List<Sucursal> lista = null;
		EmpresaFacadeLocal facade = null;
		try {
			facade = (EmpresaFacadeLocal)EJBFactory.getLocal(EmpresaFacadeLocal.class);
			listaJuridicaSucursal = facade.getListaSucursalPorPkEmpresa(intIdEmpresa);
			log.info("listSucursal.size(): " + listaJuridicaSucursal.size());
		} catch (EJBFactoryException e) {
			e.printStackTrace();
		} catch (BusinessException e) {
			e.printStackTrace();
		}
		//listSucursal = getService().listarSucursales(prmtBusqSucursales);
	}
	
	public void mostrarSessionWeb(ActionEvent event) {
		intTipoAcceso = Constante.PARAM_T_SESSION_WEB;

	}
	public void mostrarBlockDataBase(ActionEvent event) {
		strEsquema = "";
		intTipoAcceso = Constante.PARAM_T_BLOCK_BD;

	}
	public void mostrarSessionDataBase(ActionEvent event) {
		strEsquema = "";
		intTipoAcceso = Constante.PARAM_T_SESSION_BD;

	}
	public void seleccionarRegistroSessionWeb(ActionEvent event){
		objSelSessionWeb = (SessionComp)event.getComponent().getAttributes().get("item");
	}
	public void desactivarSesion(ActionEvent event){
		Session objSessionClose = objSelSessionWeb.getSession();
		objSessionClose.setIntIdEstado(Constante.PARAM_T_ESTADOUNIVERSAL_INACTIVO);
		objSessionClose.setTsFechaTermino(new Timestamp(new Date().getTime()));
		try {
			loginFacade.modificarSession(objSessionClose);
			buscarSesionWeb();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
	}
	public void buscarSesionWeb()throws BusinessException, Exception{
		Session objSession = null;
		try {
			objSession = new Session();
			objSession.getId().setIntPersEmpresaPk(objLiqSess.getIntPersEmpresa().equals(Constante.PARAM_COMBO_TODOS)?null:objLiqSess.getIntPersEmpresa());
			objSession.setIntIdSucursal(objLiqSess.getIntCboSucursalEmp().equals(Constante.PARAM_COMBO_TODOS)?null:objLiqSess.getIntCboSucursalEmp());
			objSession.setTsFechaRegistro(objLiqSess.getFechaInicioFiltro());
			objSession.setTsFechaTermino(objLiqSess.getFechaFinFiltro());
			objSession.setIntIdEstado(objLiqSess.getIntEstado().equals(Constante.PARAM_COMBO_TODOS)?null:objLiqSess.getIntEstado());
			listaSesionWeb = loginFacade.getListaSessionWeb(objSession, objLiqSess.getStrUsuario());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
	}
	
	public void buscarBlockDataBase ()throws BusinessException, Exception{
		listaBlockDataBase = loginFacade.getListBlockDB(strEsquema, strPrograma, strObjecto);
	}
	
	public void buscarSesionDataBase () throws BusinessException, Exception {
		listaSesionDataBase = loginFacade.getListaSessionDB(strEsquema, strPrograma);
	}
	
	protected HttpServletRequest getRequest() {
		return (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
	}

}
