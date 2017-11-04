package es.ucav.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.ucav.beans.Profesor;
import es.ucav.dao.ProfesoresDAO;

/**
 * Servlet implementation class Servlet_Insertar
 */
@WebServlet("/alta_profesor")
public class Servlet_Insertar_Profesor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProfesoresDAO profesoresDAO;  
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet_Insertar_Profesor() {
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

			
			 
	        
	        
	        profesoresDAO = new ProfesoresDAO();	
	        Profesor profe =new Profesor(0,nombre,apell1,apell2,"");
			profesoresDAO.Add_Profesor(profe);
			 response.sendRedirect("listar_profes");
	
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
