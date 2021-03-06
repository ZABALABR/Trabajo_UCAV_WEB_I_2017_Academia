<%@ page import="es.ucav.util.ConexionBBDD"%>
<%@ page import="es.ucav.servlets.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.annotation.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>

<%@ page import="org.json.JSONObject"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Asignar alumnos a una asignatura</title>
</head>


<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    
<link rel="stylesheet" href="css/estilo.css" />
<script src="js/jquery-1.11.1.js" type="text/javascript"></script>

<script>

$().ready(function() 
		{
			$('.pasar').click(function() { var label = $('#resultado'); $('#resultado').text("");return !$('#alumnos option:selected').remove().appendTo('#alumnos_asig'); });  
			$('.quitar').click(function() {  var label = $('#resultado'); $('#resultado').text(""); return !$('#alumnos_asig option:selected').remove().appendTo('#alumnos'); });
			$('.pasartodos').click(function() { $('#origen option').each(function() { $(this).remove().appendTo('#destino'); }); });
			$('.quitartodos').click(function() { $('#destino option').each(function() { $(this).remove().appendTo('#origen'); }); });
			$('.submit').click(function() { $('#destino option').prop('selected', 'selected'); });
			$('.guardar').click(function() { 
				 var asignaturas = $("select#asignaturas").val();
				 
				 //var lista_alumnos = $("#alumnos_asig")
				var lista=""; 
				$('#alumnos_asig option').each(function() {  lista = lista + ($(this).val()) + ","; });
				 
				 $.get('guardar_alumnos_asig', {id_asignatura : asignaturas, alumnos : lista  }
				 //$.get('guardar_alumnos_asig', {id_asignatura : asignaturas, alumnos : lista  }
				 , function(response) {
				
					 var label = $('#resultado');
					 
					   $.each(response, function(index, value) {
						   //alert( value + " is " + index );
						  
					          $('#resultado').text(value);
					   });
					
				 });
				 });
		});
		
		
		

$(document).ready(function() {

$('#asignaturas').change(function(event) {
			var label = $('#resultado');
			 $('#resultado').text("");

        var asignaturas = $("select#asignaturas").val();
        $.get('alumnos_asignatura', {
                id_asignatura : asignaturas,
                En : "NO"
        }, function(response) {

        var select = $('#alumnos');
        select.find('option').remove();
        //JSONObject json = new JSONObject(response);
        //var contact = JSON.parse(jsontext); 
          $.each(response, function(index, value) {
    
          $('<option>').val(value.id_alumno).text(value.nombre_completo).appendTo(select);
      });
        });
      
        });
$('#asignaturas').change(function(event) {
    var asignaturas = $("select#asignaturas").val();
    $.get('alumnos_asignatura', {
            id_asignatura : asignaturas,
            En : "SI"
    }, function(response) {

    var select = $('#alumnos_asig');
    select.find('option').remove();
      $.each(response, function(index, value) {
    
      $('<option>').val(value.id_alumno).text(value.nombre_completo).appendTo(select);
  });
    });
    });        
      
});
</script>
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


<div class="row"> 
	<ul id="barra">
		<!-- <li><a href="listar">Profesores</a></li> -->
		<li><a href="listar_alumnos">Alumnos</a></li>
		<li><a href="listar_profes">Profesores</a></li>
	</ul>
</div>		
<div class="row">
    <div class="col-md-12">
	<%-- <center> --%>
		<h2 align="center">
			<!--          <a href="alta_profesor">Alta profesor</a>
            &nbsp;&nbsp;&nbsp; -->
			<a href="listar_asignaturas?vengode=''">Listado de asignaturas</a>
		</h2>
	</div>	
	<%-- </center> --%>
</div>
<div class ="container">
       <br>
      
                <div class= "row">
		         <h3 align="center" class="col-xs-12">Asignar alumnos a una asignatura</h3>
		        </div>
				<div class ="row">
				  <div class="form-group">
	                    <label for="asignaturas" >Seleccionar la asignatura</label>
				         
				        <select class="form-control" id="asignaturas">
				              <option>Selecciona la asignatura</option>
				              <c:forEach var="asignatura" items="${ListaAsignaturas}">
				              <option value ="${asignatura.id_asignatura}" ><c:out value="${asignatura.descripcion}"/></option> 
				              </c:forEach>
				        </select>
				     </div>
				</div>     
				<div class ="row">
				<form action="" class= "form-inline" >
				  <div class ="form-group ">  
				       <div>
				         <label for="alumnos" >Alumnos a asignar:</label>
				         
				        <select style="width: 250px;" class="form-control" id="alumnos" multiple >
				                <option>Selecciona alumno</option>
				        </select>
				        </div>
				  </div>      
                  <div class="form-group"> 
                          <div >
                          
                         <label class="invisible">XXX</label>
                          </div>
                   </div> 					  
	             <div class="form-group"> 
                          <div >
                                <label class="invisible">XXX</label>
                                <button class="btn btn-lg btn-primary btn-block quitar" >Quitar <<</button>
                                <button class="btn btn-lg btn-primary btn-block pasar" >Asignar >></button>
                          </div>
                   </div> 				
                  <div class="form-group"> 
                          <div >
                          
                         <label class="invisible">XXX</label>
                          </div>
                   </div> 	
	                   			  
				  <div class="form-group ">
				      <div>        
				        <label for="alumnos_asig" >Alumnos asignados:</label>       
				        
				        <select style="width: 250px;" class="form-control"  name="alumnos_asig" id="alumnos_asig" multiple>
				                <option>Selecciona alumno</option>
				        </select>
				      </div>
				  </div>      
				  </form>
			   </div> 
			      
	

                  <div class="form-group"> 
                          <div >
                          
                         <label class="invisible">XXX</label>
                          </div>
                   </div> 
                  <div class="row">
                   <div class="col-md-0">
                          
                         <label class="invisible">XXX</label>
                   </div>
                   <div class="col-md-4">
                       <button class="btn btn-lg  btn-success guardar" >Guardar cambios </button>       
                  </div>	
                    
                   <div class="col-md-4">
                          
                         <label class="" id="resultado"></label>
                   </div>                  
                  </div>	

	</div>	
</div>			        
</body>
</html>