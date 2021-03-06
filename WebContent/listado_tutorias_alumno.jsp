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
 <!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.css">
 -->
<link rel="stylesheet" href="css/estilo.css" />
<script type="text/javascript" src="js/sorttable.js"></script>

<title>Administrador</title>
<% 
    application.setAttribute("usuario", session.getAttribute("usuario"));
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
       <h1 ><center>Administración Alumno</center></h1>
       <h2> <center>Gestión de tutorias</center></h2>
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
		<h1>Gestión de tutorias</h1>
	</center> --%>
<div class="row"> 	
	<ul id="barra">
		<!-- <li><a href="listar_profes">Profesores</a></li> -->
		<li><a href="horarios_alumno">Mi horario</a></li>
		
	</ul>
</div>	
<div class="row"> 	
	
		<h2 align ="center">
			<a href="solicitar_tutoria">Solicitar tutoria</a> 
		</h2>
	

</div>
 <div class="row"> 
	<div class="table-responsive" align="center">
	    
		<table class="sortable"   border="1" cellpadding="5">
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


 </div>

<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/bootstrap-modal.js" type="text/javascript"></script>
</body>
</html>