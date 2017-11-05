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
<title>Asignar alumnos a una asignatura</title>
</head>


<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/estilo.css" />
<script src="js/jquery-1.11.1.js" type="text/javascript"></script>

<script>
$(document).ready(function() {

$('#asignaturas').change(function(event) {
        var asignaturas = $("select#asignaturas").val();
        $.get('alumnos_asignatura', {
                id_asignatura : asignaturas,
                En : "SI"
        }, function(response) {

        var select = $('#alumnos');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        });
        });
});
</script>
</head>
<body>
<h3>Asignar alumnos a una asignatura</h3>
        Seleccionar la asignatura:
        <select id="asignaturas">
              <option>Selecciona la asignatura</option>
              <c:forEach var="asignatura" items="${ListaAsignaturas}">
              <option value ="${asignatura.id_asignatura}" ><c:out value="${asignatura.descripcion}"/></option> 
              </c:forEach>
        </select>
        <br /> <br /> 
        Alumnos a asignar:
        <select id="alumnos">
                <option>Selecciona alumno</option>
        </select>
</body>
</html>