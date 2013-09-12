package emporio.supermercado.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import emporio.supermercado.domain.Usuario;

public class UsuarioDAO {
	private Session session;
	
	public UsuarioDAO() {
		this.session = HibernateUtil.getSession();
	}
	
	public Long salvar(Usuario usuario) throws Exception {
		try {
			Long id = (Long) session.save(usuario);
			session.beginTransaction().commit();
			return id;
		} catch(Exception e) {
			throw new Exception(e);
		} finally {
			session.close();
		}
	}
	
	public void atualizar(Usuario usuario) throws Exception {
		try {
			session.update(usuario);
			session.beginTransaction().commit();
		} catch(Exception e) {
			throw new Exception(e);
		} finally {
			session.close();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Usuario> buscarTodos() throws Exception {
		try {
			Criteria query = session.createCriteria(Usuario.class);
			return query.list();
		} catch(Exception e) {
			throw new Exception(e);
		} finally {
			session.close();
		}
	}
	
	public Usuario buscarPorId(Long id) throws Exception {
		try {
			Criteria query = session.createCriteria(Usuario.class);
			query.add(Restrictions.idEq(id));
			return (Usuario) query.uniqueResult();
		} catch(Exception e) {
			throw new Exception(e);
		} finally {
			session.close();
		}
	}
	
	public Usuario buscarPorUsername(String username) throws Exception {
		try {
			Criteria query = session.createCriteria(Usuario.class);
			query.add(Restrictions.eq("username", username));
			return (Usuario) query.uniqueResult();
		} catch(Exception e) {
			throw new Exception(e);
		} finally {
			session.close();
		}
	}
	
	public void remover(Usuario usuario) throws Exception {
		try {
			session.delete(usuario);
			session.beginTransaction().commit();
		} catch(Exception e) {
			throw new Exception(e);
		} finally {
			session.close();
		}
	}
}