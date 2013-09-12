package emporio.supermercado.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;

import emporio.supermercado.business.FornecedorBusiness;
import emporio.supermercado.business.MercadoriaBusiness;
import emporio.supermercado.dao.MercadoriaDAO;
import emporio.supermercado.domain.Fornecedor;
import emporio.supermercado.domain.Mercadoria;
import emporio.supermercado.util.Util;
import emporio.supermercado.util.Validacao;

@Namespace("/sistema/mercadoria")
public class MercadoriaAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	
	private Mercadoria mercadoria = new Mercadoria();
	private List<Fornecedor> fornecedores = new ArrayList<Fornecedor>();
	private String d;
	
	public String getD() {
		return d;
	}

	public void setD(String d) {
		this.d = d;
	}

	public MercadoriaAction() {
		super();
	}
	
	@Actions(value = {
		@Action(value = "/sistema/mercadoria", results = {
				@Result(name = "ok", location = "/sistema/mercadoria.jsp")
		}),
		@Action(value = "/sistema/mercadoria/", results = {
				@Result(name = "ok", location = "/sistema/mercadoria.jsp")
		})
	})
	public String init() {
		
		d = getDataAtual();
		
		fornecedores = getFornecedoresList();
		
		return "ok";
	}
	
	public String getDataAtual() {
		String DATE_FORMAT = "ddMMyyyy";
	    SimpleDateFormat sdf =
	          new SimpleDateFormat(DATE_FORMAT);
	    Calendar c1 = Calendar.getInstance(); // today
	    
		
		return sdf.format(c1.getTime());
	}
	
	public List<Fornecedor> getFornecedoresList() {
		try {
			return new FornecedorBusiness().buscarTodos();
		} catch(Exception e) {
			
		}
		
		return null;
	}

	@Action(value = "salvar", results = {
			@Result(name = "erro", location = "/sistema/mercadoria.jsp"),
			@Result(name = "sucesso", location = "/sistema/mercadoria.jsp")
	})
	public String salvar() {
		Boolean hasError = false;
		
		if(Util.isEmpty(mercadoria.getCodigo())) {
			addActionError("É obrigatório preenchimento do código!");
			hasError = true;
		}
		
		if(Util.isEmpty(mercadoria.getNome())) {
			addActionError("É obrigatório preenchimento do nome!");
			hasError = true;
		}
		
		if(Util.isEmpty(mercadoria.getDescricaoCurta())){
			addActionError("É obrigatório preenchimento da descrição curta!");
			hasError = true;
		}
		
		if(Util.isEmpty(mercadoria.getDataCadastro())) {
			addActionError("É obrigatório preenchimento da data de cadastro!");
			hasError = true;
		}
		
		if(Util.isEmpty(mercadoria.getPrecoCusto())) {
			addActionError("É obrigatório preenchimento do preço de custo!");
			hasError = true;
		
		}else if (Validacao.validaPreco(mercadoria.getPrecoCusto())){
			addActionError("O preço de custo informado não é válido!");
			hasError = true;
		}
		
		
		if(Util.isEmpty(mercadoria.getPrecoVenda())) {
			addActionError("É obrigatório preenchimento do preco de venda!");
			hasError = true;
		
		} else if (Validacao.validaPreco(mercadoria.getPrecoCusto())){
			addActionError("O preço de venda informado não é válido!");
			hasError = true;
		}
		
		if(Util.isEmpty(mercadoria.getEstoque())) {
			addActionError("É obrigatório preenchimento do estoque!");
			hasError = true;
		
		} else if (Validacao.validaCampoNumero(mercadoria.getEstoque())) {
			addActionError("O campo estoque informado é inválido!");
			hasError = true;
		}
		
		if (!mercadoria.getPeso().isEmpty() && Validacao.validaCampoNumero(mercadoria.getPeso())) {
			addActionError("O campo peso informado é inválido!");
			hasError = true;
		}
		
		
		if(Util.isEmpty(mercadoria.getDataCadastro())) {
			addActionError("É obrigatório preenchimento da Data de Abertura!");
			hasError = true;
		
		} else if (Validacao.validaData(mercadoria.getDataCadastro()) == false)
		{
			addActionError("Data de Abertura informada é inválida!");
			hasError = true;
		}
		
		List<Mercadoria> mercadorias = null;
		try {
			mercadorias = new MercadoriaDAO().buscarTodos();
		} catch (Exception e1) {
			e1.printStackTrace();
		}		
		
		int size = mercadorias.size();
		
		for (int i = 0; i < size; i++)  {
			
			if (mercadorias.get(i).getCodigo().equals(mercadoria.getCodigo()) && 
				!mercadorias.get(i).getId().equals(mercadoria.getId())) {
				
				addActionError("A código informado ja está cadastrado!");
				hasError = true;
			}			
		}
		
		if(hasError)
			return "erro";
		
		try {
			if(mercadoria.getId() == null || "".equals(mercadoria.getId())) {
				new MercadoriaBusiness().salvar(mercadoria);
			} else {
				new MercadoriaBusiness().atualizar(mercadoria);
			}
		} catch(Exception e) {
			e.printStackTrace();
			addActionError("Erro ao salvar mercadoria. " + e.getMessage());
			return "erro";
		}
		
		
		addActionMessage("Mercadoria cadastrada com sucesso!");
		refresh();
		mercadoria = null;
		return "sucesso";
	}
	
	@Action(value = "prepararEdicao", results = {
			@Result(name = "sucesso", location = "/sistema/mercadoria.jsp")
	})
	public String prepararEdicao() {
		try {
			mercadoria = new MercadoriaBusiness().buscarPorId(mercadoria.getId());
			d = mercadoria.getDataCadastro();
			fornecedores = getFornecedoresList();
			return "sucesso";
		} catch (Exception e) {
			return "erro";
		}
	}
	
	public void refresh() {		
		fornecedores = getFornecedoresList();
		d = getDataAtual();
	}
	@Action(value = "remover", results = {
			@Result(name = "erro", location = "/sistema/mercadoria.jsp"),
			@Result(name = "sucesso", location = "/sistema/mercadoria.jsp")
	})
	public String remover() {
		try {
			new MercadoriaBusiness().remover(mercadoria);
			addActionMessage("Mercadoria removida com sucesso!");
			refresh();
			mercadoria = null;
			return "sucesso";
		} catch (Exception e) {
			return "erro";
		}
	}
	
	public Mercadoria getMercadoria() {
		return mercadoria;
	}
	public void setMercadoria(Mercadoria mercadoria) {
		this.mercadoria = mercadoria;
	}
	
	public List<Fornecedor> getFornecedores() {
		return fornecedores;
	}
	
	public void setFornecedores(List<Fornecedor> fornecedores) {
		this.fornecedores = fornecedores;
	}

	public List<Mercadoria> getMercadorias() {
		try {
			return new MercadoriaBusiness().buscarTodos();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}