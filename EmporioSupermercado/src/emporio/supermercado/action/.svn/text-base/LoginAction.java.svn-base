package emporio.supermercado.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import emporio.supermercado.business.UsuarioBusiness;
import emporio.supermercado.domain.Usuario;
import emporio.supermercado.util.Constantes;
import emporio.supermercado.util.Util;

public class LoginAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	
	private Usuario usuario;
	
	@Override
	@Action(results = {
			@Result(name = "erro", location = "/index.jsp"),
			@Result(name = "sucesso", location = "/sistema/inicio.jsp", type = "redirect")
	})
	public String execute() throws Exception {
		if("".equals(usuario.getUsername()) || usuario.getUsername() == null) {
			addActionError("Informe o nome de usuário");
			return "erro";
		}
		
		if("".equals(usuario.getPassword()) || usuario.getPassword() == null) {
			addActionError("Informe a senha");
			return "erro";
		}
		
		Usuario usuarioCadastrado = new UsuarioBusiness().buscarPorUsername(usuario.getUsername());
		
		if(usuarioCadastrado == null || !usuarioCadastrado.getPassword().equals(Util.encripta(usuario.getPassword()))) {
			addActionError("Login inválido");
			return "erro";
		}
		
		ActionContext.getContext().getSession().put(Constantes.USUARIO_LOGADO, usuario);
		
		return "sucesso";
	}

	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
}