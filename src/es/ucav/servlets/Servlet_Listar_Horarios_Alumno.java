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
import javax.servlet.http.HttpSession;

import es.ucav.beans.Asignatura;
//import es.ucav.beans.Profesor;
import es.ucav.dao.AsignaturasDAO;

/**
 * Servlet implementation class Servlet_Listar
 */
@WebServlet("/horarios_alumno")
public class Servlet_Listar_Horarios_Alumno extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AsignaturasDAO asignaturasDAO;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	/*
	 * public Servlet_Listar() { super(); // TODO Auto-generated constructor stub }
	 * 
	 */
	public void init() throws ServletException {
		super.init();
		/*
		 * try { // profesoresDAO = new ProfesoresDAO(); } catch (Exception e) { throw
		 * new ServletException(e); }
		 */
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession();
		String usuario = (String) session.getAttribute("usuario");

		// String usuario = (String)request.getAttribute("usuario");

		List<Asignatura> ListaHorario;
		try {
			asignaturasDAO = new AsignaturasDAO();
			ListaHorario = asignaturasDAO.Listar_Asignaturas(usuario);
			request.setAttribute("ListaHorario", ListaHorario);
			RequestDispatcher dispatcher;

			dispatcher = request.getRequestDispatcher("index_alumno.jsp");

			dispatcher.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			sendErrorRedirect(request, response, "/error.jsp", e);
			e.printStackTrace();
		}

		// request.getRequestDispatcher("index_admin.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	protected void sendErrorRedirect(HttpServletRequest request, HttpServletResponse response, String errorPageURL,
			Throwable e) {
		try {
			request.setAttribute("javax.servlet.jsp.jspException", e);
			getServletConfig().getServletContext().getRequestDispatcher(errorPageURL).forward(request, response);
		} catch (Exception ex) {
			// putError("serXXXXX.sendErrorRedirect ", ex);
			ex.printStackTrace();
		}
	}

}
