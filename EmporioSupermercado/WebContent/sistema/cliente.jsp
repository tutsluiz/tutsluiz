<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib tagdir="/WEB-INF/tags/template" prefix="t" %>

<!DOCTYPE html>
<t:template >
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
			
	    <script type="text/javascript">	

	    
	    var $modal = $('#modalCliente');
	    
		//	function salvar(){

		  //  	  $('#modalCliente').modal('show');
		 //   	  alert("SALVO!");	  
         //   };
		    $("#btn-salvar").click(function(e){
		    	  e.preventDefault();

			      alert("Antes do form");
			      document.getElementById("formCliente").submit();
				  alert("Depois do form");
				//  $('#modalCliente').modal('show');
				 // $("#modalCliente").removeData ('modal');
                  $('#modalCliente').modal('refresh');
		      });

		</script>
	</jsp:attribute>	
<jsp:body>


<!-- --------------------------------------------- Abre a div do submenu cliente PJ ----------------------------------------------------- -->

<div class="row">
<br>
   <div class="span3">
    <h4>Cliente Pessoa Juridica</h4>
   </div>
   
<div class="span8">
  <a href="#modalCliente" role="button" class="btn"  data-toggle="modal">
    <i class="icon-plus"></i> Novo Cliente 
  </a>
 
  <a href="#" role="button" class="btn">
     <i class="icon-trash "></i> Remover Cliente
  </a>
</div>

   
   
 <!-- ------------------- Input e botao busca  ---------------------- -->
   
   <div class="span2 text-right">
      <form class="navbar-form navbar-search pull-left" method="post"
					action="${pageContext.request.contextPath}/sistema/cliente/"> 
      
   <div class="input-append">
        <input type="text" class="span3" placeholder="Razão Social"
							name="cliente.razaoSocial">
        
        <button type="submit" class="btn" role="button">
           <i class="icon-search "></i>
        </button>
   </div>
    </form>  
  </div>

</div>
<br>

<!-- --------------------------- Formulario modal  ---------------------------------------------------->

<div id="modalCliente" class="modal container hide fade" tabindex="-1"  >

  <div class="modal-header">
  		        
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
  
    <h3>Responsive</h3>
  </div>
  <div class="modal-body">
		
		<form id="formCliente" class="form-wizard" action="${pageContext.request.contextPath}/sistema/cliente/salvar" method="POST">

                 <div class="span4">
                 	<input type="hidden" name="cliente.id" value="${cliente.id}"/>
                 		
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
								
				    <label>*Data Abertura:</label>
					<input type="text" name="cliente.dataAbertura" value="${d}"
							readonly="readonly" placeholder="Data da abertura do cadastro">

				</div>
				
			    <div class="span4">
			        
			        <label>Endereço:</label>
					<input type="text" name="cliente.logradouro"
								value="${cliente.logradouro}" placeholder="Nome da rua">
			
					<label>Cidade:</label>
					<input type="text" name="cliente.cidade" value="${cliente.cidade}"
								placeholder="Nome da cidade">
					
					<label>Estado:</label>
					<input type="text" name="cliente.estado" value="${cliente.estado}"
								placeholder="Nome do estado">			
					
					<label>*CEP:</label>
					<input type="text" name="cliente.cep" value="${cliente.cep}"
								placeholder="Número do CEP">
					
                </div>
                
                <div class="span4">
                
                	<label>Telefone:</label>
					<input type="text" name="cliente.telefone"
								value="${cliente.telefone}" placeholder="Número do telefone">
                
					<label>Telefone Celular:</label>
					<input type="text" name="cliente.telefoneCelular"
								value="${cliente.telefoneCelular}"
								placeholder="Telefone Celular">

					<label>Email:</label>
					<input type="text" name="cliente.email" value="${cliente.email}"
								placeholder="E-mail do cliente">
					
					
					<label>Observação:</label>
					<input type="text" name="cliente.observacao"
								value="${cliente.observacao }"
								placeholder="Detalhes adicionais sobre o cliente">
                </div>
			<br />
            </form>
</div>
  
  <div class="modal-footer">
    <button id="btn-close" type="button" data-dismiss="modal" class="btn">Close</button>
    <button id="btn-salvar" type="button" class="btn btn-primary refresh-me" data-toggle="modal" onclick="salvar()">Save changes</button>
  </div>
</div>


<!-- ---------------------- Include do formulario que gera a grid resultado da busca todos ou com paramentro ----------------------------- -->

   <jsp:include page="clienteBusca.jsp"/>
<!--  ------------------------------------------------------------------------------------------------------------------------------------ -->
	</jsp:body>
</t:template>