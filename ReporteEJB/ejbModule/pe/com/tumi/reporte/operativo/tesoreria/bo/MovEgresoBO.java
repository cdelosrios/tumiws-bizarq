package pe.com.tumi.reporte.operativo.tesoreria.bo;

import java.util.HashMap;
import java.util.List;

import javax.faces.model.SelectItem;

import org.apache.log4j.Logger;

import pe.com.tumi.framework.negocio.exception.BusinessException;
import pe.com.tumi.framework.negocio.exception.DAOException;
import pe.com.tumi.framework.negocio.factory.TumiFactory;
import pe.com.tumi.reporte.operativo.tesoreria.dao.MovEgresoDao;
import pe.com.tumi.reporte.operativo.tesoreria.dao.impl.MovEgresoDaoIbatis;

public class MovEgresoBO {
	protected  static Logger log = Logger.getLogger(MovEgresoBO.class);
	private MovEgresoDao dao = (MovEgresoDao) TumiFactory.get(MovEgresoDaoIbatis.class);
	public List<SelectItem> getListFondoFijo(int intSucursal,int intAnio, int intTipoFondoFijo) throws BusinessException{
		List<SelectItem> lista = null;
		try{
			HashMap<String,Object> mapa = new HashMap<String,Object>();
			mapa.put("intIdSucursal",intSucursal);
			mapa.put("intAnio", intAnio );
			mapa.put("intTipoFondoFijo", intTipoFondoFijo);
			lista = dao.getListFondoFijo(mapa);
			
		}catch(DAOException e){
			throw new BusinessException(e);
		}catch(Exception e) {
			throw new BusinessException(e);
		}
		return lista;
	}
}
