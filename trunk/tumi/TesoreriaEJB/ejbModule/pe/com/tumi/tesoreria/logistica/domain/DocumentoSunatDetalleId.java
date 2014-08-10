package pe.com.tumi.tesoreria.logistica.domain;

import pe.com.tumi.framework.negocio.domain.TumiDomain;

public class DocumentoSunatDetalleId extends TumiDomain{
	private Integer intPersEmpresa;
	private Integer intItemDocumentoSunat;
	private Integer intItemDocumentoSunatDetalle;
	
	public Integer getIntPersEmpresa() {
		return intPersEmpresa;
	}
	public void setIntPersEmpresa(Integer intPersEmpresa) {
		this.intPersEmpresa = intPersEmpresa;
	}
	public Integer getIntItemDocumentoSunat() {
		return intItemDocumentoSunat;
	}
	public void setIntItemDocumentoSunat(Integer intItemDocumentoSunat) {
		this.intItemDocumentoSunat = intItemDocumentoSunat;
	}
	public Integer getIntItemDocumentoSunatDetalle() {
		return intItemDocumentoSunatDetalle;
	}
	public void setIntItemDocumentoSunatDetalle(Integer intItemDocumentoSunatDetalle) {
		this.intItemDocumentoSunatDetalle = intItemDocumentoSunatDetalle;
	}
	
	@Override
	public String toString() {
		return "DocumentoSunatDetalleId [intPersEmpresa=" + intPersEmpresa
				+ ", intItemDocumentoSunat=" + intItemDocumentoSunat
				+ ", intItemDocumentoSunatDetalle="
				+ intItemDocumentoSunatDetalle + "]";
	}
}