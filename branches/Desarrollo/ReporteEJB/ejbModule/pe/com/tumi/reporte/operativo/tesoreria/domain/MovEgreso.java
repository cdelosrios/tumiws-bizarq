package pe.com.tumi.reporte.operativo.tesoreria.domain;


import java.math.BigDecimal;

import pe.com.tumi.framework.negocio.domain.TumiDomain;

public class MovEgreso extends TumiDomain{
	private int intRow;
	private Integer intEmpresaEgreso;
	private Integer intItemEgresoGeneral;
	private Integer intPeriodoEgreso;
	private Integer intItemFondoFijo;
	private BigDecimal bdMontoApertura;
	private String strDescripcion;
	
	//Cabecera Reporte Egresos
	private String strNroMovimiento;
	private String strNroEgreso;
	private Integer intIdSucursal;
	private String strSucursal;
	private String strFechaEgreso;
	private String strConcepto;
	private Integer intParaFormaPago;
	private String strFormaPago;
	private String strMoneda;
	private BigDecimal bdMonto;
	private String strDescMonto;
	private BigDecimal bdMontoSaldo;
	private BigDecimal bdMontoUtilizado;
	private String strFechaCierre;
	private String strNombreCuenta;
	private String strNumeroCuenta;
	private String strBanco;
	private String strNroCheque;
	private String strNroPlanilla;
	private String strNroAsiento;
	private Integer intIdUsuario;
	private String strNombreUsuario;
	private String strFechaHora;
	private Integer intIdPersResponsable;
	private String strPersonaEntrega;
	private String strNroDocEntrega;
	private Integer intIdTipoDocumentoEntrega;
	private String strTipoDocumentoEntrega;
	
