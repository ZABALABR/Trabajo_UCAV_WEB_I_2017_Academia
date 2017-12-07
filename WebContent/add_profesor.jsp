<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/estilo.css" />
<title>Gestión de profesores</title>
<% 
	if(session.getAttribute("usuario")==null) {
        response.sendRedirect("index.html");
    }
%>

<script>
function valida(){
	
	if(document.formulario.nombre.value.length==0){
			alert("Introduce el nombre del profesor.");
			document.formulario.nombre.focus();
			return;
			}
	if(document.formulario.apellido1.value.length==0){
		alert("Introduce el primer apellido del profesor.");
		document.formulario.apellido1.focus();
		return;
		}
	if(document.formulario.apellido2.value.length==0){
		alert("Introduce el segundo apellido del profesor.");
		document.formulario.apellido2.focus();
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
       <h2> <center>Gestión de Profesores</center></h2>
  </div>
  <div class="col-md-4" align= "right">
                 usuario:<% out.println(session.getAttribute("usuario"));%>
                 <br>
			     <a href="index.html" class="btn btn-info btn-lg" >
			         <span class="glyphicon glyphicon-log-out"></span> Log out
			     </a>
  </div>
</div>

	
	<!-- 	<h1 align="center"> Gestión de profesores</h1> -->
<div class="row">  	
	<ul id="barra">
		<!-- <li><a href="listar">Profesores</a></li> -->
		<li><a href="listar_alumnos">Alumnos</a></li>
		<li><a href="listar_asignaturas?vengode=''">Asignaturas</a></li>
	</ul>
</div>	
<div class="row"> 
	
		<h2 align="center">
			<!--          <a href="alta_profesor">Alta profesor</a>
            &nbsp;&nbsp;&nbsp; -->
			<a href="listar_profes">Listado de profesores</a>

		</h2>
</div>	
<div class="row"> 
	<!-- <div class="table-responsive"  align="center"> -->
      
		<form name="formulario" action="alta_profesor" method="post">
		   
           <div class="table-responsive"  align="center">
			<table border="1" cellpadding="5">
				<caption>Alta profesor</caption>

				<tr>
					<th>Nombre:</th>
					<td><input type="text" name="nombre" size="45" value="" />
					</td>
				</tr>
				<tr>
					<th>Primer apellido:</th>
					<td><input type="text" name="apellido1" size="45" value="" />
					</td>
				</tr>
				<tr>
					<th>Segundo apellido:</th>
					<td><input type="text" name="apellido2" size="45" value="" />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="button"
						value="Grabar" onclick="valida()"/></td>
				</tr>
			</table>
		   </div>	
		  
		</form>
	<!-- </div> -->
</div>		
</div>	
<script src="js/jquery.js" type="text/javascript"></script>
</body>
</html>