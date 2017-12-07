<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<style type="text/css">
@import url(css/calendar-win2k-1.css);
</style>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calendar-es.js"></script>
<script type="text/javascript" src="js/calendar-setup.js"></script>

<!-- <link rel="stylesheet" href="css/bootstrap.css"> -->
<link rel="stylesheet" href="css/estilo.css" />
<title>Gestión de asignaturas</title>
<% 
    application.setAttribute("usuario", session.getAttribute("usuario"));
    application.setAttribute("id_alumno", session.getAttribute("id_alumno"));
	if(session.getAttribute("usuario")==null) {
        response.sendRedirect("index.html");
    }
%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<%-- 	<center>
		<h1>Gestión de tutorias</h1>
	</center> --%>
	
<div class="row"> 	
	<ul id="barra">
          <li><a href="horarios_alumno">Mi horario</a></li>
	</ul>
</div>	

<div class="row"> 		
	
		<h2 align="center">
		
			<a href="alu_tutorias_solicitadas">Listado de tutorias</a>

		</h2>
	
</div>	
<div class="row"> 
	

		<form name="formulario" action="alta_tutoria"  onsubmit="return validacion()" method="post">
			<div class="table-responsive" align="center">
			<table border="1" cellpadding="5">
				<caption>
					Solicitar tutoria
				</caption>

				<tr>
					<th>Elige una fecha:</th>
					<td>
						    <input type="hidden" id="fecha" name="fecha" required onchange="diaSemana();"/>
							<input type="text" id="fecha2" name="fecha2"  disabled/>
							<input type="text" name="day_of_week" id="day_of_week" disabled/>
							<button  name="ver" id="trigger">Fecha...</button>
		
		
					</td>
				</tr>

			   <tr>
	                   <th>Seleccionar profesor:</th>
	                   <td>
		                   <!--  <label for="horarios" >Seleccionar horario</label> -->
					         
					        <select class="form-control" id="profesores" name="profesores">
					              <option>Selecciona profesor</option>
					              <c:forEach var="profesor" items="${ListaProfesores}">
					              <option value ="${profesor.id_profesor}" ><c:out value="${profesor.getNombreCompleto()}"/></option> 
					              </c:forEach>
					        </select>
				       </td>
			   </tr>			
				<tr>
					<td colspan="2" align="center"><input type="button"
						value="Solicitar" onclick="valida()"/></td>
				</tr>
			</table>
			</div>
		</form>
	
</div>	
<script src="js/jquery.js" type="text/javascript"></script>
<!-- <script src="js/bootstrap-modal.js" type="text/javascript"></script> -->

	<script type="text/javascript">
		Calendar.setup({
			inputField : "fecha", // ID of the input field
			ifFormat : "%Y/%m/%d", // the date format     %A, %B %e, %Y       %A %d/%m/%Y    %d/%m/%Y
			button : "trigger" // ID of the button
		});
		
	
		
		
		var dias = ["Domingo","Lunes","Martes", "Miércoles", "Jueves", "Viernes", "Sábado"];

		function diaSemana() {
			var x = document.getElementById("fecha");
      let date = new Date(x.value);
      var dateString = x.value; 
      var dateParts = dateString.split("/");

  
      let fecha_fesp = document.getElementById('fecha2');
      fecha_fesp.value = dateParts[2] +'/'+ dateParts[1]   +'/'+ dateParts[0] ;
   
      let hidden = document.getElementById('day_of_week');
      hidden.value = dias[date.getDay()];//date.getDay()-1
			console.log(hidden.value);
		}
		function validacion() {
			
			var x = document.getElementById("fecha");
			let date = new Date(x.value);
			 var dateString = x.value; 
			if (validarFechaMenorActual(dateString)) {
			    // Si no se cumple la condicion...
			    alert('Debes seleccionar una fecha mayor que hoy.');
			    document.getElementById("fecha2").focus();
			    return false;
			  }
			// Si el script ha llegado a este punto, todas las condiciones
			  // se han cumplido, por lo que se devuelve el valor true
			  return true;
		}
		
		function validarFormatoFecha(campo) {
		      var RegExPattern = /^\d{1,2}\/\d{1,2}\/\d{2,4}$/;
		      if ((campo.match(RegExPattern)) && (campo!='')) {
		            return true;
		      } else {
		            return false;
		      }
		}
		function validarFechaMenorActual(date){
			
			 
		     // var x=new Date();
		      var fecha = date.split("/");
		      fecha = fecha[0]+"-"+fecha[1]+"-"+fecha[2]
		      var x=new Date(fecha);
		      //x.setFullYear(fecha[0],fecha[1],fecha[2]);
		      var today = new Date();
		 
		      if (x <= today)
		        return true;
		      else
		        return false;
		}
		
		
		
		function valida(){
			if(document.formulario.fecha.value.length==0){
				alert("Elige una fecha, utiliza el boton <Fecha>.");
				document.formulario.ver.focus();
				return;
				}
			
			
			var x = document.getElementById("fecha");
			let date = new Date(x.value);
			 var dateString = x.value; 
			if (validarFechaMenorActual(dateString)) {
			    // Si no se cumple la condicion...
			    alert('Debes seleccionar una fecha mayor que hoy.');
			    //document.getElementById("fecha2").focus();
			    document.formulario.ver.focus();
			    return ;
			  }
			
			if(document.formulario.day_of_week.value == "Sábado" || document.formulario.day_of_week.value == "Domingo"){
				alert("No hay tutorias en fin de semana, Elige otra fecha, utiliza el boton <Fecha>.");
				document.formulario.ver.focus();
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
</div>		
</body>
</html>

