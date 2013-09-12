package emporio.supermercado.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import emporio.supermercado.domain.Fornecedor;

public class FornecedorDAO {
	private Session session;
	
	public FornecedorDAO() {
		this.session = HibernateUtil.getSession();
	}
	
	public Long salvar(Fornecedor fornecedor) throws Exception {
		try {
			session = HibernateUtil.getSession();
			Long id = (Long) session.save(fornecedor);
			session.beginTransaction().commit();
			return id;
		} catch(Exception e) {
			throw new Exception(e);
		} finally {
			session.close();
		}
	}
	
	public void atualizar(Fornecedor fornecedor) throws Exception {
		try {
			session.update(fornecedor);
			session.beginTransaction().commit();
		} catch(Exception e) {
			throw new Exception(e);
		} finally {
			session.close();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Fornecedor> buscarTodos() throws Exception {
		try {
			Criteria query = session.createCriteria(Fornecedor.class);
			return query.list();
		} catch(Exception e) {
			throw new Exception(e);
		} finally {
			session.close();
		}
	}
	
	public Fornecedor buscarPorId(Long id) throws Exception {
		try {
			Criteria query = session.createCriteria(Fornecedor.class);
			query.add(Restrictions.idEq(id));
			return (Fornecedor) query.uniqueResult();
		} catch(Exception e) {
			throw new Exception(e);
		} finally {
			session.close();
		}
	}
	
	public void remover(Fornecedor fornecedor) throws Exception {
		try {
			session.delete(fornecedor);
			session.beginTransaction().commit();
		} catch(Exception e) {
			throw new Exception(e);
		} finally {
			session.close();
		}
	}
}