package es.ucav.util;
import java.sql.SQLException;

//import java.io.*;
import java.sql.Connection;

//import java.sql.ResultSet;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//import org.apache.commons.dbcp.BasicDataSource;


public class ConexionBBDD {

//	private DataSource dataSource=null;
//	private BasicDataSource basicDataSource=null;
	
//	private static final long serialVersionUID = 1L;
	private DataSource source;
	
	
	private Connection conexion =null;
		
		public ConexionBBDD (){
			try {
		
				
				Context initCtx = new InitialContext();
				//Context envCtx  = (Context) initCtx.lookup("java:comp/env");
				//this.source 	= (DataSource) envCtx.lookup("jdbc/DBAcademia");	
				this.source = (DataSource) initCtx.lookup("java:comp/env/jdbc/DBAcademia");	
				//System.out.println ("PASO 1: Cargamos driver de bbdd mysql");
				
/*				basicDataSource=new BasicDataSource();
				
				basicDataSource.setDriverClassName("com.mysql.jdbc.Driver");
				basicDataSource.setUsername("admin");
				basicDataSource.setPassword("admin");
				basicDataSource.setUrl("jdbc:mysql://192.168.114.128/DBAcademia");
				basicDataSource.setMaxActive(50);
				basicDataSource.setMaxIdle(50);
				basicDataSource.setRemoveAbandoned(true);
				basicDataSource.setRemoveAbandonedTimeout(5000);
				basicDataSource.setMaxWait(6000);
				
				source=basicDataSource;
				conexion=source.getConnection();*/
				
				//Class.forName("com.mysql.jdbc.Driver");
				
				//System.out.println("PASO 2: Conexion a base de datos");
				//conexion=DriverManager.getConnection("jdbc:mysql://localhost/DBAcademia?user=admin&password=admin");
				
				synchronized(source) {
					conexion = source.getConnection();
				}				
				
		
				
			}
			catch(SQLException ex)
			{
				System.out.println("SqlException "+ex.getMessage());
			}
			catch(Exception ex)
			{
				System.out.println("Exception "+ex.getMessage());
			}
			// return conexion;
		
		}
		
		public void devolverConexionPool()
		{
			if(conexion!=null)
			{
				try
				{
					conexion.close();
					conexion=null;
				}
				catch(Exception ex)
				{
					System.out.println("Error al cerrar la conexión "+ex.getMessage());
				}
			}
		}
		
		public Connection ObtenerConexionPool() {
			return conexion;
		}
	}

