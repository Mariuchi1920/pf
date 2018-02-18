<%@page import="java.sql.ResultSet"%>
<%@page import="entidad.Categoria"%>
<%@page import="datos.CategoriasDAO"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html class="no-js" lang="en">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/CSS/style.css">
<head>
<meta charset="UTF-8">
<title>Maestro categoria</title>


</head>

<script type="text/javascript">
	
function editar(met) {
	document.myform.eliminar.value=""     
	document.myForm.action = met;
}
function eliminar(met) {
	if (confirm("Estas seguro de eliminar Categor�a?")) {
		
		document.myform.editar.value=""  
		document.myForm.action = met;
	
	};
	}
	
	</script>
<body>
	<div id="contenedor">

		<jsp:include page="/WEB-INF/admin/cabecera.jsp" />

	</div>


	<div id="contenido">

		<form id="myForm" name="myForm" action="" method="post">


			<table align="center" width="700" border="void" cellpadding="5">

				<tr>
					<td colspan="4" align="center">Administrador de categorias</td>
				</tr>
				<tr>
					<td align="center">A�o Categoria</td>
					<td align="center">Descripcion</td>
					<td align="center">Estado</td>
					<td align="center">Accion</td>
				</tr>

				<%
					CategoriasDAO catDao = new CategoriasDAO();
					LinkedList<Categoria> categorias = catDao
							.listarTodasLasCategorias();
					for (Categoria c : categorias) {
				%>
				<tr>
					<th><%=c.getA�oCategoria()%></th>
					<th><%=c.getDescripcion()%></th>
					<th><%=c.getEstado().getDescripcion()%></th>
					<th>
					<button
							onclick="javascript: editar('/admin/listarCategoriaeditar/')"
							value="<%= c.getIdCategorias()%>" id="editar" name="editar">Editar</button> 
						<button
							onclick="javascript: eliminar('/admin/listarCategoriaeliminar/')"
							value="<%= c.getIdCategorias()%>" id="eliminar" name="eliminar">Eliminar</button>
					</th>



				</tr>
				<%
					}
				%>

			</table>

		</form>
		
		<a type="button"  href="${pageContext.request.contextPath}/admin/modificarCategoria">Nueva Categoria</a>
		
	</div>

	</div>



	<div id="Pie">
		<jsp:include page="/WEB-INF/admin/pie.jsp" />

	</div>
</body>
</html>
