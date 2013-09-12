<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/template" prefix="t" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>

<t:template>
	<jsp:attribute name="scriptsHeader">
		<script src="${pageContext.request.contextPath}/js/jquery.maskedinput-1.3.js"></script>
	</jsp:attribute>
	
	<jsp:attribute name="scriptsBody">
		<script>
			$('input[name="cliente.cnpj"]').mask('99.999.999/9999-99');
			$('input[name="cliente.cep"]').mask('99.999-999');
			$('input[name="cliente.telefoneCelular"]').mask('(99) 9999-9999');
			$('input[name="cliente.telefone"]').mask('(99) 9999-9999');
			$('input[name="cliente.dataAbertura"]').mask('99/99/9999');
			
		</script>
	</jsp:attribute>
	
	<jsp:body>
		<s:if test="hasActionErrors()">
			<div class="alert alert-block">
				<button type="button" class="close" data-dismiss="alert">×</button>
				<s:actionerror />
			</div>
		</s:if>
		
		<s:if test="hasActionMessages()">
			<div class="alert alert-success">
				<button type="button" class="close" data-dismiss="alert">×</button>
				<s:actionmessage />
			</div>
		</s:if>
		<legend>Cadastro de Cliente Pessoa Jurídica</legend>
		
		<form action="${pageContext.request.contextPath}/sistema/cliente/salvar" method="POST">
			
			
			<div class="row-fluid">
				<div class="span3">
					<input type="hidden" name="cliente.id" value="${cliente.id}"/>
					
					<label>*Razão Social:</label>
					<input type="text" name="cliente.razaoSocial" value="${cliente.razaoSocial}" placeholder="Razão social do cliente">
					
					<label>Nome Fantasia:</label>
					<input type="text" name="cliente.nomeFantasia" value="${cliente.nomeFantasia}" placeholder="Nome fantasia do cliente">
					
					<label>*CNPJ:</label>
					<input type="text" name="cliente.cnpj" value="${cliente.cnpj}" placeholder="Número do CNPJ do cliente">
				</div>
				
				<div class="span3">	
					<label>Endereço:</label>
					<input type="text" name="cliente.logradouro" value="${cliente.logradouro}" placeholder="Nome da rua">
					
					<label>Cidade:</label>
					<input type="text" name="cliente.cidade" value="${cliente.cidade}" placeholder="Nome da cidade">
					
					<label>Estado:</label>
					<input type="text" name="cliente.estado" value="${cliente.estado}" placeholder="Nome do estado">
				</div>
				
				<div class="span3">					
					
					<label>*CEP:</label>
					<input type="text" name="cliente.cep" value="${cliente.cep}" placeholder="Número do CEP">
					
					<label>Telefone:</label>
					<input type="text" name="cliente.telefone" value="${cliente.telefone}" placeholder="Número do telefone">

					<label>Telefone Celular:</label>
					<input type="text" name="cliente.telefoneCelular" value="${cliente.telefoneCelular}" placeholder="Telefone Celular">
				</div>
				
				<div class="span3">
					<label>Email:</label>
					<input type="text" name="cliente.email" value="${cliente.email}" placeholder="E-mail do cliente">
					
					<label>*Data Abertura:</label>
					<input type="text" name="cliente.dataAbertura" value="${d}" readonly="readonly"  placeholder="Data da abertura do cadastro">
					
					<label>Observação:</label>
					<input type="text" name="cliente.observacao" value="${cliente.observacao }" placeholder="Detalhes adicionais sobre o cliente">
				</div>
			</div>
			
			<br/>
			
			<button type="submit" class="btn">Salvar</button>
		</form>
		
		<br>
		
		<form>
			<pg:pager id="p" maxPageItems="10" maxIndexPages="50" export="offset,currentPageNumber=pageNumber" scope="request" 
					url="${pageContext.request.contextPath}/sistema/cliente/">
				<table class="table table-striped table-bordered table-condensed table-hover">
					<thead>
						<tr>
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
								<td valign="middle">${c.razaoSocial}</td>
								<td valign="middle">${c.cnpj}</td>
								<td valign="middle">${c.cep}</td>
								<td valign="middle">${c.dataAbertura}</td>
								<td valign="middle">${c.observacao}</td>
								<td width="21" height="20"><a href="${pageContext.request.contextPath}/sistema/cliente/prepararEdicao?cliente.id=${c.id}"><img src="${pageContext.request.contextPath}/img/icone editar.jpg"></a></td>
								<td width="21" height="20"><a href="${pageContext.request.contextPath}/sistema/cliente/remover?cliente.id=${c.id}"><img src="${pageContext.request.contextPath}/img/icone excluir.jpg"></a></td>
							</tr>
							</pg:item>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr align="center">
							<td colspan="12">
								<pg:index>
									<div class="pagination">
										<ul>
											<li><pg:prev><a href="${pageUrl}">Anterior</a></pg:prev></li>
											<li><pg:pages><a href="${pageUrl}">${pageNumber}</a></pg:pages></li>
											<li><pg:next><a href="${pageUrl}">Próximo</a></pg:next></li>
										</ul>
									</div>
								</pg:index>
							</td>
						</tr>
					</tfoot>
				</table>
			</pg:pager>
		</form>
	</jsp:body>
</t:template>