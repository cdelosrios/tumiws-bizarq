package pe.com.tumi.riesgo.archivo.domain;

import pe.com.tumi.framework.negocio.domain.TumiDomain;

public class ConfEstructuraId extends TumiDomain{

	private Integer intPersEmpresaPk;
	private Integer intItemConfiguracion;
	public Integer getIntPersEmpresaPk() {
		return intPersEmpresaPk;
	}
	public void setIntPersEmpresaPk(Integer intPersEmpresaPk) {
		this.intPersEmpresaPk = intPersEmpresaPk;
	}
	public Integer getIntItemConfiguracion() {
		return intItemConfiguracion;
	}
	public void setIntItemConfiguracion(Integer intItemConfiguracion) {
		this.intItemConfiguracion = intItemConfiguracion;
	}
	@Override
	public String toString() {
		return "ConfEstructuraId [intPersEmpresaPk=" + intPersEmpresaPk
				+ ", intItemConfiguracion=" + intItemConfiguracion + "]";
	}

}