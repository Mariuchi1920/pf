<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/style.css">
<head>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" >	

	<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/font-awesome/css/fontawesome.min.css">
	<link href="https://fonts.googleapis.com/css?family=Raleway:100,300,400,500" rel="stylesheet">
	<link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/CSS/estilos.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/style.css"> 

<title>Menu Usuario</title>
<style type="text/css">
	.fondo{
	background: url('${pageContext.request.contextPath}/imagen/bannerLigaEfa.jpg');
	background-position: center;
	background-size: cover; 
	height: 50vh;
	
}
	</style>

</head>
<div class="container">
	
		<jsp:include page="/WEB-INF/cabecera.jsp" />
	
	
	<!-- slider -->
	<div class="container fondo">
		<div class="container">
			<!-- <h1>Bienvenidos a la Gestion de la Liga Efa</h1> -->
		</div>
	</div>
	<!-- slider -->

	
<div class= "container Pie">
			<div id="Pie">
	 <div id="Pie">
		<jsp:include page="/WEB-INF/pie.jsp" />

	 
	</div>
		</div>
	
		</div>
		<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>