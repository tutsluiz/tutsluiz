package emporio.supermercado.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;

import emporio.supermercado.business.FornecedorBusiness;
import emporio.supermercado.dao.FornecedorDAO;
import emporio.supermercado.domain.Fornecedor;
import emporio.supermercado.util.Util;
import emporio.supermercado.util.Validacao;

@Namespace("/sistema/fornecedor")
public class FornecedorAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	
	private Fornecedor fornecedor = new Fornecedor();
	
	private String d;
	
	public String getD() {
		return d;
	}

	public void setD(String d) {
		this.d = d;
	}
	
	public FornecedorAction() {
		super();
	}
	
	@Actions(value = {
		@Action(value = "/sistema/fornecedor", results = {
				@Result(name = "ok", location = "/sistema/fornecedor.jsp")
		}),
		@Action(value = "/sistema/fornecedor/", results = {
				@Result(name = "ok", location = "/sistema/fornecedor.jsp")
		})
	})
	public String init() {
		String DATE_FORMAT = "ddMMyyyy";
	    SimpleDateFormat sdf =
	          new SimpleDateFormat(DATE_FORMAT);
	    Calendar c1 = Calendar.getInstance(); // today
	    
		
		d = sdf.format(c1.getTime());
		
		return "ok";
	}

	@Action(value = "salvar", results = {
			@Result(name = "erro", location = "/sistema/fornecedor.jsp"),
			@Result(name = "sucesso", location = "/sistema/fornecedor.jsp")
	})
	public String salvar() {
		Boolean hasError = false;
		
		if(Util.isEmpty(fornecedor.getRazaoSocial())) {
			addActionError("� obrigat�rio preenchimento da Raz�o Social!");
			hasError = true;
		}
		
		if(Util.isEmpty(fornecedor.getCnpj())) {
			addActionError("� obrigat�rio preenchimento do CNPJ!");
			hasError = true;
		}
		
		if(Util.isEmpty(fornecedor.getInscricaoEstadual())){
			addActionError("� obrigat�rio preenchimento da Inscri��o Estadual!");
			hasError = true;
		}
		
		if(Util.isEmpty(fornecedor.getCep())){
			addActionError("� obrigat�rio preenchimento do CEP!");
			hasError = true;
		}
		
		if(Util.isEmpty(fornecedor.getDataAbertura())) {
			addActionError("� obrigat�rio preenchimento da Data de Abertura!");
			hasError = true;
		
		} else if (Validacao.validaData(fornecedor.getDataAbertura()) == false)
		{
			addActionError("Data de Abertura informada � inv�lida!");
			hasError = true;
		}
			
		
		if(Validacao.isCNPJ(fornecedor.getCnpj()) == false) {
			addActionError("O CNPJ � inv�lido!");
			hasError = true;
		}
		
		if (Validacao.validaEmail(fornecedor.getEmail()) == false) {
			addActionError("O email informado n�o � v�lido!");
			hasError = true;
		}
		
		List<Fornecedor> fornecedores = null;
		try {
			fornecedores = new FornecedorDAO().buscarTodos();
		} catch (Exception e1) {
			e1.printStackTrace();
		}		
		
		int size = fornecedores.size();
		
		for (int i = 0; i < size; i++)  {
			
			if (fornecedores.get(i).getRazaoSocial().equals(fornecedor.getRazaoSocial()) &&
				!fornecedores.get(i).getId().equals(fornecedor.getId())) {
				
				addActionError("A Raz�o Social informada ja est� cadastrada!");
				hasError = true;
			}
			
			if (fornecedores.get(i).getCnpj().equals(fornecedor.getCnpj()) &&
				!fornecedores.get(i).getId().equals(fornecedor.getId())) {
				
				addActionError("O CNPJ informado ja est� cadastrado!");
				hasError = true;
			}
		}
		
				
		if(hasError)
			return "erro";
		
		try {
			if(fornecedor.getId() == null || "".equals(fornecedor.getId())) {
				new FornecedorBusiness().salvar(fornecedor);
			} else {
				new FornecedorBusiness().atualizar(fornecedor);
			}
		} catch(Exception e) {
			e.printStackTrace();
			addActionError("Erro ao salvar fornecedor. " + e.getMessage());
			return "erro";
		}
		
		
		addActionMessage("Fornecedor cadastrado com sucesso!");
		d = getDataAtual();
		fornecedor = null;
		return "sucesso";
	}
	
	@Action(value = "prepararEdicao", results = {
			@Result(name = "sucesso", location = "/sistema/fornecedor.jsp")
	})
	public String prepararEdicao() {
		try {
			fornecedor = new FornecedorBusiness().buscarPorId(fornecedor.getId());
			d = fornecedor.getDataAbertura();
			return "sucesso";
		} catch (Exception e) {
			return "erro";
		}
	}
	
	@Action(value = "remover", results = {
			@Result(name = "erro", location = "/sistema/fornecedor.jsp"),
			@Result(name = "sucesso", location = "/sistema/fornecedor.jsp")
	})
	public String remover() {
		try {
			new FornecedorBusiness().remover(fornecedor);
			addActionMessage("Fornecedor removido com sucesso!");
			d = getDataAtual();
			fornecedor = null;
			return "sucesso";
		} catch (Exception e) {
			return "erro";
		}
	}
	
	public String getDataAtual() {
		String DATE_FORMAT = "ddMMyyyy";
	    SimpleDateFormat sdf =
	          new SimpleDateFormat(DATE_FORMAT);
	    Calendar c1 = Calendar.getInstance(); // today
	    
		
		return sdf.format(c1.getTime());
	}
	
	public Fornecedor getFornecedor() {
		return fornecedor;
	}
	public void setFornecedor(Fornecedor fornecedor) {
		this.fornecedor = fornecedor;
	}

	public List<Fornecedor> getFornecedores() {
		try {
			return new FornecedorBusiness().buscarTodos();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}