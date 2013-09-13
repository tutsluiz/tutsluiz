<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags/template" prefix="t"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>

<t:template>
	<jsp:attribute name="scriptsHeader">
		<script
			src="${pageContext.request.contextPath}/js/jquery.maskedinput-1.3.js">
		</script>
	</jsp:attribute>

	<jsp:attribute name="scriptsBody">	
		<script type="text/javascript">
			$('input[name="cliente.cnpj"]').mask('99.999.999/9999-99');
			$('input[name="cliente.cep"]').mask('99.999-999');
			$('input[name="cliente.telefoneCelular"]').mask('(99) 9999-9999');
			$('input[name="cliente.telefone"]').mask('(99) 9999-9999');
			$('input[name="cliente.dataAbertura"]').mask('99/99/9999');

		</script>
	</jsp:attribute>



	<jsp:body>

<!-- ------------------------- Botoes de acão novo, excluir --------------------------------->

<div class="row">
<br>
   <div class="span2">
    <h4>Cliente PJ</h4>
   </div>
   
<div class="span8">
  <a href="#responsive" role="button" class="btn" data-toggle="modal" data-backdrop="static" data-target="#responsive">
    <i class="icon-plus"></i> Novo Cliente 
  </a>
  <a href="#myModal" role="button" class="btn" data-toggle="modal" data-backdrop="static" data-target="#myModal">
     <i class="icon-trash "></i> Remover Cliente
  </a>
</div>
   
   
 <!-- ------------------- Input e botao busca  ------------------------>
   
   <div class="span2 text-right">
   
    <form class=" navbar-form navbar-search navbar-form pull-left" action="${pageContext.request.contextPath}/sistema/cliente" method="post"> 
      
           <!--  MSG DE ERRO DE VALIDAÇÃO DO FORMULARIO -->
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
      
      <div class="input-append">
        <input type="text" class="span3" placeholder="Razão Social"
							name="cliente.razaoSocial" id="buscaCliente"> <!-- data-provide="typeahead" auto completar    search-query-->
       <button  type="submit" class="btn" >Buscar</button>
      </div>
    </form>  
  </div>

</div>
<br>


<!-- ------------------- js bootstrap modal  ------------------------

			var c = document.getElementById("chkId");
			var txt = document.getElementById("txtName");
			var hrf = document.getElementById("forGrid");

			if(c !== undefined) {
			    c.onclick = function(event) {
			        txt.value = !this.checked;
			    }
			}


			$('#InfroTextSubmit').click(function(){
			    
			    if ($('#title').val()==="") {
			      // invalid
			      $('#title').next('.help-inline').show();
			      return false;
			    }
			    else {
			      // submit the form here
			      // $('#InfroText').submit();
			      
			      return true;
			    }
			  
			      
			      
			});

				<script type="text/javascript">
   $('#myModal').modal({
        backdrop: true,
        keyboard: true,
        show: false
    }).css({
        width: 'auto',
        'margin-left': function () {
            return -($(this).width() / 2);
        }
    });
</script>



------------------------------------------------------------------------->


<!-- --------------- modal ------------------------------------ --	
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
     
     <!--  MSG DE ERRO DE VALIDAÇÃO DO FORMULARIO --
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
    <!-- ------------------------------------------ --

  <div class="modal-header">
    <!--  Comentado para retirar fechar do modal pelo X
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    --
    <h3 id="myModalLabel">Cliente Pessoa Juridica</h3>
  </div>
  
  <div class="modal-body">
  
  			<form id="formCliente" class=""
					action="${pageContext.request.contextPath}/sistema/cliente/salvar"
					method="POST"> 
  			
				<div class="span3">
					<input type="hidden" name="cliente.id" value="${cliente.id}" />
					
					<label>*Razão Social:</label>
					<input type="text" name="cliente.razaoSocial"
							value="${cliente.razaoSocial}"
							placeholder="Razão social do cliente">
					
					<label>Nome Fantasia:</label>
					<input type="text" name="cliente.nomeFantasia"
							value="${cliente.nomeFantasia}"
							placeholder="Nome fantasia do cliente">
					
					<label>*CNPJ:</label>
					<input type="text" name="cliente.cnpj" value="${cliente.cnpj}"
							placeholder="Número do CNPJ do cliente">
				</div>
				
				<div class="span3">	
					<label>Endereço:</label>
					<input type="text" name="cliente.logradouro"
							value="${cliente.logradouro}" placeholder="Nome da rua">
					
					<label>Cidade:</label>
					<input type="text" name="cliente.cidade" value="${cliente.cidade}"
							placeholder="Nome da cidade">
					
					<label>Estado:</label>
					<input type="text" name="cliente.estado" value="${cliente.estado}"
							placeholder="Nome do estado">
				</div>
				
				<div class="span3">					
					
					<label>*CEP:</label>
					<input type="text" name="cliente.cep" value="${cliente.cep}"
							placeholder="Número do CEP">
					
					<label>Telefone:</label>
					<input type="text" name="cliente.telefone"
							value="${cliente.telefone}" placeholder="Número do telefone">

					<label>Telefone Celular:</label>
					<input type="text" name="cliente.telefoneCelular"
							value="${cliente.telefoneCelular}" placeholder="Telefone Celular">
				</div>
				
				<div class="span3">
					<label>Email:</label>
					<input type="text" name="cliente.email" value="${cliente.email}"
							placeholder="E-mail do cliente">
					
					<label>*Data Abertura:</label>
					<input type="text" name="cliente.dataAbertura" value="${d}"
							readonly="readonly" placeholder="Data da abertura do cadastro">
					
					<label>Observação:</label>
					<input type="text" name="cliente.observacao"
							value="${cliente.observacao }"
							placeholder="Detalhes adicionais sobre o cliente">
				</div>

			
			<br />
			
</form>
  </div>
  
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Fechar</button>
    <button class="btn btn-primary" type="submit">Salvar</button>
  </div>

</div>-->

<!--   ----------------------------- Grid  ----------------------------------------->
        
		<form action="${pageContext.request.contextPath}/sistema/cliente">
			<pg:pager id="p" maxPageItems="10" maxIndexPages="50"
				export="offset,currentPageNumber=pageNumber" scope="request"
				url="${pageContext.request.contextPath}/sistema/cliente/">
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
							    <td valign="middle"><input type="checkbox" value="<c:out value="${id}"/>" />
            					<td valign="middle">
            					    <a href="${pageContext.request.contextPath}/sistema/cliente/prepararEdicao?cliente.id=${c.id}"
										 role="button">${c.razaoSocial}
								    </a></td>
								<td valign="middle">${c.cnpj}</td>
								<td valign="middle">${c.cep}</td>
								<td valign="middle">${c.dataAbertura}</td>
								<td valign="middle">${c.observacao}</td>
                                <td width="21" height="20">
                                    <a href="${pageContext.request.contextPath}/sistema/cliente/remover?cliente.id=${c.id}">
                                    <img src="${pageContext.request.contextPath}/img/icone excluir.jpg">
										<c:out value="${id}"/>
								    </a>
							    </td>
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
								</pg:index>
							</td>
						</tr>
					</tfoot>
				</table>
			</pg:pager>
		</form>

	</jsp:body>
</t:template>