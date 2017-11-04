package es.ucav.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.ucav.beans.Alumno;
import es.ucav.dao.AlumnosDAO;

/**
 * Servlet implementation class Servlet_Insertar
 */
@WebServlet("/alta_alumno")
public class Servlet_Insertar_Alumno extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AlumnosDAO alumnosDAO;  
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet_Insertar_Alumno() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			//System.out.println("vamos a borrar el profesor con id:" + request.getParameter("id_profesor"));
			//int id_profe = Integer.parseInt(request.getParameter("id_profesor").trim());
			 String nombre = request.getParameter("nombre");
			 String apell1 = request.getParameter("apellido1");
			 String apell2 = request.getParameter("apellido2");

			
			 
	        
	        
			alumnosDAO = new AlumnosDAO();	
	        Alumno alumno =new Alumno(0,nombre,apell1,apell2,"");
			alumnosDAO.Add_Alumno(alumno);
			 response.sendRedirect("listar_alumnos");
	
			/* 
		    RequestDispatcher dispatcher = request.getRequestDispatcher("index_admin.jsp");
	        dispatcher.forward(request, response);*/
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
