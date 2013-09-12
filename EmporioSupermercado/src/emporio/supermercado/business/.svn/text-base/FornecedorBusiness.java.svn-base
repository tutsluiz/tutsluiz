package emporio.supermercado.business;

import java.util.List;

import emporio.supermercado.dao.FornecedorDAO;
import emporio.supermercado.domain.Fornecedor;

public class FornecedorBusiness {
	
	public Long salvar(Fornecedor fornecedor) throws Exception {
		try {
			return new FornecedorDAO().salvar(fornecedor);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	public void atualizar(Fornecedor fornecedor) throws Exception {
		try {
			new FornecedorDAO().atualizar(fornecedor);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	public Fornecedor buscarPorId(Long id) throws Exception {
		try {
			return new FornecedorDAO().buscarPorId(id);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	public void remover(Fornecedor fornecedor) throws Exception {
		try {
			new FornecedorDAO().remover(fornecedor);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	public List<Fornecedor> buscarTodos() throws Exception {
		try {
			return new FornecedorDAO().buscarTodos();
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
}