	public BigDecimal getBdMontoApertura() {
		return bdMontoApertura;
	}
	public void setBdMontoApertura(BigDecimal bdMontoApertura) {
		this.bdMontoApertura = bdMontoApertura;
	}
	public int getIntRow() {
		return intRow;
	}
	public void setIntRow(int intRow) {
		this.intRow = intRow;
	}
	public String getStrDescripcion() {
		return strDescripcion;
	}
	public void setStrDescripcion(String strDescripcion) {
		this.strDescripcion = strDescripcion;
	}
	public Integer getIntItemFondoFijo() {
		return intItemFondoFijo;
	}
	public void setIntItemFondoFijo(Integer intItemFondoFijo) {
		this.intItemFondoFijo = intItemFondoFijo;
	}
	public Integer getIntEmpresaEgreso() {
		return intEmpresaEgreso;
	}
	public void setIntEmpresaEgreso(Integer intEmpresaEgreso) {
		this.intEmpresaEgreso = intEmpresaEgreso;
	}
	public Integer getIntItemEgresoGeneral() {
		return intItemEgresoGeneral;
	}
	public void setIntItemEgresoGeneral(Integer intItemEgresoGeneral) {
		this.intItemEgresoGeneral = intItemEgresoGeneral;
	}
	public Integer getIntPeriodoEgreso() {
		return intPeriodoEgreso;
	}
	public void setIntPeriodoEgreso(Integer intPeriodoEgreso) {
		this.intPeriodoEgreso = intPeriodoEgreso;
	}
	public String getStrNroMovimiento() {
		return strNroMovimiento;
	}
	public void setStrNroMovimiento(String strNroMovimiento) {
		this.strNroMovimiento = strNroMovimiento;
	}
	public String getStrNroEgreso() {
		return strNroEgreso;
	}
	public void setStrNroEgreso(String strNroEgreso) {
		this.strNroEgreso = strNroEgreso;
	}
	public Integer getIntIdSucursal() {
		return intIdSucursal;
	}
	public void setIntIdSucursal(Integer intIdSucursal) {
		this.intIdSucursal = intIdSucursal;
	}
	public String getStrSucursal() {
		return strSucursal;
	}
	public void setStrSucursal(String strSucursal) {
		this.strSucursal = strSucursal;
	}
	public String getStrFechaEgreso() {
		return strFechaEgreso;
	}
	public void setStrFechaEgreso(String strFechaEgreso) {
		this.strFechaEgreso = strFechaEgreso;
	}
	public String getStrConcepto() {
		return strConcepto;
	}
	public void setStrConcepto(String strConcepto) {
		this.strConcepto = strConcepto;
	}
	public Integer getIntParaFormaPago() {
		return intParaFormaPago;
	}
	public void setIntParaFormaPago(Integer intParaFormaPago) {
		this.intParaFormaPago = intParaFormaPago;
	}
	public String getStrFormaPago() {
		return strFormaPago;
	}
	public void setStrFormaPago(String strFormaPago) {
		this.strFormaPago = strFormaPago;
	}
	public String getStrMoneda() {
		return strMoneda;
	}
	public void setStrMoneda(String strMoneda) {
		this.strMoneda = strMoneda;
	}
	public BigDecimal getBdMonto() {
		return bdMonto;
	}
	public void setBdMonto(BigDecimal bdMonto) {
		this.bdMonto = bdMonto;
	}
	public String getStrDescMonto() {
		return strDescMonto;
	}
	public void setStrDescMonto(String strDescMonto) {
		this.strDescMonto = strDescMonto;
	}
	public BigDecimal getBdMontoSaldo() {
		return bdMontoSaldo;
	}
	public void setBdMontoSaldo(BigDecimal bdMontoSaldo) {
		this.bdMontoSaldo = bdMontoSaldo;
	}
	public BigDecimal getBdMontoUtilizado() {
		return bdMontoUtilizado;
	}
	public void setBdMontoUtilizado(BigDecimal bdMontoUtilizado) {
		this.bdMontoUtilizado = bdMontoUtilizado;
	}
	public String getStrFechaCierre() {
		return strFechaCierre;
	}
	public void setStrFechaCierre(String strFechaCierre) {
		this.strFechaCierre = strFechaCierre;
	}
	public String getStrNombreCuenta() {
		return strNombreCuenta;
	}
	public void setStrNombreCuenta(String strNombreCuenta) {
		this.strNombreCuenta = strNombreCuenta;
	}
	public String getStrNumeroCuenta() {
		return strNumeroCuenta;
	}
	public void setStrNumeroCuenta(String strNumeroCuenta) {
		this.strNumeroCuenta = strNumeroCuenta;
	}
	public String getStrBanco() {
		return strBanco;
	}
	public void setStrBanco(String strBanco) {
		this.strBanco = strBanco;
	}
	public String getStrNroCheque() {
		return strNroCheque;
	}
	public void setStrNroCheque(String strNroCheque) {
		this.strNroCheque = strNroCheque;
	}
	public String getStrNroPlanilla() {
		return strNroPlanilla;
	}
	public void setStrNroPlanilla(String strNroPlanilla) {
		this.strNroPlanilla = strNroPlanilla;
	}
	public String getStrNroAsiento() {
		return strNroAsiento;
	}
	public void setStrNroAsiento(String strNroAsiento) {
		this.strNroAsiento = strNroAsiento;
	}
	public Integer getIntIdUsuario() {
		return intIdUsuario;
	}
	public void setIntIdUsuario(Integer intIdUsuario) {
		this.intIdUsuario = intIdUsuario;
	}
	public String getStrNombreUsuario() {
		return strNombreUsuario;
	}
	public void setStrNombreUsuario(String strNombreUsuario) {
		this.strNombreUsuario = strNombreUsuario;
	}
	public String getStrFechaHora() {
		return strFechaHora;
	}
	public void setStrFechaHora(String strFechaHora) {
		this.strFechaHora = strFechaHora;
	}
	public Integer getIntIdPersResponsable() {
		return intIdPersResponsable;
	}
	public void setIntIdPersResponsable(Integer intIdPersResponsable) {
		this.intIdPersResponsable = intIdPersResponsable;
	}
	public String getStrPersonaEntrega() {
		return strPersonaEntrega;
	}
	public void setStrPersonaEntrega(String strPersonaEntrega) {
		this.strPersonaEntrega = strPersonaEntrega;
	}
	public String getStrNroDocEntrega() {
		return strNroDocEntrega;
	}
	public void setStrNroDocEntrega(String strNroDocEntrega) {
		this.strNroDocEntrega = strNroDocEntrega;
	}
	public Integer getIntIdTipoDocumentoEntrega() {
		return intIdTipoDocumentoEntrega;
	}
	public void setIntIdTipoDocumentoEntrega(Integer intIdTipoDocumentoEntrega) {
		this.intIdTipoDocumentoEntrega = intIdTipoDocumentoEntrega;
	}
	public String getStrTipoDocumentoEntrega() {
		return strTipoDocumentoEntrega;
	}
	public void setStrTipoDocumentoEntrega(String strTipoDocumentoEntrega) {
		this.strTipoDocumentoEntrega = strTipoDocumentoEntrega;
	}
}
