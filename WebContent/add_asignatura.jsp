<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- <link rel="stylesheet" href="css/bootstrap.css"> -->
<link rel="stylesheet" href="css/estilo.css" />
<title>Gestión de asignaturas</title>
<% 
	if(session.getAttribute("usuario")==null) {
        response.sendRedirect("index.html");
    }
%>


<script>
function valida(){
	
	if(document.formulario.descripcion.value.length==0){
			alert("Introduce la descripción de la asigntura.");
			document.formulario.descripcion.focus();
			return;
			}
			
			
	if(document.formulario.horarios.selectedIndex==0) {
			alert("Selecciona un horario.");
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
       <h1 ><center>Administración Academia</center></h1>
       <h2> <center>Gestión de asignaturas</center></h2>
  </div>
  <div class="col-md-4" align= "right">
                 usuario:<% out.println(session.getAttribute("usuario"));%>
                 <br>
			     <a href="index.html" class="btn btn-info btn-lg" >
			         <span class="glyphicon glyphicon-log-out"></span> Log out
			     </a>
  </div>
</div>


<%-- 	<center>
		<h1>Gestión de asignaturas</h1>
	</center> --%>
	
<div class="row">  	
	<ul id="barra">
		<!-- <li><a href="listar">Profesores</a></li> -->
		<li><a href="listar_alumnos">Alumnos</a></li>
		<li><a href="listar_profes">Profesores</a></li>
	</ul>
</div>	
<div class="row"> 	
		<h2 align="center">
	
			<!--          <a href="alta_profesor">Alta profesor</a>
            &nbsp;&nbsp;&nbsp; -->
			<a href="listar_asignaturas?vengode=''">Listado de asignaturas</a>

	
	</h2>
</div>
<div class="row"> 
	<!-- <div align="center"> -->

		<form name="formulario" action="alta_asignatura" method="post">
          <div class="table-responsive"  align="center">
			<table border="1" cellpadding="5">
				<caption>
					Alta asignatura
				</caption>

				<tr>
					<th>Descripcion:</th>
					<td><input type="text" name="descripcion" size="45" value=""    maxlength="50" />
					</td>
				</tr>
				<tr>
	                   <th>Seleccionar horario:</th>
	                   <td>
		                   <!--  <label for="horarios" >Seleccionar horario</label> -->
					         
					        <select class="form-control" id="horarios" name="horarios" >
					              <option>Selecciona horario</option>
					              <c:forEach var="horario" items="${ListaHorarios}">
					              <option value ="${horario.id_horario}" ><c:out value="${horario.descripcion}"/></option> 
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
			 </div>
		</form>
	</div>
	</div>		

<script src="js/jquery.js" type="text/javascript"></script>
<!-- <script src="js/bootstrap-modal.js" type="text/javascript"></script>	 -->
</body>
</html>

