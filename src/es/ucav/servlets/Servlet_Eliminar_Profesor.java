package es.ucav.servlets;

import java.io.IOException;
import java.sql.SQLException;
//import java.util.List;

import javax.servlet.RequestDispatcher;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.ucav.beans.Profesor;
import es.ucav.dao.ProfesoresDAO;

/**
 * Servlet implementation class Servlet_Eliminar
 */
@WebServlet("/eliminar_profe")
public class Servlet_Eliminar_Profesor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProfesoresDAO profesoresDAO;  
	private String s_error;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet_Eliminar_Profesor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			s_error="";
			//System.out.println("vamos a borrar el profesor con id:" + request.getParameter("id_profesor"));
			int id_profe = Integer.parseInt(request.getParameter("id_profesor").trim());
			 
	        
	        
	        profesoresDAO = new ProfesoresDAO();	
	        Profesor profe =new Profesor(id_profe);
			profesoresDAO.deleteProfesor(profe);
			 response.sendRedirect("listar_profes");
			 
			/* 
		    RequestDispatcher dispatcher = request.getRequestDispatcher("index_admin.jsp");
	        dispatcher.forward(request, response);*/
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			s_error ="No se puede borrar el profesor, al estar enlazado a una asignatura, debera eliminar la asignatura, y despues borrar el profesor.";
			//request.getSession().setAttribute("Error", s_error);
			//getServletContext().setAttribute("Error", s_error);
			request.setAttribute("Error", s_error);
			RequestDispatcher dispatcher;
			dispatcher = request.getRequestDispatcher("listar_profes");
			dispatcher.forward(request, response);
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
