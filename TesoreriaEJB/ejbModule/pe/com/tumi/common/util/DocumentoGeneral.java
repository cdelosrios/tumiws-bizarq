package pe.com.tumi.common.util;

import java.math.BigDecimal;

import pe.com.tumi.cobranza.planilla.domain.EfectuadoResumen;
import pe.com.tumi.contabilidad.cierre.domain.LibroDiario;
import pe.com.tumi.contabilidad.legalizacion.domain.PagoLegalizacion;
import pe.com.tumi.empresa.domain.Subsucursal;
import pe.com.tumi.empresa.domain.Sucursal;
import pe.com.tumi.framework.negocio.domain.TumiDomain;
import pe.com.tumi.servicio.prevision.domain.ExpedienteLiquidacion;
import pe.com.tumi.servicio.prevision.domain.ExpedientePrevision;
import pe.com.tumi.servicio.solicitudPrestamo.domain.ExpedienteCredito;
import pe.com.tumi.tesoreria.egreso.domain.Movilidad;
import pe.com.tumi.tesoreria.logistica.domain.DocumentoSunat;

public class DocumentoGeneral extends TumiDomain{

	private	Integer		intTipoDocumento;
	private	String		strNroDocumento;
	private	Sucursal	sucursal;
	private	Subsucursal	subsucursal;
	private	BigDecimal	bdMonto;
	private	BigDecimal	bdSubTotal;
	private String		strDescripcion;
	
	private String		strEtiqueta;
	private Integer		intOrden;
	private String		strMonto;
	private String		strSubTotal;
	private Integer		intMoneda;
	
	private Movilidad movilidad;
	private	ExpedienteCredito	expedienteCredito;
	private PagoLegalizacion	pagoLegalizacion;
	private	ExpedientePrevision	expedientePrevision;
	private ExpedienteLiquidacion expedienteLiquidacion;
	private	EfectuadoResumen	efectuadoResumen;
	private DocumentoSunat		documentoSunat;

	//jchavez 19.06.2014 - variables de buscar documento ingreso (TESORERIA/CAJA)
	private Integer intPeriodoPlanilla;
	private BigDecimal bdMontoPagado;
	private BigDecimal bdMontoAIngresar;
	private Integer intPlanillaEfectSelec;
	private Boolean isDisabledDocPlanillaEfect;
	private Integer rbPlanillaEfectSelec;
	
