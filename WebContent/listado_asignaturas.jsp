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
<!--  <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.css">

<link rel="stylesheet" href="css/estilo.css" /> -->


<title>Administrador</title>
<% 
String s_error = (String)request.getAttribute("Error"); 
    if ((s_error != null) && (!s_error.equals("")) ){
    	%>
     <script language='javascript'>alert("<%= s_error %>");</script> 
     
  	
<% 
    }
%>    
<%     
	if(session.getAttribute("usuario")==null) {
        response.sendRedirect("index.html");
    }


%>

<!-- <link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/estilo.css" />
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="css/estilo.css" />
    
    <script type="text/javascript" src="js/sorttable.js"></script> -->

  <script type="text/javascript" src="js/sorttable.js"></script> 
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
       <h2> <center>Gestión de Asignaturas</center></h2>
  </div>
  <div class="col-md-4" align= "right">
                 usuario:<% out.println(session.getAttribute("usuario"));%>
                 <br>
			     <a href="index.html" class="btn btn-info btn-lg" >
			         <span class="glyphicon glyphicon-log-out"></span> Log out
			     </a>
  </div>
</div>
<%--      <div align= "right">
               
                 usuario:<% out.println(session.getAttribute("usuario"));%>
                 <br>
			     <a href="index.html" class="btn btn-info btn-lg" >
			         <span class="glyphicon glyphicon-log-out"></span> Log out
			     </a>
     </div>
     
 
    
       <h1 >
        <img src="img/logo4.jpg"  alt="logo"  height="150" width="225"/> 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              
         Administración Academia UCAV 
         
       </h1>
	<center>
		<h2>Gestión de asignaturas</h2>
	</center> 
--%>



          
	
<%-- 	<div id="example" class="modal hide fade in" data-backdrop="static" data-keyboard="false"  style="display: none; ">
           <div class="modal-header">
             <a class="close" data-dismiss="modal">x</a>
             <h3>Asignar profesor</h3>
           </div>
           <div class="modal-body">
	                    <label for="profesores" >Seleccionar profesor</label>
				         
				        <select class="form-control" id="profesores">
				              <option>elige un profesor</option>
				              <c:forEach var="profe" items="${ListaProfesores}">
				              <option value ="${profe.id_profesor}" ><c:out value="${profe.nombre}"/></option> 
				              </c:forEach>
				        </select>	        
           </div>
           <div class="modal-footer">
             <a href="index.html" class="btn btn-success">Guardar</a>
             <a href="#" class="btn" data-dismiss="modal">Cerrar</a>
           </div>
    </div> --%>
 <div class="row">      
	<ul id="barra">
		<!-- <li><a href="listar_profes">Profesores</a></li> -->
		<li><a href="listar_profes">Profesores</a></li>
		<li><a href="listar_alumnos">Alumnos</a></li>
	</ul>
</div>


 <div class="row"> 	
   <div class="col-md-4">
     <h2><center><a href="horarios_y_profes">Alta asignatura</a></center> </h2>
   </div>  
   <div class="col-md-4">
     <h2><center><a href="listar_asignaturas?vengode=asignar">Asignar alumnos</a></center> </h2>
   </div>  
   <div class="col-md-4">  
     <h2><center><a href="asignaturas_y_profes">Asignar profesor</a></center> </h2>
   </div>  
 
<%--    <center>
		<h2>
			<a href="horarios_y_profes">Alta asignatura</a> &nbsp;&nbsp;&nbsp; 
			<a href="listar_asignaturas?vengode=asignar">Asignar alumnos</a> &nbsp;&nbsp;&nbsp;
			<a href="asignaturas_y_profes">Asignar profesor</a> &nbsp;&nbsp;&nbsp;
			<a href="listar">Listado de profesores</a>

		</h2>
	</center> --%>
</div>

<div class="row"> 
	<div class="table-responsive" align="center">
	    
		<table class="sortable" border="1" cellpadding="5">
			<caption style="font: oblique bold 120% cursive" >Listado de asignaturas</caption>
			<thead>
			<tr>
			   
				<th>id_Asignatura</th>
				<th>Asignatura</th>
				<th>Horario</th>
				<th>Profesor asignado</th>

			</tr>
			</thead>
			<c:forEach var="asignatura" items="${ListaAsignaturas}">
				<tr>
				    
					<td><c:out value="${asignatura.id_asignatura}" /></td>
					<td><c:out value="${asignatura.descripcion}" /></td>
					<td><c:out value="${asignatura.horario}" /></td>
					<td><c:out value="${asignatura.profesor}" /></td>

				<%-- 	<td>
						 <a href="/edit?id=<c:out value='${profe.id_profesor}' />">Edit</a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a
						href="eliminar_asignatura?id_asignatura=<c:out value='${asignatura.id_asignatura}' />">Borrar</a>
					</td> --%>
					
					<td> &nbsp;&nbsp;&nbsp;&nbsp;<a 
			         href="eliminar_asignatura?id_asignatura=<c:out value='${asignatura.id_asignatura}' />" class="btn btn-info btn-xs" id="profesor">Borrar</a> 	
					</td>
					
					
					<%-- <td>&nbsp;&nbsp;&nbsp;&nbsp; <a
						href="horario_asignatura?id_asignatura=<c:out value='${asignatura.id_asignatura}' />">Asignar
							horario</a>							
					</td>
			        <td> <a 
			        data-toggle="modal" href="#example" class="btn btn-info btn-xs" id="profesor">ventana modal</a> 	
					</td>
										
					<td>&nbsp;&nbsp;&nbsp;&nbsp; <a
						href="profesor_asignatura?id_asignatura=<c:out value='${asignatura.id_asignatura}' />">Asignar
							profesor</a>
					</td> --%>
					<%--                       <td>
                       &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="alumnos_asignatura?id_asignatura=<c:out value='${asignatura.id_asignatura}' />">Asignar_alumnos</a>
                        <!-- <a href="eliminar_alumno?id_alumno=<c:out value='${alumno.id_alumno}' />">Borrar</a> -->                    
                      </td> --%>
				</tr>
			</c:forEach>
		</table>
	</div>
	
</div>	
	
</div>	



<script src="js/jquery.js" type="text/javascript"></script>
<!-- <script src="js/bootstrap-modal.js" type="text/javascript"></script> -->
</body>
</html>