package emporio.supermercado.business;

import java.util.List;

import emporio.supermercado.dao.MercadoriaDAO;
import emporio.supermercado.domain.Mercadoria;

public class MercadoriaBusiness {
	
	public Long salvar(Mercadoria mercadoria) throws Exception {
		try {
			return new MercadoriaDAO().salvar(mercadoria);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	public void atualizar(Mercadoria mercadoria) throws Exception {
		try {
			new MercadoriaDAO().atualizar(mercadoria);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	public Mercadoria buscarPorId(Long id) throws Exception {
		try {
			return new MercadoriaDAO().buscarPorId(id);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	public void remover(Mercadoria mercadoria) throws Exception {
		try {
			new MercadoriaDAO().remover(mercadoria);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	public List<Mercadoria> buscarTodos() throws Exception {
		try {
			return new MercadoriaDAO().buscarTodos();
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
}
