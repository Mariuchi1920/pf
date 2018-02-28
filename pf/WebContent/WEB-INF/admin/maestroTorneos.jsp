<%@page import="entidad.Torneo"%>
<%@page import="java.util.LinkedList"%>
<%@page import="datos.TorneosDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/font-awesome/css/fontawesome.min.css">
	<link href="https://fonts.googleapis.com/css?family=Raleway:100,300,400,500" rel="stylesheet">
	<link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/CSS/estilos.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" >
<title>Listar Torneo</title>
</head>

<script type="text/javascript">
	
	function editar(met) {
		
		document.myform.fixture.value="" ;
	    document.myform.eliminar.value="";  
	    document.myForm.action=met;
		
    }
	
	function eliminar(met) {
		if(confirm("Estas seguro de eliminar el Torneo?")){
		
			document.myform.fixture.value="";
			document.myform.editar.value=""  ;
		    document.myForm.action=met;
		};
    }
	
	function fixture(met) {
		if(confirm("Estas seguro de realizar el Fixture?")){
			document.myform.editar.value="" ;
		    document.myform.eliminar.value="";  
		    document.myForm.action=met;
		};
    }

	
	</script>


<body>
<div class="container">
	<div id="contenedor">

		<jsp:include page="/WEB-INF/cabecera.jsp" />

	</div>


	<div id="contenido">
		<form id="myForm" name="myForm" action="" method="post">
			<table align="center" border="void" cellpadding="5">
				<tr>
					<td colspan="8" align="center">Administrador de Torneo</td>
				</tr>
				<tr>

					<td align="center">Nombre</td>
					<td align="center">Fecha Inicio</td>
					<td align="center">Fecha Fin</td>
					<td align="center">Estado</td>
					<td align="center">Equipo Campeon</td>
					<td align="center" colspan="3">Accion</td>
				</tr>
				<%
					TorneosDAO torneoDao = new TorneosDAO();
					LinkedList<Torneo> torneos = torneoDao.listarTodosLosTorneos();
					for (Torneo t : torneos) {
				%>
				<tr>

					<th><%=t.getNombre()%></th>
					<td><%=t.getFechaInicio()%></td>
					<td><%=t.getFechaFin()%></td>
					<td><%=t.getEstado().getDescripcion()%></td>
					<%
						if (t.getEquipoGanador() != null) {
					%>
					<td><%=t.getEquipoGanador().getInstitucion().getNombre()%>-
						<%=t.getEquipoGanador().getCategorias().getAņoCategoria()%> - <%=t.getEquipoGanador().getNombreEquipo() %> </td>
					<%
						} else {
					%>
					<td>-</td>
					<%
						}
					%>
					<th><button class="botonEditar"
							onclick="javascript: editar('/admin/listarTorneo/')"
							value="<%=t.getIdTorneos()%>" id="editar" name="editar">Editar</button>
					</th>
					<th><button class="botonEliminar"
							onclick="javascript: eliminar('/admin/listarTorne/')"
							value="<%=t.getIdTorneos()%>" id="eliminar" name="eliminar">Eliminar</button>
					</th>
					<th><button class="botonEliminar"
							onclick="javascript: fixture('/admin/listarTorneo/')"
							value="<%=t.getIdTorneos()%>" id="fixture" name="fixture">Fixture</button>
					</th>
				</tr>
				<%
					}
				%>
				<th colspan="10"><a type="button"
					href="${pageContext.request.contextPath}/admin/modificarTorneo">Nuevo
						Torneo</th>
				</form>


			</table>
		</form>

	</div>

	<div id="Pie">
		<jsp:include page="/WEB-INF/pie.jsp" />

	</div>
	</div>
		<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>