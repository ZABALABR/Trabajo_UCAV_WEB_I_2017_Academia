package es.ucav.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
//import java.util.List;

import javax.servlet.RequestDispatcher;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.ucav.beans.Asignatura;
import es.ucav.dao.AsignaturasDAO;

/**
 * Servlet implementation class Servlet_Eliminar
 */
@WebServlet("/eliminar_asignatura")
public class Servlet_Eliminar_Asignatura extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AsignaturasDAO asignaturasDAO;  
	private String s_error;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet_Eliminar_Asignatura() {
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
			int id_asignatura = Integer.parseInt(request.getParameter("id_asignatura").trim());
			
	        
	        asignaturasDAO = new AsignaturasDAO();	
	        Asignatura asignatura =new Asignatura(id_asignatura);
			asignaturasDAO.deleteAsignatura(asignatura);
			 response.sendRedirect("listar_asignaturas?vengode=''");
			 
			/* 
		    RequestDispatcher dispatcher = request.getRequestDispatcher("index_admin.jsp");
	        dispatcher.forward(request, response);*/
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			s_error ="No se puede borrar la asignatura, verifique que no tiene alumnos asignados";
			//request.getSession().setAttribute("Error", s_error);
			//getServletContext().setAttribute("Error", s_error);
			request.setAttribute("Error", s_error);
			RequestDispatcher dispatcher;
			//response.sendRedirect("listar_asignaturas?vengode=''");
			dispatcher = request.getRequestDispatcher("listar_asignaturas?vengode=''");
					
		    dispatcher.forward(request, response);
			//if (e.getSQLState() == 475){
	/*			PrintWriter out = response.getWriter();  
				   out.println("<script type=\"text/javascript\">");
				   out.println("alert('No puede borrar esta asignatura, revise que no tiene asignado alumnos');");
				   out.println("location='listado_asignaturas.jsp';");
				   out.println("</script>");
				   response.sendRedirect("listar_asignaturas?vengode=''");*/
			//}
			//sendErrorRedirect(request, response, "/error.jsp", e);
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
