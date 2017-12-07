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
    application.setAttribute("id_profesor", session.getAttribute("id_profesor"));

	if(session.getAttribute("usuario")==null) {
        response.sendRedirect("index.html");
    }
%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="css/estilo.css" />
    
</head>
<body>

<div class="container-fluid">  
<div class="row">
  <div class="col-md-4">
  <img src="img/logo4.jpg"  alt="logo"  height="150" width="225"/> 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </div>
  <div class="col-md-4">
       <h1 ><center>Administración Profesor</center></h1>
       <h2> <center>Horario de asignaturas</center></h2>
  </div>
  <div class="col-md-4" align= "right">
                 usuario:<% out.println(session.getAttribute("usuario"));%>
                 <br>
			     <a href="index.html" class="btn btn-info btn-lg" >
			         <span class="glyphicon glyphicon-log-out"></span> Log out
			     </a>
  </div>
</div>


	<%--  <h1>Hola Administrador <%=session.getAttribute("usuario") %></h1> --%>
<%-- 	<center>
		<h1>Mi horario de asignaturas</h1>
	</center> --%>
<div class="row"> 
	<ul id="barra">
		<!-- <li><a href="listar_profes">Profesores</a></li> -->
		<li><a href="profe_tutorias_pendientes">Gestion de tutorias</a></li>

	</ul>
</div>
 <div class="row"> 



	<div class="table-responsive" align="center">
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
</div>
</div>
</body>
</html>