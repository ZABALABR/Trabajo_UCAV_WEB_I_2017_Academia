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


<script>
function valida(){
	
	
			
			
	if(document.formulario.asignaturas.selectedIndex==0) {
			alert("Selecciona una asignatura.");
			document.formulario.horarios.focus();
			return;
			}
    if(document.formulario.profesores.selectedIndex==0) {
			alert("Selecciona un profesor.");
			document.formulario.profesores.focus();
			return;
             }
    document.formulario.submit();
}
</script>


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

		<form name="formulario" action="asignar_profe_asignatura" method="post">

			<table border="1" cellpadding="5">
				<caption>
					<h2>Asignar profesor a una asignatura</h2>
				</caption>

		
				<tr>
	                   <th>Seleccionar Asignatura:</th>
	                   <td>
		                   
					        
					        <select class="form-control" id="asignaturas" name="asignaturas">
				              <option>Selecciona la asignatura</option>
				              <c:forEach var="asignatura" items="${ListaAsignaturas}">
				              <option value ="${asignatura.id_asignatura}" ><c:out value="${asignatura.descripcion}"/></option> 
				              </c:forEach>
				            </select>
			            </td>
			   </tr>
			   <tr>
	                   <th>Seleccionar profesor:</th>
	                   <td>
		                   <!--  <label for="horarios" >Seleccionar horario</label> -->
					         
					        <select class="form-control" id="profesores" name="profesores" >
					              <option>Selecciona profesor</option>
					              <c:forEach var="profesor" items="${ListaProfesores}">
					              <option value ="${profesor.id_profesor}" ><c:out value="${profesor.getNombreCompleto()}"/></option> 
					              </c:forEach>
					        </select>
				       </td>
			   </tr>			
				<tr>
					<td colspan="2" align="center"><input type="button"
						value="Grabar" onclick="valida()"/></td>
				</tr>
			</table>
		</form>
	</div>
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/bootstrap-modal.js" type="text/javascript"></script>	
</body>
</html>

