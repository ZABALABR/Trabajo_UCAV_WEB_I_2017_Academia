package es.ucav.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.ucav.beans.Asignatura;
import es.ucav.dao.AsignaturasDAO;

/**
 * Servlet implementation class Servlet_Insertar
 */
@WebServlet("/alta_asignatura")
public class Servlet_Insertar_Asignatura extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AsignaturasDAO asignaturasDAO;  
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet_Insertar_Asignatura() {
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
			 int id_profesor = Integer.parseInt(request.getParameter("profesores").trim());
			 int id_horario = Integer.parseInt(request.getParameter("horarios").trim());
			 String descripcion = request.getParameter("descripcion");
			

			
			 
	        
	        
			asignaturasDAO = new AsignaturasDAO();	
	        //Asignatura asignatura =new Asignatura(0,descripcion,"","");
			Asignatura asignatura =new Asignatura(descripcion,id_horario,id_profesor);
			asignaturasDAO.Add_Asignatura(asignatura);
			 response.sendRedirect("listar_asignaturas?vengode=''");
	
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
