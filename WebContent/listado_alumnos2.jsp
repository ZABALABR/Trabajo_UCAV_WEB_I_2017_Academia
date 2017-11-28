<%@ page import="es.ucav.util.ConexionBBDD"%>
<%@ page import="es.ucav.servlets.*"%>

<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.annotation.*"%>
<%@ page import="javax.servlet.http.*"%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="es.ucav.util.ConexionBBDD"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/estilo.css" />

	
	


<!-- <link rel="stylesheet" href="css/jquery.dataTables.min.css" /> -->

<!-- <script src="js/jquery.dataTables.min.js" type="text/javascript"></script> -->
<!-- <script src="js/jquery-1.12.4.js" type="text/javascript"></script> -->



	



    
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
		<h1>Gestión de alumnos</h1>
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

<%
            ConexionBBDD con =null;
            con =new ConexionBBDD();
         	
			
			int pagina = 0;
			String p = request.getParameter("page"); // nº de pág
			if(p!=null) pagina = Integer.valueOf(p);
			else pagina = 1;
			String query = "SELECT id_alumno, nombre, apellido1, apellido2, usuario " +
					" FROM alumnos LIMIT "+
			(pagina - 1) * 5 + ",5 ;";
			Statement st =  con.ObtenerConexionPool().prepareStatement(query);
			ResultSet rs = st.executeQuery(query);
%>
	<table align="center" border="1" bordercolor="black" width="80%">
	<caption style="font: oblique bold 120% cursive" >Listado de alumnos</caption>
		<tr align='left' bgcolor='orange'>
			<th width='25%'>Id_Alumno</th>
			<th width='5%' align='center'>Nombre</th>
			<th width='15%'>Apellido1</th>
			<th width='50%'>Apellido2</th>
			<th width='50%'>Usuario</th>
		</tr>
		<%
while (rs.next()) {
	
	 int l_id_Alumno = rs.getInt("id_alumno");
     String l_nombre = rs.getString("nombre");
     String l_apellido1 = rs.getString("apellido1");
     String l_apellido2 = rs.getString("apellido2");
     String l_usuario = rs.getString("usuario");
     
     

		%>
		<tr bgcolor='white'>
			<td><b> <%=l_id_Alumno%></b></td>
			<td align='center'><b><%=l_nombre%></b></td>
			<td><b><%=l_apellido1%></b></td>
			<td><b><%=l_apellido2%></b></td>
			<td><b><%=l_usuario%></b></td>
			<td>
&nbsp;&nbsp;&nbsp;&nbsp; <a
						href="eliminar_alumno?id_alumno=<%=l_id_Alumno%>&amp;usuario=<%=l_usuario%> ">Borrar</a>
		    </td>							
		</tr>
		<%
}
%>
	</table>
	<%
		st.close();
		query = "SELECT * FROM alumnos";
		st =  con.ObtenerConexionPool().prepareStatement(query);
		st.executeQuery(query);
		rs = st.getResultSet();
		int contador = 0;
		while (rs.next()) contador++;
		st.close();
		int pages = (contador / 5);
		if (contador != (pages * 5)){
			pages++;
		}
%>
	<table align="center">
		<tr>
 
<%
if (pagina > 1) {
	out.println("<td> <a href=\"?page=1\"> << </a> </td>");
	int previousPage = pagina - 1;
	out.println("<td><a href=\"?page="+
	previousPage +"\"> < </a></td>");
	out.println("<td><b> Page: "+ pagina + "</b></td>");
}
if (pagina == 1) {
	out.println("<td><b> Page: "+ pagina + "</b></td>");
}
	if (pages > pagina) {
	int nextPage = pagina + 1;
	out.println("<td><a href=\"?page="+ nextPage +
	"\"> > </a></td>");
	out.println("<td><a href=\"?page="+ pages+"\"> " +
	">> </a></td>");
	}
	con.devolverConexionPool(); 
 %>
		</tr>
	</table>





	<%-- <div align="center">
		<table border="1" cellpadding="5">
			<caption style="font: oblique bold 120% cursive" >Listado de alumnos</caption>
			
            <tr>
      			<th>ID_Alumno</th>
				<th>Nombre</th>
				<th>Apellido1</th>
				<th>Apellido2</th>
				<th>Usuario</th>
            </tr>
      
<!--         <tfoot>
            <tr>
    		    <th>ID_Alumno</th>
				<th>Nombre</th>
				<th>Apellido1</th>
				<th>Apellido2</th>
				<th>Usuario</th>
            </tr>
        </tfoot> -->
  

			<c:forEach var="alumno" items="${ListaAlumnos}">
				<tr>
					<td><c:out value="${alumno.id_alumno}" /></td>
					<td><c:out value="${alumno.nombre}" /></td>
					<td><c:out value="${alumno.apellido1}" /></td>
					<td><c:out value="${alumno.apellido2}" /></td>
					<td><c:out value="${alumno.usuario}" /></td>
					<td>
						 <a href="/edit?id=<c:out value='${profe.id_profesor}' />">Edit</a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a
						href="eliminar_alumno?id_alumno=<c:out value='${alumno.id_alumno}' />&amp;usuario=<c:out value='${alumno.usuario}' />">Borrar</a>
						<!-- <a href="eliminar_alumno?id_alumno=<c:out value='${alumno.id_alumno}' />">Borrar</a> -->
					</td>
				</tr>
			</c:forEach>
			
		</table>
	</div> --%>


</body>

</html>