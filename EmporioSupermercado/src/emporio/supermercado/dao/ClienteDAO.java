package emporio.supermercado.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import emporio.supermercado.domain.Cliente;

public class ClienteDAO {
	private Session session;
	
	public ClienteDAO() {
		this.session = HibernateUtil.getSession();
	}
	
	public Long salvar(Cliente cliente) throws Exception {
		try {
			Long id = (Long) session.save(cliente);
			session.beginTransaction().commit();
			return id;
		} catch(Exception e) {
			throw new Exception(e);
		} finally {
			session.close();
		}
	}
	
	public void atualizar(Cliente cliente) throws Exception {
		try {
			session.update(cliente);
			session.beginTransaction().commit();
		} catch(Exception e) {
			throw new Exception(e);
		} finally {
			session.close();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Cliente> buscarTodos() throws Exception {
		try {
			Criteria query = session.createCriteria(Cliente.class);
			return query.list();
		} catch(Exception e) {
			throw new Exception(e);
		} finally {
			session.close();
		}
	}
	
	
	/* metodo de busca do cliente - arthur 09-09-2013 */
	
	@SuppressWarnings("unchecked")
	public List<Cliente> buscarRazaoSocial(String razaoSocial) throws Exception {
		try {
			Criteria query = session.createCriteria(Cliente.class);
			query.add(Restrictions.ilike("razaoSocial", "%"+razaoSocial+"%", MatchMode.ANYWHERE));
			return query.list();
		} catch(Exception e) {
			throw new Exception(e);
		} finally {
			session.close();
		}
	}
	
	public Cliente buscarPorId(Long id) throws Exception {
		try {
			Criteria query = session.createCriteria(Cliente.class);
			query.add(Restrictions.idEq(id));
			return (Cliente) query.uniqueResult();
		} catch(Exception e) {
			throw new Exception(e);
		} finally {
			session.close();
		}
	}

	
	public void remover(Cliente cliente) throws Exception {
		try {
			session.delete(cliente);
			session.beginTransaction().commit();
		} catch(Exception e) {
			throw new Exception(e);
		} finally {
			session.close();
		}
	}
}