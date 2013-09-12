<%@page import="emporio.supermercado.domain.Fornecedor"%>
<%@page import="java.util.List"%>
<%@page import="emporio.supermercado.dao.FornecedorDAO"%>
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
			$('input[name="mercadoria.dataCadastro"]').mask('99/99/9999');
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
		
		<form action="${pageContext.request.contextPath}/sistema/mercadoria/salvar" method="POST">
			<legend>Cadastro de Mercadoria</legend>
			
			<div class="row">
				<div class="span3">
					<input type="hidden" name="mercadoria.id" value="${mercadoria.id}"/>
					
					<label>*Código de Barras:</label>
					<input type="text" name="mercadoria.codigo" value="${mercadoria.codigo}" placeholder="Codigo da mercadoria">
					
					<label>*Nome:</label>
					<input type="text" name="mercadoria.nome" value="${mercadoria.nome}" placeholder="Nome da mercadoria">
					
					<label>Departamento:</label>
					<input type="text" name="mercadoria.departamento" value="${mercadoria.departamento}" placeholder="Departamento da mercadoria">
				</div>
				
				<div class="span3">	
					<label>Artigo:</label>
					<input type="text" name="mercadoria.artigo" value="${mercadoria.artigo}" placeholder="Tipo de artigo">
					
					<label>Marca:</label>
					<input type="text" name="mercadoria.marca" value="${mercadoria.marca}" placeholder="Marca da mercadoria">
					
					<label>*Estoque:</label>
					<input type="text" name="mercadoria.estoque" value="${mercadoria.estoque}" placeholder="Quantidade no estoque">
				</div>
				
				<div class="span3">					
					<label>*Preço de Custo:</label>
					<input type="text" name="mercadoria.precoCusto" value="${mercadoria.precoCusto}" placeholder="Preço de custo">
					
					<label>*Preço de Venda:</label>
					<input type="text" name="mercadoria.precoVenda" value="${mercadoria.precoVenda}" placeholder="Preco de venda">
					
					<label>*Data de Cadastro:</label>
					<input type="text" name="mercadoria.dataCadastro" value="${d}" readonly="readonly" placeholder="Data de cadastro">
				</div>
				
				<div class="span3">
					<label>Peso:</label>
					<input type="text" name="mercadoria.peso" value="${mercadoria.peso}" placeholder="Peso da mercadoria">
					
					<label>*Descrição Curta:</label>
					<input type="text" name="mercadoria.descricaoCurta" value="${mercadoria.descricaoCurta}" placeholder="Descrição curta">
					
										
					<label>Fornecedores:</label>
					<select name="mercadoria.descricaoLonga">
						<option value="${mercadoria.descricaoLonga}" SELECTED>${mercadoria.descricaoLonga}</option>
      					<c:forEach var="item" items="${fornecedores}">
      						<option value="${item.razaoSocial}">${item.razaoSocial}</option>
      					</c:forEach>
    				</select>  

				</div>
			</div>
			
			<br/>
			
			<button type="submit" class="btn">Salvar</button>
		</form>
		
		<br>
		
		<form>
			<pg:pager id="p" maxPageItems="5" maxIndexPages="20" export="offset,currentPageNumber=pageNumber" scope="request" 
					url="${pageContext.request.contextPath}/sistema/mercadoria/">
				<table class="table table-striped table-bordered table-condensed table-hover">
					<thead>
						<tr>
							<th>Código</th>
							<th>Nome</th>
							<th>Preço de Custo</th>
							<th>Preço de Venda</th>
							<th>Estoque</th>
							<th>Descrição Curta</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="m" items="${mercadorias}">
							<pg:item>
							<tr>
								<td>${m.codigo}</td>
								<td>${m.nome}</td>
								<td>${m.precoCusto}</td>
								<td>${m.precoVenda}</td>
								<td>${m.estoque}</td>
								<td>${m.descricaoCurta}</td>
								<td width="21" height="20"><a href="${pageContext.request.contextPath}/sistema/mercadoria/prepararEdicao?mercadoria.id=${m.id}"><img src="${pageContext.request.contextPath}/img/icone editar.jpg"></a></td>
								<td width="21" height="20"><a href="${pageContext.request.contextPath}/sistema/mercadoria/remover?mercadoria.id=${m.id}"><img src="${pageContext.request.contextPath}/img/icone excluir.jpg"></a></td>
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