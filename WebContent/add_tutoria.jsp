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

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/estilo.css" />
<title>Gestión de asignaturas</title>
<% 
    application.setAttribute("usuario", session.getAttribute("usuario"));
    application.setAttribute("id_alumno", session.getAttribute("id_alumno"));
	if(session.getAttribute("usuario")==null) {
        response.sendRedirect("index.html");
    }
%>
</head>
<body>
	<center>
		<h1>Gestión de tutorias</h1>
	</center>
	<ul id="barra">
          <li><a href="horarios_alumno">Mi horario</a></li>
	</ul>
	<br>
	<br>
	<center>
		<h2>
		
			<a href="alu_tutorias_solicitadas">Listado de tutorias</a>

		</h2>
	</center>

	<div align="center">

		<form action="alta_tutoria"  onsubmit="return validacion()" method="post">

			<table border="1" cellpadding="5">
				<caption>
					<h2>Solicitar tutoria</h2>
				</caption>

				<tr>
					<th>Elige una fecha:</th>
					<td>
						    <input type="hidden" id="fecha" name="fecha" required onchange="diaSemana();"/>
							<input type="text" id="fecha2" name="fecha2" "/>
							<input type="text" name="day_of_week" id="day_of_week"/>
							<button id="trigger">Ver...</button>
		
		
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
					<td colspan="2" align="center"><input type="submit"
						value="Solicitar" /></td>
				</tr>
			</table>
		</form>
	</div>
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/bootstrap-modal.js" type="text/javascript"></script>

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
		
	</script>
		
</body>
</html>

