<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>


<link rel="stylesheet" href="css/estilo.css" />
<title>Gestión de alumnos</title>
<% 
	if(session.getAttribute("usuario")==null) {
        response.sendRedirect("index.html");
    }
%>


<script>
function valida(){
	
	if(document.formulario.nombre.value.length==0){
			alert("Introduce el nombre del alumno.");
			document.formulario.nombre.focus();
			return;
			}
	if(document.formulario.apellido1.value.length==0){
		alert("Introduce el primer apellido del alumno.");
		document.formulario.apellido1.focus();
		return;
		}
	if(document.formulario.apellido2.value.length==0){
		alert("Introduce el segundo apellido del alumno.");
		document.formulario.apellido2.focus();
		return;
		}

    document.formulario.submit();
}
</script>


</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<body>
	<center>
		<h1>Gestión de alumnos</h1>
	</center>
	<ul id="barra">
		<!-- <li><a href="listar">Alumnos</a></li> -->
		<li><a href="listar_profes">Profesores</a></li>
		<li><a href="listar_asignaturas?vengode=''">Asignaturas</a></li>
	</ul>
	<br>
	<br>
	<center>
		<h2>
			<!--          <a href="alta_profesor">Alta profesor</a>
            &nbsp;&nbsp;&nbsp; -->
			<a href="listar_alumnos">Listado de alumnos</a>

		</h2>
	</center>

	<div align="center">

		<form name="formulario" action="alta_alumno" method="post">

			<table border="1" cellpadding="5">
				<caption>
					<h2>Alta alumno</h2>
				</caption>

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