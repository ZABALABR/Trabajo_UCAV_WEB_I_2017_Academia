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

<!--   <meta charset="UTF-8"> -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/estilo.css" />


<title>Administrador</title>
<%@page session="true" %>

<% 
    application.setAttribute("usuario", session.getAttribute("usuario"));
    application.setAttribute("id_alumno", session.getAttribute("id_alumno"));

	if(session.getAttribute("usuario")==null) {
        response.sendRedirect("index.html");
    }
%>
</head>
<body>
	<%--  <h1>Hola Administrador <%=session.getAttribute("usuario") %></h1> --%>
	<center>
		<h1>Mi horario de asignaturas</h1>
	</center>

	<ul id="barra">
		<!-- <li><a href="listar_profes">Profesores</a></li> -->
		<li><a href="alu_tutorias_solicitadas">Gestion de tutorias</a></li>

	</ul>
	<br>
	<br>



	<div align="center">
		<table border="1" cellpadding="5">
			<caption style="font: oblique bold 120% cursive">horario</caption>
			<tr>
				<th>Asignatura</th>
				<th>Horario</th>
	
			</tr>
			<c:forEach var="horario" items="${ListaHorario}">
				<tr>
					<td><c:out value="${horario.descripcion}" /></td>
					<td><c:out value="${horario.horario}" /></td>
				
		
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>