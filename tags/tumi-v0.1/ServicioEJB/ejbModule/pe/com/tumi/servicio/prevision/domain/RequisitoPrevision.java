package pe.com.tumi.servicio.prevision.domain;

import java.sql.Timestamp;


import pe.com.tumi.framework.negocio.domain.TumiDomain;

public class RequisitoPrevision extends TumiDomain{
	private RequisitoPrevisionId id;
	private Integer intPersEmpresaPk;
	private Integer intItemReqAut;
	private Integer intItemReqAutEstDetalle;
	private	Integer intParaTipoArchivo;
	private	Integer intParaItemArchivo;
	private	Integer intParaItemHistorico;
	private	Integer intParaEstado;
	private	Timestamp tsFechaRequisito;
	private Integer intPersonaBeneficiarioId;
	
	
	
	public Timestamp getTsFechaRequisito() {
		return tsFechaRequisito;
	}

	public void setTsFechaRequisito(Timestamp tsFechaRequisito) {
		this.tsFechaRequisito = tsFechaRequisito;
	}

	public RequisitoPrevisionId getId() {
		return id;
	}



	public void setId(RequisitoPrevisionId id) {
		this.id = id;
	}



	public Integer getIntPersEmpresaPk() {
		return intPersEmpresaPk;
	}



	public void setIntPersEmpresaPk(Integer intPersEmpresaPk) {
		this.intPersEmpresaPk = intPersEmpresaPk;
	}



	public Integer getIntItemReqAut() {
		return intItemReqAut;
	}



	public void setIntItemReqAut(Integer intItemReqAut) {
		this.intItemReqAut = intItemReqAut;
	}



	public Integer getIntItemReqAutEstDetalle() {
		return intItemReqAutEstDetalle;
	}



	public void setIntItemReqAutEstDetalle(Integer intItemReqAutEstDetalle) {
		this.intItemReqAutEstDetalle = intItemReqAutEstDetalle;
	}



	public Integer getIntParaTipoArchivo() {
		return intParaTipoArchivo;
	}



	public void setIntParaTipoArchivo(Integer intParaTipoArchivo) {
		this.intParaTipoArchivo = intParaTipoArchivo;
	}



	public Integer getIntParaItemArchivo() {
		return intParaItemArchivo;
	}



	public void setIntParaItemArchivo(Integer intParaItemArchivo) {
		this.intParaItemArchivo = intParaItemArchivo;
	}



	public Integer getIntParaItemHistorico() {
		return intParaItemHistorico;
	}



	public void setIntParaItemHistorico(Integer intParaItemHistorico) {
		this.intParaItemHistorico = intParaItemHistorico;
	}



	public Integer getIntParaEstado() {
		return intParaEstado;
	}



	public void setIntParaEstado(Integer intParaEstado) {
		this.intParaEstado = intParaEstado;
	}




	@Override
	public String toString() {
		return "RequisitoPrevision [id=" + id
				+ ", intPersEmpresaPk=" + intPersEmpresaPk 
				+ ", intItemReqAut="+ intItemReqAut
				+ ", intItemReqAutEstDetalle="+ intItemReqAutEstDetalle 
				+ ", intParaTipoArchivo="+ intParaTipoArchivo 
				+ ", intParaItemArchivo="+ intParaItemArchivo 
				+ ", intParaItemHistorico="+ intParaItemHistorico 
				+ ", intParaEstado="+ intParaEstado 
				+ ", dtFechaRequisito="+ tsFechaRequisito 
				+ "]";
	}

	public Integer getIntPersonaBeneficiarioId() {
		return intPersonaBeneficiarioId;
	}

	public void setIntPersonaBeneficiarioId(Integer intPersonaBeneficiarioId) {
		this.intPersonaBeneficiarioId = intPersonaBeneficiarioId;
	}
	
}
