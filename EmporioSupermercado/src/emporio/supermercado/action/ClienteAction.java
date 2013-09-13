package emporio.supermercado.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;

import emporio.supermercado.business.ClienteBusiness;
import emporio.supermercado.dao.ClienteDAO;
import emporio.supermercado.domain.Cliente;
import emporio.supermercado.util.Util;
import emporio.supermercado.util.Validacao;

@Namespace("/sistema/cliente")
public class ClienteAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	
	private Cliente cliente = new Cliente();
	private String d;
	private List<Cliente> clientes;
	
	public ClienteAction() {
		super();
	}
	
	
	@Actions(value = {
		@Action(value = "/sistema/cliente", results = {
				@Result(name = "ok", location = "/sistema/cliente.jsp")
		}),
		@Action(value = "/sistema/cliente/", results = {
				@Result(name = "ok", location = "/sistema/cliente.jsp")
		})
	})
	
	
	public String init(){
		String DATE_FORMAT = "ddMMyyyy";
	    SimpleDateFormat sdf =
	          new SimpleDateFormat(DATE_FORMAT);
	    Calendar c1 = Calendar.getInstance(); // today    
		d = sdf.format(c1.getTime());    
		return "ok";
	}
	
	public String getDataAtual() {
		String DATE_FORMAT = "ddMMyyyy";
	    SimpleDateFormat sdf =
	          new SimpleDateFormat(DATE_FORMAT);
	    Calendar c1 = Calendar.getInstance(); // today
	    
		
		return sdf.format(c1.getTime());
	}

	
/************************** SALVAR ***************************/	
	
	@Action(value = "salvar", results = {
			@Result(name = "erro", location = "/sistema/cliente.jsp"),
			@Result(name = "sucesso", location = "/sistema/cliente.jsp")
	})
	
	public String salvar() {
		Boolean hasError = false;
		
		if(Util.isEmpty(cliente.getRazaoSocial())) {
			addActionError("É obrigatório preenchimento da Razão Social!");
			hasError = true;
		}
		
		if(Util.isEmpty(cliente.getCnpj())) {
			addActionError("É obrigatório preenchimento do CNPJ!");
			hasError = true;
		}
		
		if(Util.isEmpty(cliente.getCep())){
			addActionError("É obrigatório preenchimento do CEP!");
			hasError = true;
		
		} 
		
		if(Validacao.isCNPJ(cliente.getCnpj()) == false) {
			addActionError("O CNPJ é inválido!");
			hasError = true;
		}
				
		if(Util.isEmpty(cliente.getDataAbertura())) {
			addActionError("É obrigatório preenchimento da Data de Abertura!");
			hasError = true;
		
		} else if (Validacao.validaData(cliente.getDataAbertura()) == false)
		{
			addActionError("Data de Abertura informada é inválida!");
			hasError = true;
		}
				
		if (Validacao.validaEmail(cliente.getEmail()) == false) {
			addActionError("O email informado não é válido!");
			hasError = true;
		}
		
		try {
			clientes = new ClienteDAO().buscarTodos();
		} catch (Exception e1) {
			e1.printStackTrace();
		}		
		
		int size = clientes.size();
		
		for (int i = 0; i < size; i++)  {
			
			if (clientes.get(i).getRazaoSocial().equals(cliente.getRazaoSocial()) &&
				!clientes.get(i).getId().equals(cliente.getId())) {
				
				addActionError("A Razão Social informada ja está cadastrada!");
				hasError = true;
			}
			
			if (clientes.get(i).getCnpj().equals(cliente.getCnpj()) &&
				!clientes.get(i).getId().equals(cliente.getId())) {
				
				addActionError("O CNPJ informado ja está cadastrado!");
				hasError = true;
			}
		}
		
		if(hasError)
			return "erro";
		
		try {
			if(cliente.getId() == null || "".equals(cliente.getId())) {
				new ClienteBusiness().salvar(cliente);
			} else {
				new ClienteBusiness().atualizar(cliente);
			}
		} catch(Exception e) {
			e.printStackTrace();
			addActionError("Erro ao salvar cliente. " + e.getMessage());
			return "erro";
		}
		
		
		addActionMessage("Cliente cadastrado com sucesso!");
		d = getDataAtual();
		cliente = null;
		return "sucesso";
	}

/***************************** PREPARA EDIÇÂO ******************************/	
	
	@Action(value = "prepararEdicao", results = {
			@Result(name = "sucesso", location = "/sistema/cliente.jsp")
	})
	
	public String prepararEdicao() {
		try {
			cliente = new ClienteBusiness().buscarPorId(cliente.getId());
			d = cliente.getDataAbertura();
			return "sucesso";
		} catch (Exception e) {
			return "erro";
		}
	}
	
/**************************** REMOVER ***************************************/	
	
	@Action(value = "remover", results = {
			@Result(name = "erro", location = "/sistema/cliente.jsp"),
			@Result(name = "sucesso", location = "/sistema/cliente.jsp")
	})
	public String remover() {
		try {
			new ClienteBusiness().remover(cliente);
			addActionMessage("Cliente removido com sucesso!");
			d = getDataAtual();
			return "sucesso";
		} catch (Exception e) {
			return "erro";
		}
	}
	
/*************************** Busca Clientes  *********************************/
	
	@Action(value = "buscar", results = {
			@Result(name = "sucesso", location = "/sistema/cliente.jsp"),
			@Result(name="erro", location="/sistema/cliente.jsp")
	}) 

	public String buscar() {
		try {
			new ClienteBusiness().buscarPorRazaoSocial(cliente.getRazaoSocial());
			addActionMessage("Busca realizada com sucesso!");
			return "sucesso";
		} catch (Exception e) {
			addActionError("Falha ao buscar cliente.");
			return "erro";
		}
	}
	
/*************************** GETTERS E SETTERS *******************************/	
	
	public String getD() {
		return d;
	}

	public void setD(String d) {
		this.d = d;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public void setClientes(List<Cliente> clientes) {
		this.clientes = clientes;
	}

	public Cliente getCliente() {
		return cliente;
	}
	
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	

	public List<Cliente> getClientes() {
		try {
		
		//if(cliente.getRazaoSocial().equals("") || cliente.getRazaoSocial().equals(null) ){
		//    return new ClienteBusiness().buscarTodos();
		//}else{
			return new ClienteBusiness().buscarTodos();	
	//	}

		} catch (Exception e) {
			e.printStackTrace();
			return null;	
		}
	}
}

