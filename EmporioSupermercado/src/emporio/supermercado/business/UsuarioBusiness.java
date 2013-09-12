package emporio.supermercado.business;

import java.util.List;

import emporio.supermercado.dao.UsuarioDAO;
import emporio.supermercado.domain.Usuario;

public class UsuarioBusiness {
	
	public Long salvar(Usuario usuario) throws Exception {
		try {
			return new UsuarioDAO().salvar(usuario);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	public void atualizar(Usuario usuario) throws Exception {
		try {
			new UsuarioDAO().atualizar(usuario);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	public Usuario buscarPorId(Long id) throws Exception {
		try {
			return new UsuarioDAO().buscarPorId(id);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	public Usuario buscarPorUsername(String username) throws Exception {
		try {
			return new UsuarioDAO().buscarPorUsername(username);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	public void remover(Usuario usuario) throws Exception {
		try {
			new UsuarioDAO().remover(usuario);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	public List<Usuario> buscarTodos() throws Exception {
		try {
			return new UsuarioDAO().buscarTodos();
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
}
