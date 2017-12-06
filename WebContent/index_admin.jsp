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

<script type="text/javascript" src="js/sorttable.js"></script>
<title>Administrador</title>
<% 
String s_error = (String)request.getAttribute("Error"); 
    if ((s_error != null) && (!s_error.equals("")) ){
    	%>
     <script language='javascript'>alert("<%= s_error %>");</script> 
     
  	
<% 
    }
%>    
<%@page session="true" %>
<% 
	if(session.getAttribute("usuario")==null) {
        response.sendRedirect("index.html");
    }
%>
<!-- <link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/estilo.css" /> -->

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="css/estilo.css" />
</head>
<body>
     <div align= "right">
                 usuario:<% out.println(session.getAttribute("usuario"));%>
                 <br>
			     <a href="index.html" class="btn btn-info btn-lg" >
			         <span class="glyphicon glyphicon-log-out"></span> Log out
			     </a>
     </div>
     
     <div >
	        <img src="img/logo4.jpg"  alt="logo"  height="150" width="225"/>
	   
				<center>
					<h1>Gesti�n de profesores</h1>
				</center>
		
     </div>
     
     
	<ul id="barra">
		<!-- <li><a href="listar_profes">Profesores</a></li> -->
		<li><a href="listar_alumnos">Alumnos</a></li>
		<li><a href="listar_asignaturas?vengode=''">Asignaturas</a></li>
	</ul>
	<br>
	<br>
	<center>
		<h2>
			<a href="add_profesor.jsp">Alta profesor</a> &nbsp;&nbsp;&nbsp;
			<!-- <a href="listar">Listado de profesores</a> -->

		</h2>
	</center>
	<%--    <% 		
        ConexionBBDD con =new ConexionBBDD();
        Connection conn	= null;
        conn = con.ObtenerConexionPool();
		if (con.ObtenerConexionPool() != null ) {
			System.out.println("Conexion realizada.");
			
		   	Statement stm = con.ObtenerConexionPool().createStatement();
			ResultSet rs = stm.executeQuery("SELECT b.`inicio` FROM usuarios a INNER JOIN roles  b ON (a.id_rol = b.id_rol) where usuario='admin' and contrase�a='admin'");
			if(rs.next()) {
				System.out.println("estamos en el jsp RAMON" + rs.getString(1));
			}
			 
			rs.close();
			stm.close();
			con.devolverConexionPool();
			//conn.close();	
		}
		%>
		 --%>


	<div align="center">
		<table class="sortable" border="1" cellpadding="5">
			<caption style="font: oblique bold 120% cursive">Listado de profesores</caption>
			<thead>
			<tr>
			  
				<th>ID_Profesor</th>
				<th>Nombre</th>
				<th>Apellido1</th>
				<th>Apellido2</th>
				<th>Usuario</th>
				
			</tr>
			</thead>
			<c:forEach var="profe" items="${ListaProfesores}">
				<tr>
					<td><c:out value="${profe.id_profesor}" /></td>
					<td><c:out value="${profe.nombre}" /></td>
					<td><c:out value="${profe.apellido1}" /></td>
					<td><c:out value="${profe.apellido2}" /></td>
					<td><c:out value="${profe.usuario}" /></td>
					<td>
						<%--  <a href="/edit?id=<c:out value='${profe.id_profesor}' />">Edit</a> --%>
						&nbsp;&nbsp;&nbsp;&nbsp; <a
						href="eliminar_profe?id_profesor=<c:out value='${profe.id_profesor}' />"class="btn btn-info btn-xs">Borrar</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
<script src="js/jquery.js" type="text/javascript"></script>
</body>
</html>