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

<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
 -->
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.css">

<link rel="stylesheet" href="css/estilo.css" />


<title>Administrador</title>
<% 
    application.setAttribute("usuario", session.getAttribute("usuario"));
	if(session.getAttribute("usuario")==null) {
        response.sendRedirect("index.html");
    }


%>


</head>
<body>
<div class="container">


          
	<%--  <h1>Hola Administrador <%=session.getAttribute("usuario") %></h1> --%>
	<center>
		<h1>Gestión de asignaturas</h1>
	</center>
	
	<ul id="barra">
		<!-- <li><a href="listar_profes">Profesores</a></li> -->
		<li><a href="horarios_alumno">Mi horario</a></li>
		
	</ul>
	<br>
	<br>
	<center>
		<h2>
			<a href="horarios_y_profes">Solicitar tutoria</a> 
		</h2>
	</center>



	<div align="center">
	    
		<table border="1" cellpadding="5">
			<caption style="font: oblique bold 120% cursive" >Listado de tutorias</caption>
			<tr>
				<th>Fecha de tutoria</th>
				<th>Profesor</th>
				<th>Estado de la tutoria</th>
				

			</tr>
			<c:forEach var="tutoria" items="${ListaTutorias}">
				<tr>
					<td><c:out value="${tutoria.fecha}" /></td>
					<td><c:out value="${tutoria.profesor}" /></td>
					<td><c:out value="${tutoria.estado}" /></td>
					

					
				</tr>
			</c:forEach>
		</table>
	</div>
	
	
	


 </div>

<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/bootstrap-modal.js" type="text/javascript"></script>
</body>
</html>