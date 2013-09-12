<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ attribute name="scriptsHeader" fragment="true" %>
<%@ attribute name="scriptsBody" fragment="true" %>
<!DOCTYPE html>

<html lang="en" >

<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<title> Pratico Emporio </title>
	<link href="${pageContext.request.contextPath}/css/all.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/bootstrap-responsive.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-1.7.1.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
	<jsp:invoke fragment="scriptsHeader" />
</head>

<body>
	<div class="container-fluid">
	<div class="back_img"><img src="${pageContext.request.contextPath}/img/pratico3.jpg" width="100%"/></div>
		<div class="row-fluid">
			<div class="navbar navbar-static" id="navbar-example">
				<div class="navbar-inner">
					<div style="width: auto;" class="container">
						<a href="${pageContext.request.contextPath}/sistema/inicio.jsp" class="brand">Empório Supermercado</a>
						<ul role="navigation" class="nav">
							<li class="dropdown">
								<a data-toggle="dropdown" class="dropdown-toggle" role="button" href="#" id="drop1">Cadastros <b class="caret"></b></a>
								<ul aria-labelledby="drop1" role="menu" class="dropdown-menu">
									<li><a href="${pageContext.request.contextPath}/sistema/cliente/" tabindex="-1">Cliente PJ</a></li>
									<li><a href="${pageContext.request.contextPath}/sistema/fornecedor/" tabindex="-1">Fornecedor</a></li>
									<li><a href="${pageContext.request.contextPath}/sistema/mercadoria/" tabindex="-1">Mercadoria</a></li>
								</ul>
							</li>
<!-- 							<li class="dropdown"> -->
<!-- 								<a data-toggle="dropdown" class="dropdown-toggle" role="button" id="drop2" href="#">Relatórios <b class="caret"></b></a> -->
<!-- 								<ul aria-labelledby="drop2" role="menu" class="dropdown-menu"> -->
<!-- 									<li><a href="#" tabindex="-1">Um relatório qualquer</a></li> -->
<!-- 								</ul> -->
<!-- 							</li> -->
						</ul>
						<ul class="nav pull-right">
							<li class="dropdown" id="fat-menu">
								<a class="dropdown-toggle" role="button" id="drop3" href="${pageContext.request.contextPath}/logout">Sair</b></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row-fluid">
			<div class="span12 box">
				<jsp:doBody/>
			</div>
		</div>
	</div>
	
	<jsp:invoke fragment="scriptsBody" />
</body>

</html>