
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;

import es.ucav.util.ConexionBBDD;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private DataSource source;
	private ConexionBBDD conn ;
    
	public void init() throws ServletException {
		super.init();
		try {
			/*Context initCtx = new InitialContext();
			Context envCtx  = (Context) initCtx.lookup("java:comp/env");
			this.source 	= (DataSource) envCtx.lookup("jdbc/DBAcademia");		*/
			this.conn =null;
		} catch (Exception e) {
			throw new ServletException(e);
		}		
	}	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	    ConexionBBDD conn =null;
        conn =new ConexionBBDD();
        
		/*Connection conn	= null;*/
		String user = request.getParameter("login");
		String password = request.getParameter("password");
		if(user==null || password==null) 
			response.sendRedirect("index.html");
		try {
			
			Statement stm = conn.ObtenerConexionPool().createStatement();
			ResultSet rs = stm.executeQuery("SELECT b.inicio,c.id_alumno,d.id_profesor   FROM usuarios a INNER JOIN roles  b ON (a.id_rol = b.id_rol)  LEFT JOIN alumnos c ON (a.usuario=c.usuario) LEFT JOIN profesores d ON  (a.usuario=d.usuario) where a.usuario='"+user+"' and a.contraseña='"+password+"'");
			if(rs.next()) {
				String pag_inicio = rs.getString(1);  
				 int l_id_Alumno = rs.getInt("id_alumno"); 
				 int l_id_Profesor = rs.getInt("id_profesor");
				HttpSession sesion = request.getSession();
				request.setAttribute("usuario", user);
				sesion.setAttribute("usuario", user);
				sesion.setAttribute("id_alumno",l_id_Alumno);
				sesion.setAttribute("id_profesor",l_id_Profesor);
				
				//response.sendRedirect(pag_inicio);
				RequestDispatcher dispatcher;
				
				dispatcher = request.getRequestDispatcher(pag_inicio);	
		
		        dispatcher.forward(request, response);				

			}
			else response.sendRedirect("index.html");
			rs.close();
			stm.close();
			conn.devolverConexionPool(); 	
		} catch (Exception ex){}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
}
