/**
* Resumen.
* Objeto: ConciliacionFacade
* Descripci�n:  Facade principal del proceso de conciliacion bancaria.
* Fecha de Creaci�n: 18/10/2014.
* Requerimiento de Creaci�n: REQ14-006
* Autor: Bizarq
*/
package pe.com.tumi.tesoreria.conciliacion.facade;

import java.util.List;

import pe.com.tumi.framework.negocio.exception.BusinessException;
import pe.com.tumi.tesoreria.egreso.domain.Conciliacion;
import pe.com.tumi.tesoreria.egreso.domain.ConciliacionId;
import pe.com.tumi.tesoreria.egreso.domain.comp.ConciliacionComp;

public interface ConciliacionFacadeLocal {

	public Conciliacion getPorPk(ConciliacionId conciliacionId) throws BusinessException;
	public List<Conciliacion> getListFilter(ConciliacionComp conciliacionCompBusq)throws BusinessException;

}