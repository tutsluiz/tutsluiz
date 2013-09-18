<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib tagdir="/WEB-INF/tags/template" prefix="t" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>

	<!--   ----------------------------- Grid  ----------------------------------------->
	<form>
		<pg:pager id="p" maxPageItems="10" maxIndexPages="50"
			export="offset,currentPageNumber=pageNumber" scope="request"
			url="${pageContext.request.contextPath}/sistema/cliente">
			<table class="table table-striped table-condensed table-hover">
				<thead>
					<tr>
						<th><input type="checkbox" value=""></th>
						<th>Razão Social</th>
						<th>CNPJ</th>
						<th>CEP</th>
						<th>Data Abertura</th>
						<th>Observação</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="c" items="${clientes}">
						<pg:item>
							<tr>
								<td valign="middle"><input type="checkbox"
									value="<c:out value="${id}"/>" />
								<td valign="middle"><a
									href="${pageContext.request.contextPath}/sistema/cliente/prepararEdicao?cliente.id=${c.id}"
									role="button"
									data-toggle="modal"
									data-target="#">${c.razaoSocial} </a></td>
								<td valign="middle">${c.cnpj}</td>
								<td valign="middle">${c.cep}</td>
								<td valign="middle">${c.dataAbertura}</td>
								<td valign="middle">${c.observacao}</td>
								<td width="21" height="20"><a
									href="${pageContext.request.contextPath}/sistema/cliente/remover?cliente.id=${c.id}">
										<img
										src="${pageContext.request.contextPath}/img/icone excluir.jpg">
										<c:out value="${id}" />
								</a></td>
							</tr>
						</pg:item>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr align="center">
						<td colspan="12"><pg:index>
								<div class="pagination">

									<ul>
										<li><pg:prev>
												<a href="${pageUrl}">Anterior</a>
											</pg:prev></li>
										<li><pg:pages>
												<a href="${pageUrl}">${pageNumber}</a>
											</pg:pages></li>
										<li><pg:next>
												<a href="${pageUrl}">Próximo</a>
											</pg:next></li>
									</ul>
								</div>
							</pg:index></td>
					</tr>
				</tfoot>
			</table>
		</pg:pager>
	</form>  
</body>
</html>