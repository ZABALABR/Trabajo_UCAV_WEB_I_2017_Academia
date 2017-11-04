<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>


<link rel="stylesheet" href="css/estilo.css"/>  
    <title>Gestión de profesores</title>
    <% 
	if(session.getAttribute("usuario")==null) {
        response.sendRedirect("index.html");
    }
%>
</head>
<body>
    <center>
        <h1>Gestión de profesores</h1>
     </center>    
        <ul id="barra">
            <!-- <li><a href="listar">Profesores</a></li> -->
            <li><a href="listar_alumnos">Alumnos</a></li>
            <li><a href="listar_asignaturas">Asignaturas</a></li>
        </ul>
        <br>
        <br>    
    <center>        
        <h2>
   <!--          <a href="alta_profesor">Alta profesor</a>
            &nbsp;&nbsp;&nbsp; -->
            <a href="listar_profes">Listado de profesores</a>
             
        </h2>
    </center>
    
    <div align="center">

        <form action="alta_profesor" method="post">
      
        <table border="1" cellpadding="5">
            <caption>
                         
                        Alta profesor
            
            </caption>
                
            <tr>
                <th>Nombre: </th>
                <td>
                    <input type="text" name="nombre" size="45"
                            value=""
                        />
                </td>
            </tr>
            <tr>
                <th>Primer apellido: </th>
                <td>
                    <input type="text" name="apellido1" size="45"
                            value=""
                    />
                </td>
            </tr>
            <tr>
                <th>Segundo apellido: </th>
                <td>
                    <input type="text" name="apellido2" size="45"
                            value=""
                    />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Grabar" />
                </td>
            </tr>
        </table>
        </form>
    </div>   
</body>
</html>