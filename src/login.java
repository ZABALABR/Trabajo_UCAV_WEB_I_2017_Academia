
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DataSource source;
    
	public void init() throws ServletException {
		super.init();
		try {
			Context initCtx = new InitialContext();
			Context envCtx  = (Context) initCtx.lookup("java:comp/env");
			this.source 	= (DataSource) envCtx.lookup("jdbc/DBAcademia");			
		} catch (Exception e) {
			throw new ServletException(e);
		}		
	}	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		Connection conn	= null;
		String user = request.getParameter("login");
		String password = request.getParameter("password");
		if(user==null || password==null) 
			response.sendRedirect("index.html");
		try {
			synchronized(source) {
				conn = source.getConnection();
			}
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery("SELECT b.inicio,c.id_alumno  FROM usuarios a INNER JOIN roles  b ON (a.id_rol = b.id_rol)  LEFT JOIN alumnos c ON (a.usuario=c.usuario) where a.usuario='"+user+"' and a.contraseña='"+password+"'");
			if(rs.next()) {
				String pag_inicio = rs.getString(1);  
				 int l_id_Alumno = rs.getInt("id_alumno"); 
				HttpSession sesion = request.getSession();
				request.setAttribute("usuario", user);
				sesion.setAttribute("usuario", user);
				sesion.setAttribute("id_alumno",l_id_Alumno);
				
				//response.sendRedirect(pag_inicio);
				RequestDispatcher dispatcher;
				
				dispatcher = request.getRequestDispatcher(pag_inicio);	
		
		        dispatcher.forward(request, response);				

			}
			else response.sendRedirect("index.html");
			rs.close();
			stm.close();
			conn.close();	
		} catch (Exception ex){}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
