package pe.com.tumi.seguridad.permiso.domain;

import pe.com.tumi.framework.negocio.domain.TumiDomain;

public class TransaccionId extends TumiDomain {

	private Integer intPersEmpresaPk;
	private Integer intIdTransaccion;
	public Integer getIntPersEmpresaPk() {
		return intPersEmpresaPk;
	}
	public void setIntPersEmpresaPk(Integer intPersEmpresaPk) {
		this.intPersEmpresaPk = intPersEmpresaPk;
	}
	public Integer getIntIdTransaccion() {
		return intIdTransaccion;
	}
	public void setIntIdTransaccion(Integer intIdTransaccion) {
		this.intIdTransaccion = intIdTransaccion;
	}
}
