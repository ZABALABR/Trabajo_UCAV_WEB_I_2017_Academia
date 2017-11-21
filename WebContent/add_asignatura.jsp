<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/estilo.css" />
<title>Gestión de asignaturas</title>
<% 
	if(session.getAttribute("usuario")==null) {
        response.sendRedirect("index.html");
    }
%>
</head>
<body>
	<center>
		<h1>Gestión de asignaturas</h1>
	</center>
	<ul id="barra">
		<!-- <li><a href="listar">Profesores</a></li> -->
		<li><a href="listar_alumnos">Alumnos</a></li>
		<li><a href="listar_profes">Profesores</a></li>
	</ul>
	<br>
	<br>
	<center>
		<h2>
			<!--          <a href="alta_profesor">Alta profesor</a>
            &nbsp;&nbsp;&nbsp; -->
			<a href="listar_asignaturas?vengode=''">Listado de asignaturas</a>

		</h2>
	</center>

	<div align="center">

		<form action="alta_asignatura" method="post">

			<table border="1" cellpadding="5">
				<caption>
					<h2>Alta asignatura</h2>
				</caption>

				<tr>
					<th>Descripcion:</th>
					<td><input type="text" name="descripcion" size="45" value="" />
					</td>
				</tr>
				<tr>
	                   <th>Seleccionar horario:</th>
	                   <td>
		                   <!--  <label for="horarios" >Seleccionar horario</label> -->
					         
					        <select class="form-control" id="horarios" name="horarios">
					              <option>Selecciona horario</option>
					              <c:forEach var="horario" items="${ListaHorarios}">
					              <option value ="${horario.id_horario}" ><c:out value="${horario.descripcion}"/></option> 
					              </c:forEach>
					        </select>
			            </td>
			   </tr>
			   <tr>
	                   <th>Seleccionar profesor:</th>
	                   <td>
		                   <!--  <label for="horarios" >Seleccionar horario</label> -->
					         
					        <select class="form-control" id="profesores" name="profesores">
					              <option>Selecciona profesor</option>
					              <c:forEach var="profesor" items="${ListaProfesores}">
					              <option value ="${profesor.id_profesor}" ><c:out value="${profesor.getNombreCompleto()}"/></option> 
					              </c:forEach>
					        </select>
				       </td>
			   </tr>			
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Grabar" /></td>
				</tr>
			</table>
		</form>
	</div>
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/bootstrap-modal.js" type="text/javascript"></script>	
</body>
</html>

