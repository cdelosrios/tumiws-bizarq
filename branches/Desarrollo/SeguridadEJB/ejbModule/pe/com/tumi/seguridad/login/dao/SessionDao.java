package pe.com.tumi.seguridad.login.dao;

import pe.com.tumi.framework.negocio.exception.DAOException;
import pe.com.tumi.framework.negocio.persistencia.dao.TumiDao;
import pe.com.tumi.seguridad.login.domain.Session;

public interface SessionDao extends TumiDao {
	public Session grabar(Session o) throws DAOException;
	public Session modificar(Session o) throws DAOException;
	public Integer getCntActiveSessionsByUser(Object o) throws DAOException;
}