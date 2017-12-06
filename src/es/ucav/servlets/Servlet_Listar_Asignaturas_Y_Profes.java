package es.ucav.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

//import javax.naming.Context;
//import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.sql.DataSource;

import es.ucav.beans.Asignatura;

//import com.google.gson.Gson;

import es.ucav.beans.Horario;
import es.ucav.beans.Profesor;
import es.ucav.dao.AsignaturasDAO;
import es.ucav.dao.HorariosDAO;
import es.ucav.dao.ProfesoresDAO;


/**
 * Servlet implementation class Servlet_Listar
 */
@WebServlet("/asignaturas_y_profes")
public class Servlet_Listar_Asignaturas_Y_Profes extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProfesoresDAO profesoresDAO;
	private AsignaturasDAO asignaturasDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
/*	
    public Servlet_Listar() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    */
	public void init() throws ServletException {
		super.init();
		try {
			 //profesoresDAO = new ProfesoresDAO();	
		} catch (Exception e) {
			throw new ServletException(e);
		}		
	}	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		List<Profesor> ListaProfesores;
		List<Asignatura> ListaAsignaturas;
		try {
			   asignaturasDAO = new AsignaturasDAO();	
				ListaAsignaturas = asignaturasDAO.Listar_Asignaturas();
				request.setAttribute("ListaAsignaturas", ListaAsignaturas);
			
			    profesoresDAO = new ProfesoresDAO();	
  			    ListaProfesores = profesoresDAO.Listar_Profesores_Sin_Asignatura();
				request.setAttribute("ListaProfesores", ListaProfesores);
				RequestDispatcher dispatcher;
		         dispatcher = request.getRequestDispatcher("asignar_profesor_asignatura.jsp");
		         dispatcher.forward(request, response);
		       
	        
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
      
    

		
		//request.getRequestDispatcher("index_admin.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
