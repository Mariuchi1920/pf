<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.Institucion"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Nueva Categoria</title>
	<link rel="stylesheet" type="text/css" href="CSS/style.css">
	<script type="text/javascript">
	function pregunta() {
		if(confirm("Estas seguro de registrar una nueva categoria?")){
			Document.categoriaNueca.submit();
			
		};
		}
	
	</script>
</head>
<body>
	<div id="cabecera">
					<div id="Logo"><img src="imagen/logo_header.png"></div>
					<div id="usuario">
					
					Bienvenido <%= session.getAttribute("usuario") %>
					<a href="cerrarSesion.jsp">cerrar Sesion</a>
					</div>
		</div>
		<div id="menu">
		
			<ul class="nav">
				<li><a href="#">Torneo</a>
					<ul>
						<li><a href="maestroTorneo.jsp">Maestro de torneo</a></li>
						<li><a href="nuevoTorneo.jsp">Nuevo Torneo</a></li>
						<li><a href="#">Listar</a></li>	

					</ul>
					</li>
				<li><a href="#">Categoria</a>
				<ul>
						<li><a href="maestroCategoria.jsp">Maestro Categorias</a></li>
						<li><a href="nuevaCategoria.jsp">Nueva Categoria</a></li>
						<li><a href="#">Listar</a></li>	

					</ul>
				</li>
				<li><a href="#">Jugadores</a></li>
				<li><a href="#">Institucion</a></li>
				<li><a href="#">Partido</a></li>
				
			</ul>
			
		</div>
		<div id="contenido">
			
			
			<form action="regCategoria" method="post" name="categoriaNueva">
			<table border="4" align="center">
				<tr><td colspan="2">Nueva Categoria</td></tr>
				<tr><td>Id Categoria:</td> <td><input type="text" name="idCategoria" id="idCategoria"/></td> </tr>
				<tr><td>Descripcion:</td><td><input type="text" name="descripcion"id="descripcion"/></td></tr>
				<tr><td>Estado:</td><td><input type="text" name="estado"id="estado"/></td></tr>
				<tr><td><input type= "submit" value="Registrar Categoria" onclick="pregunta()"></td></tr>
				
			</table>
			</form>

		</div>
		<div id="Pie">
			<div id="LogoPie"><img src="imagen/logo_footer.jpg"></div>
			<p>La EFA es una Agrupaci�n de Escuelas de F�tbol creada por las instituciones fundadoras y cuyo objetivo final es:

"QUE TODOS LOS NI�OS Y JOVENES SE DIVIERTAN JUGANDO AL F�TBOL SANAMENTE Y CON ALEGR�A,
SIN PRESIONES DE NINGUNA NATURALEZA, SIENDO ELLOS LOS PROTAGONISTAS PRINCIPALES".

Los adultos que integran la EFA. (Delegados, T�cnicos, padres y p�blico en general),
solamente ser�n colaboradores para lograr el fin mencionado en el p�rrafo anterior.
</p>
			<div id="LogoFondoPag"><img src="imagen/firma_efa.jpg"></div>
			<h2>esto es el pie de pagina</h2>

		</div>
	</div>
</body>
</html>