	public Integer getIntTipoDocumento() {
		return intTipoDocumento;
	}
	public void setIntTipoDocumento(Integer intTipoDocumento) {
		this.intTipoDocumento = intTipoDocumento;
	}
	public Sucursal getSucursal() {
		return sucursal;
	}
	public void setSucursal(Sucursal sucursal) {
		this.sucursal = sucursal;
	}
	public Subsucursal getSubsucursal() {
		return subsucursal;
	}
	public void setSubsucursal(Subsucursal subsucursal) {
		this.subsucursal = subsucursal;
	}
	public BigDecimal getBdMonto() {
		return bdMonto;
	}
	public void setBdMonto(BigDecimal bdMonto) {
		this.bdMonto = bdMonto;
	}
	public String getStrNroDocumento() {
		return strNroDocumento;
	}
	public void setStrNroDocumento(String strNroDocumento) {
		this.strNroDocumento = strNroDocumento;
	}
	public BigDecimal getBdSubTotal() {
		return bdSubTotal;
	}
	public void setBdSubTotal(BigDecimal bdSubTotal) {
		this.bdSubTotal = bdSubTotal;
	}
	public Movilidad getMovilidad() {
		return movilidad;
	}
	public void setMovilidad(Movilidad movilidad) {
		this.movilidad = movilidad;
	}
	public Integer getIntOrden() {
		return intOrden;
	}
	public void setIntOrden(Integer intOrden) {
		this.intOrden = intOrden;
	}
	public PagoLegalizacion getPagoLegalizacion() {
		return pagoLegalizacion;
	}
	public void setPagoLegalizacion(PagoLegalizacion pagoLegalizacion) {
		this.pagoLegalizacion = pagoLegalizacion;
	}
	public ExpedienteCredito getExpedienteCredito() {
		return expedienteCredito;
	}
	public void setExpedienteCredito(ExpedienteCredito expedienteCredito) {
		this.expedienteCredito = expedienteCredito;
	}
	public ExpedientePrevision getExpedientePrevision() {
		return expedientePrevision;
	}
	public void setExpedientePrevision(ExpedientePrevision expedientePrevision) {
		this.expedientePrevision = expedientePrevision;
	}
	public String getStrDescripcion() {
		return strDescripcion;
	}
	public void setStrDescripcion(String strDescripcion) {
		this.strDescripcion = strDescripcion;
	}
	public String getStrMonto() {
		return strMonto;
	}
	public void setStrMonto(String strMonto) {
		this.strMonto = strMonto;
	}
	public String getStrSubTotal() {
		return strSubTotal;
	}
	public void setStrSubTotal(String strSubTotal) {
		this.strSubTotal = strSubTotal;
	}
	public String getStrEtiqueta() {
		return strEtiqueta;
	}
	public void setStrEtiqueta(String strEtiqueta) {
		this.strEtiqueta = strEtiqueta;
	}
	public ExpedienteLiquidacion getExpedienteLiquidacion() {
		return expedienteLiquidacion;
	}
	public void setExpedienteLiquidacion(ExpedienteLiquidacion expedienteLiquidacion) {
		this.expedienteLiquidacion = expedienteLiquidacion;
	}
	public EfectuadoResumen getEfectuadoResumen() {
		return efectuadoResumen;
	}
	public void setEfectuadoResumen(EfectuadoResumen efectuadoResumen) {
		this.efectuadoResumen = efectuadoResumen;
	}
	public Integer getIntMoneda() {
		return intMoneda;
	}
	public void setIntMoneda(Integer intMoneda) {
		this.intMoneda = intMoneda;
	}
	public DocumentoSunat getDocumentoSunat() {
		return documentoSunat;
	}
	public void setDocumentoSunat(DocumentoSunat documentoSunat) {
		this.documentoSunat = documentoSunat;
	}
	@Override
	public String toString() {
		return "DocumentoGeneral [intTipoDocumento=" + intTipoDocumento
				+ ", strNroDocumento=" + strNroDocumento + ", bdMonto="
				+ bdMonto + ", bdSubTotal=" + bdSubTotal + ", strDescripcion="
				+ strDescripcion + ", strEtiqueta=" + strEtiqueta
				+ ", intOrden=" + intOrden + ", strMonto=" + strMonto
				+ ", strSubTotal=" + strSubTotal + "]";
	}
	public Integer getIntPeriodoPlanilla() {
		return intPeriodoPlanilla;
	}
	public void setIntPeriodoPlanilla(Integer intPeriodoPlanilla) {
		this.intPeriodoPlanilla = intPeriodoPlanilla;
	}
	public BigDecimal getBdMontoPagado() {
		return bdMontoPagado;
	}
	public void setBdMontoPagado(BigDecimal bdMontoPagado) {
		this.bdMontoPagado = bdMontoPagado;
	}
	public BigDecimal getBdMontoAIngresar() {
		return bdMontoAIngresar;
	}
	public void setBdMontoAIngresar(BigDecimal bdMontoAIngresar) {
		this.bdMontoAIngresar = bdMontoAIngresar;
	}
	public Integer getIntPlanillaEfectSelec() {
		return intPlanillaEfectSelec;
	}
	public void setIntPlanillaEfectSelec(Integer intPlanillaEfectSelec) {
		this.intPlanillaEfectSelec = intPlanillaEfectSelec;
	}
	public Boolean getIsDisabledDocPlanillaEfect() {
		return isDisabledDocPlanillaEfect;
	}
	public void setIsDisabledDocPlanillaEfect(Boolean isDisabledDocPlanillaEfect) {
		this.isDisabledDocPlanillaEfect = isDisabledDocPlanillaEfect;
	}
	public Integer getRbPlanillaEfectSelec() {
		return rbPlanillaEfectSelec;
	}
	public void setRbPlanillaEfectSelec(Integer rbPlanillaEfectSelec) {
		this.rbPlanillaEfectSelec = rbPlanillaEfectSelec;
	}
}