package es.ucav.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import es.ucav.beans.Asignatura;
import es.ucav.beans.Tutoria;
import es.ucav.dao.AsignaturasDAO;
import es.ucav.dao.TutoriasDAO;

/**
 * Servlet implementation class Servlet_Insertar
 */
@WebServlet("/actualizar_estado_tutoria")
public class Servlet_Actualizar_Tutoria extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TutoriasDAO tutoriasDAO;  
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet_Actualizar_Tutoria() {
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
			 int id_profesor = Integer.parseInt(request.getParameter("id_profesor").trim());
			 int id_alumno = Integer.parseInt(request.getParameter("id_alumno").trim());
			 int estado = Integer.parseInt(request.getParameter("estado").trim()); 
			 String fecha = request.getParameter("fecha").trim();
			
			
			
		     
			
			 
	        
	        
			tutoriasDAO = new TutoriasDAO();	
	        //Asignatura asignatura =new Asignatura(0,descripcion,"","");
			Tutoria tutoria =new Tutoria( fecha,  id_profesor, id_alumno, estado, "", "",
					"");
			tutoriasDAO.Actualizar_Estado_Tutoria(tutoria);
			 response.sendRedirect("profe_tutorias_pendientes");
	
			/* 
		    RequestDispatcher dispatcher = request.getRequestDispatcher("index_admin.jsp");
	        dispatcher.forward(request, response);*/
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			// TODO Auto-generated catch block
						sendErrorRedirect(request, response, "/error.jsp", e);
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
	 protected void sendErrorRedirect(HttpServletRequest request, HttpServletResponse response, String errorPageURL, Throwable e) {
	      try {
	            request.setAttribute ("javax.servlet.jsp.jspException", e);
	            getServletConfig().getServletContext().getRequestDispatcher(errorPageURL).forward(request, response);
	      } catch (Exception ex) {
	            //putError("serXXXXX.sendErrorRedirect ", ex);
	    	  ex.printStackTrace();
	      }
	  }	


}
