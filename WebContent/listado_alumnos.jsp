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
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<style type="text/css" class="init">
	
	</style>


<!-- <link rel="stylesheet" href="css/jquery.dataTables.min.css" /> -->

<!-- <script src="js/jquery.dataTables.min.js" type="text/javascript"></script> -->
<!-- <script src="js/jquery-1.12.4.js" type="text/javascript"></script> -->


<script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.12.4.js">
</script>
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js">
</script>
	

<script type="text/javascript" class="init">

$(document).ready(function() {
    $('#mitabla').DataTable( {
    	 "processing": true,
         "serverSide": true,
         "ajax": "scripts/listar_alumnos"
    });
    
   
} );

</script>
    
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
		<h1>Gesti�n de alumnos</h1>
	</center>

	<ul id="barra">
		<!-- <li><a href="listar_profes">Profesores</a></li> -->
		<li><a href="listar_profes">Profesores</a></li>
		<li><a href="listar_asignaturas?vengode=''">Asignaturas</a></li>
	</ul>
	<br>
	<br>
	<center>
		<h2>
			<a href="add_alumno.jsp">Alta alumnos</a> &nbsp;&nbsp;&nbsp;
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
		<table id="mitabla"  class="display" cellspacing="0" width="100%">
			<caption style="font: oblique bold 120% cursive" >Listado de alumnos</caption>
			 <thead>
            <tr>
      			<th>ID_Alumno</th>
				<th>Nombre</th>
				<th>Apellido1</th>
				<th>Apellido2</th>
				<th>Usuario</th>
            </tr>
        </thead>
<!--         <tfoot>
            <tr>
    		    <th>ID_Alumno</th>
				<th>Nombre</th>
				<th>Apellido1</th>
				<th>Apellido2</th>
				<th>Usuario</th>
            </tr>
        </tfoot> -->
        <tbody>

			<c:forEach var="alumno" items="${ListaAlumnos}">
				<tr>
					<td><c:out value="${alumno.id_alumno}" /></td>
					<td><c:out value="${alumno.nombre}" /></td>
					<td><c:out value="${alumno.apellido1}" /></td>
					<td><c:out value="${alumno.apellido2}" /></td>
					<td><c:out value="${alumno.usuario}" /></td>
					<td>
						<%--  <a href="/edit?id=<c:out value='${profe.id_profesor}' />">Edit</a> --%>
						&nbsp;&nbsp;&nbsp;&nbsp; <a
						href="eliminar_alumno?id_alumno=<c:out value='${alumno.id_alumno}' />&amp;usuario=<c:out value='${alumno.usuario}' />">Borrar</a>
						<!-- <a href="eliminar_alumno?id_alumno=<c:out value='${alumno.id_alumno}' />">Borrar</a> -->
					</td>
				</tr>
			</c:forEach>
		</tbody>	
		</table>
	</div>


</body>

</html>