<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib tagdir="/WEB-INF/tags/template" prefix="t" %>

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

<!-- -------------------------------------------------------- --
			$('#btnMensagem').click(function(){
			    $('form').submit();
			});
			$(document).ready(function() {	       
			$("#formPesquisar").submit(  
				    function(){ 			    	
				        $("#divResultado").ajaxStart(function() {  
				               $("#divResultado").text("processando...").show();  
				        });  
				       $("#divResultado").load('clienteBusca.jsp');  
				    }); 
			});


<!-- ------------------------- Botoes de acão novo, excluir ------------------------------- -->


<div class="row">
<br>
   <div class="span2">
    <h4>Cliente PJ</h4>
   </div>
   
<div class="span8">
  <a href="#myModal" role="button" class="btn" data-toggle="modal" data-backdrop="static" data-target="#myModal">
    <i class="icon-plus"></i> Novo Cliente 
  </a>
  <a  href="#myModal" role="button" class="btn" data-toggle="modal" data-backdrop="static" data-target="#myModal">
     <i class="icon-trash "></i> Remover Cliente
  </a>
</div>
   
   
 <!-- ------------------- Input e botao busca  ---------------------- -->
   
   <div class="span2 text-right">
   
    <form class="navbar-form navbar-search pull-left"  method="post" action="${pageContext.request.contextPath}/sistema/cliente/"> 
      
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
							name="cliente.razaoSocial"> <!-- data-provide="typeahead" auto completar    search-query-->
        <button type="submit" class="btn" role="button">
           <i class="icon-search "></i>
        </button>
      </div>
    </form>  
  </div>

</div>
<br>

   <jsp:include page="clienteBusca.jsp"/>

	</jsp:body>
</t:template>