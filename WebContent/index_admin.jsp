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
<% 
	if(session.getAttribute("usuario")==null) {
        response.sendRedirect("index.html");
    }
%>
</head>
<body>
	<%--  <h1>Hola Administrador <%=session.getAttribute("usuario") %></h1> --%>
	<center>
		<h1>Gestión de profesores</h1>
	</center>

	<ul id="barra">
		<!-- <li><a href="listar_profes">Profesores</a></li> -->
		<li><a href="listar_alumnos">Alumnos</a></li>
		<li><a href="listar_asignaturas">Asignaturas</a></li>
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
			ResultSet rs = stm.executeQuery("SELECT b.`inicio` FROM usuarios a INNER JOIN roles  b ON (a.id_rol = b.id_rol) where usuario='admin' and contraseña='admin'");
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
		<table border="1" cellpadding="5">
			<caption>Listado de profesores</caption>
			<tr>
				<th>ID_Profesor</th>
				<th>Nombre</th>
				<th>Apellido1</th>
				<th>Apellido2</th>
				<th>Usuario</th>
			</tr>
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
						href="eliminar_profe?id_profesor=<c:out value='${profe.id_profesor}' />">Borrar</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>