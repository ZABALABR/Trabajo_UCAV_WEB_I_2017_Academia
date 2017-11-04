package es.ucav.servlets;

import java.io.IOException;
import java.sql.SQLException;
//import java.util.List;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.ucav.beans.Alumno;
import es.ucav.dao.AlumnosDAO;

/**
 * Servlet implementation class Servlet_Eliminar
 */
@WebServlet("/eliminar_alumno")
public class Servlet_Eliminar_Alumno extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AlumnosDAO alumnosDAO;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet_Eliminar_Alumno() {
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
			int id_alumno = Integer.parseInt(request.getParameter("id_alumno").trim());
			 String usuario = request.getParameter("usuario").trim();
			//String usuario="";
			 System.out.println ("aki llege");
	        
	        alumnosDAO = new AlumnosDAO();	
	        Alumno alumno =new Alumno(id_alumno,"","","",usuario);
			alumnosDAO.deleteAlumno(alumno);
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
