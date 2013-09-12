package emporio.supermercado.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import emporio.supermercado.util.Constantes;

public class LogoutAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	
	@Override
	@Action(results = {
			@Result(name = "erro", location = "/sistema/inicio.jsp"),
			@Result(name = "sucesso", location = "/index.jsp", type = "redirect")
	})
	public String execute() throws Exception {
		ActionContext.getContext().getSession().remove(Constantes.USUARIO_LOGADO);
		
		return "sucesso";
	}
}