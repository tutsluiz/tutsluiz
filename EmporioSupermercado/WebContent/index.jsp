<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>

<html lang="en">

<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<title>Login - Empório Supermercado</title>
	<link href="${pageContext.request.contextPath}/css/all.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/bootstrap-responsive.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</head>

<body>
	<div class="box-login-center">
					
		<form action="${pageContext.request.contextPath}/login" method="POST">
			<legend>Sistema Prático Empório</legend>
			<s:if test="hasActionErrors()">
				<div class="alert alert-block">
					<button type="button" class="close" data-dismiss="alert">×</button>
					<s:actionerror />
				</div>
			</s:if>			
			<label>Nome de usuário:</label>
			<input type="text" name="usuario.username" class="input-xlarge" placeholder="Digite seu usuário">
			
			<label>Senha:</label>
			<input type="password" name="usuario.password" class="input-xlarge" placeholder="Digite sua senha">
			
			<br/>
			<button type="submit" class="btn">Entrar</button>
			
			<br/>
			<br/>

		</form>
	</div>
</body>

</html>