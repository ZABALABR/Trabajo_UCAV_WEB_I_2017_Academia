package es.ucav.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
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

import es.ucav.beans.Alumno;
//import es.ucav.beans.Profesor;
import es.ucav.dao.AlumnosDAO;
import com.google.gson.Gson;


/**
 * Servlet implementation class Servlet_Listar
 */
@WebServlet("/guardar_alumnos_asig")
public class Servlet_Guardar_Alu_Asig extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AlumnosDAO alumnosDAO;
       
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
/*		try {
	//		 profesoresDAO = new ProfesoresDAO();	
		} catch (Exception e) {
			throw new ServletException(e);
		}		*/
	}	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//try {
		int id_asignatura = Integer.parseInt(request.getParameter("id_asignatura").trim());
		//String[] values = request.getParameterValues("alumnos");
		String values = request.getParameter("alumnos");
		// List<String> list = new ArrayList<String>();
	       
			
		    String[] valueArray = values.split(","); //split string by ,
		    //do your array stuff here, for example
		    for (String individualValue: valueArray ) {           
		        //play with individual dropdown item here, for example
		        System.out.println(individualValue);
		    }
		   
		    
			
/*			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
		
			
			 for(int i=0;i<values.length;i++)
		       {
		           out.println("<li>"+values[i]+"</li>");
		       }
			 
			 
			out.println("Guardado corrrectamente!!!!" +  values );*/
			
		    final String respuestaJSON = "{\"resultado\":\"Guardado correctamente\"}";
			
			 String json = null;
			 json = new Gson().toJson(values);
			 json = new Gson().toJson(values);
			 
			 response.setContentType("application/json");
             response.getWriter().write(respuestaJSON);
             
             
			
			/*
			 alumnosDAO = new AlumnosDAO();	
			 List<String> list = alumnosDAO.Listar_Alumnos_Asignatura(id_asignatura, "SI");
			 String json = null;
			 json = new Gson().toJson(values);
			 
			 response.setContentType("application/json");
             response.getWriter().write(json);*/
             
             
/*             response.setContentType("application/json");
             response.getWriter().write(json);*/
/*		    RequestDispatcher dispatcher = request.getRequestDispatcher("listado_alumnos.jsp");
	        dispatcher.forward(request, response);*/
			
			
		/*} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("Error al guardar!!!!");
		}*/
		
      
    

		
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
