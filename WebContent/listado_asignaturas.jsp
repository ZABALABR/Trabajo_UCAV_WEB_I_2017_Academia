<%@ page import="es.ucav.util.ConexionBBDD"%>
<%@ page import="es.ucav.servlets.*"%>

<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.annotation.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/estilo.css" />


<title>Administrador</title>
<% 
	if(session.getAttribute("usuario")==null) {
        response.sendRedirect("index.html");
    }


%>
</head>
<body>
	<%--  <h1>Hola Administrador <%=session.getAttribute("usuario") %></h1> --%>
	<center>
		<h1>Gestión de asignaturas</h1>
	</center>

	<ul id="barra">
		<!-- <li><a href="listar_profes">Profesores</a></li> -->
		<li><a href="listar_profes">Profesores</a></li>
		<li><a href="listar_alumnos">Alumnos</a></li>
	</ul>
	<br>
	<br>
	<center>
		<h2>
			<a href="add_asignatura.jsp">Alta asignatura</a> &nbsp;&nbsp;&nbsp; <a
				href="listar_asignaturas?vengode=asignar">Asignar alumnos</a> &nbsp;&nbsp;&nbsp;
			<!-- <a href="listar">Listado de profesores</a> -->

		</h2>
	</center>



	<div align="center">
	    
		<table border="1" cellpadding="5">
			<caption style="font: oblique bold 120% cursive" >Listado de asignaturas</caption>
			<tr>
				<th>ID</th>
				<th>Asignatura</th>
				<th>Horario</th>
				<th>Profesor asignado</th>

			</tr>
			<c:forEach var="asignatura" items="${ListaAsignaturas}">
				<tr>
					<td><c:out value="${asignatura.id_asignatura}" /></td>
					<td><c:out value="${asignatura.descripcion}" /></td>
					<td><c:out value="${asignatura.horario}" /></td>
					<td><c:out value="${asignatura.profesor}" /></td>

					<td>
						<%--  <a href="/edit?id=<c:out value='${profe.id_profesor}' />">Edit</a> --%>
						&nbsp;&nbsp;&nbsp;&nbsp; <a
						href="eliminar_asignatura?id_asignatura=<c:out value='${asignatura.id_asignatura}' />">Borrar</a>
					</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp; <a
						href="horario_asignatura?id_asignatura=<c:out value='${asignatura.id_asignatura}' />">Asignar
							horario</a>
					</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp; <a
						href="profesor_asignatura?id_asignatura=<c:out value='${asignatura.id_asignatura}' />">Asignar
							profesor</a>
					</td>
					<%--                       <td>
                       &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="alumnos_asignatura?id_asignatura=<c:out value='${asignatura.id_asignatura}' />">Asignar_alumnos</a>
                        <!-- <a href="eliminar_alumno?id_alumno=<c:out value='${alumno.id_alumno}' />">Borrar</a> -->                    
                      </td> --%>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>