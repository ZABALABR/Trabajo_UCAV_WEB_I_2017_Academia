<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>


<link rel="stylesheet" href="css/estilo.css" />
<title>Gestión de profesores</title>
<% 
	if(session.getAttribute("usuario")==null) {
        response.sendRedirect("index.html");
    }
%>

<script>
function valida(){
	
	if(document.formulario.nombre.value.length==0){
			alert("Introduce el nombre del profesor.");
			document.formulario.nombre.focus();
			return;
			}
	if(document.formulario.apellido1.value.length==0){
		alert("Introduce el primer apellido del profesor.");
		document.formulario.apellido1.focus();
		return;
		}
	if(document.formulario.apellido2.value.length==0){
		alert("Introduce el segundo apellido del profesor.");
		document.formulario.apellido2.focus();
		return;
		}

    document.formulario.submit();
}
</script>


</head>
<body>
	
		<h1 align="center"> Gestión de profesores</h1>
	
	<ul id="barra">
		<!-- <li><a href="listar">Profesores</a></li> -->
		<li><a href="listar_alumnos">Alumnos</a></li>
		<li><a href="listar_asignaturas?vengode=''">Asignaturas</a></li>
	</ul>
	<br>
	<br>
	
		<h2 align="center">
			<!--          <a href="alta_profesor">Alta profesor</a>
            &nbsp;&nbsp;&nbsp; -->
			<a href="listar_profes">Listado de profesores</a>

		</h2>
	

	<div align="center">

		<form name="formulario" action="alta_profesor" method="post">

			<table border="1" cellpadding="5">
				<caption>Alta profesor</caption>

				<tr>
					<th>Nombre:</th>
					<td><input type="text" name="nombre" size="45" value="" />
					</td>
				</tr>
				<tr>
					<th>Primer apellido:</th>
					<td><input type="text" name="apellido1" size="45" value="" />
					</td>
				</tr>
				<tr>
					<th>Segundo apellido:</th>
					<td><input type="text" name="apellido2" size="45" value="" />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="button"
						value="Grabar" onclick="valida()"/></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>