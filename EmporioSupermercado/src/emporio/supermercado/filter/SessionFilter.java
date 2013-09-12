package emporio.supermercado.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.opensymphony.xwork2.ActionContext;

import emporio.supermercado.util.Constantes;

public class SessionFilter implements Filter {
	
	public SessionFilter() {
		
	}
	
	public void destroy() {
		
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		res.setHeader("Expires", "Wed, 31 Dec 1969 21:00:00 GMT");
		res.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		res.addHeader("Cache-Control", "post-check=0, pre-check=0");
		res.setHeader("Pragma", "no-cache");
		
		if(ActionContext.getContext().getSession().get(Constantes.USUARIO_LOGADO) == null) {
			res.sendRedirect(req.getContextPath() + "/index.jsp");
		} else {
			chain.doFilter(request, response);
		}
	}
	
	public void init(FilterConfig fConfig) throws ServletException {
		
	}
}