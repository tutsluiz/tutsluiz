<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ attribute name="scriptsHeader" fragment="true" %>
<%@ attribute name="scriptsBody" fragment="true" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/template" prefix="t" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>

<!DOCTYPE html>

<html lang="en" >
	<head>
		<meta charset="utf-8">

		<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
		Remove this if you use the .htaccess -->
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />

		<title>Pratico Emporio </title>
		<meta name="description" content="">
		<meta name="author" content="Arthur Luiz">

		<meta name="viewport" content="width=device-width; initial-scale=1.0">

		<!-- Replace favicon.ico & apple-touch-icon.png in the root of your domain and delete these references -->
		<link rel="shortcut icon" href="/favicon.ico">
		<link rel="apple-touch-icon" href="/apple-touch-icon.png">
		
		<!-- Link CSS do bootstrap -->

        <link href="${pageContext.request.contextPath}/css/bootstrap-responsive.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/css/all.css" rel="stylesheet">
		
		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
	    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.1.js"></script>
	    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
	    

        
        

	</head>

	<body>
	
	<!--  ************************* Topo da pagina (logo e logout) **********************************  -->	
		
		<div class="container-fluid">
           <div class="row-fluid" id="topo">
           	 <div class="span4"><img src="${pageContext.request.contextPath}/img/pratico.gif"/></div><hr>
           	    <div class="span8">						
				   		<ul class="nav pull-right">
							<li class="dropdown" id="fat-menu">
								<a class="dropdown-toggle" role="button" id="drop3" href="${pageContext.request.contextPath}/logout">Sair</a>
							</li>
						</ul>
			    </div>
        </div>
           
           
	<!--  ************************* Menu de Navegação **********************************  -->
 
<div class="tabbable"> <!-- Only required for left/right tabs -->
  <ul role="navigation" class="nav nav-tabs">
    <li class="active"><a href="${pageContext.request.contextPath}/sistema/inicio.jsp" data-toggle="corpo"><i class="icon-home"></i></a></li>
    					<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#"> Cadastros<b class="caret"> </b></a>					
							   <ul class="dropdown-menu">
								   <!-- links -->
								  <li>
								     <a href="${pageContext.request.contextPath}/sistema/cliente/" data-toggle="corpo"> Cliente PJ </a>
					              </li>
					              <li>
						             <a href="${pageContext.request.contextPath}/sistema/fornecedor/" data-toggle="corpo"> Fornecedor </a>
					              </li>
					              <li>
						             <a href="${pageContext.request.contextPath}/sistema/mercadoria/" data-toggle="corpo"> Mercadoria </a>
					              </li>
							</ul>
						</li>
					
                   <li class="dropdown">
						<a class="dropdown-toggle"data-toggle="dropdown"
						href="#"> Cadastros<b class="caret"> </b></a>
						<ul class="dropdown-menu">
							<!-- links -->
							<li>
								<a href="${pageContext.request.contextPath}/sistema/cliente">Sub-menu 01</a>
							</li>
							<li>
								<a href="#">Sub-menu 02</a>
							</li>
							<li>
								<a href="#">Sub-menu 03</a>
							</li>
						</ul>
					</li>
					
  </ul>
  </div>
  <!--  ----------------------- conteudo dos menus ------------------------------------- -->
  
  
  <div class="navbar">
  <div class="navbar-inner">
      <div class="nav-collapse collapse" id="corpo" >
        <!-- .nav, .navbar-search, .navbar-form, etc -->   
        
          <jsp:doBody />
          
      </div>
 
    </div>
  </div>
</div>
	

<!-- ------------------------------------------ roda pé ------------------------------------- -->
			<footer>
				<p>
					&copy; Copyright  by Arthur Luiz
				</p>
			</footer>
			
<!------------------------------------- Carregamento do javascript depois de carregar toda a pagina (Boas praticas)--> 

		<jsp:invoke fragment="scriptsHeader"/>
        <jsp:invoke fragment="scriptsBody" />
        
	</body>
</html>
