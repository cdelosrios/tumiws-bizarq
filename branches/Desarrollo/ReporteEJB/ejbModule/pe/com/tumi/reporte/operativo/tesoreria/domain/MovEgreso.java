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
}
