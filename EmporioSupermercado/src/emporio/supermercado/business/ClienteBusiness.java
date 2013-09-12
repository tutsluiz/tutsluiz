package emporio.supermercado.business;

import java.util.List;
import emporio.supermercado.dao.ClienteDAO;
import emporio.supermercado.domain.Cliente;

public class ClienteBusiness {
	
	public Long salvar(Cliente cliente) throws Exception {
		try {
			return new ClienteDAO().salvar(cliente);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	public void atualizar(Cliente cliente) throws Exception {
		try {
			new ClienteDAO().atualizar(cliente);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	public Cliente buscarPorId(Long id) throws Exception {
		try {
			return new ClienteDAO().buscarPorId(id);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	
	public void remover(Cliente cliente) throws Exception {
		try {
			new ClienteDAO().remover(cliente);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	public List<Cliente> buscarTodos() throws Exception {
		try {
			return new ClienteDAO().buscarTodos();
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	/* metodo de busca do cliente - arthur 09-09-2013 */
	public List<Cliente> buscarPorRazaoSocial(String razaoSocial) throws Exception {
		try {
			return new ClienteDAO().buscarRazaoSocial(razaoSocial);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	  

}
