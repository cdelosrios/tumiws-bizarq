package pe.com.tumi.credito.socio.creditos.facade;
import java.util.List;

import javax.ejb.Remote;

import pe.com.tumi.credito.socio.creditos.domain.CreditoGarantia;
import pe.com.tumi.credito.socio.creditos.domain.CreditoGarantiaId;
import pe.com.tumi.framework.negocio.exception.BusinessException;

@Remote
public interface CreditoGarantiaFacadeRemote {
	
	public List<CreditoGarantia> getListaCreditoGarantia(CreditoGarantiaId o) throws BusinessException;
	public CreditoGarantia grabarCreditoGarantia(CreditoGarantia o) throws BusinessException;
	public CreditoGarantia modificarCreditoGarantia(CreditoGarantia o) throws BusinessException;
	public CreditoGarantia getCreditoGarantiaPorIdCreditoGarantia(CreditoGarantiaId pId) throws BusinessException;
	public CreditoGarantia eliminarCreditoGarantia(CreditoGarantia o) throws BusinessException;
}
