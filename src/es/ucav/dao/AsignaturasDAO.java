package es.ucav.dao;


//import java.sql.Connection;
import java.sql.PreparedStatement;
//import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import java.sql.Connection;

import java.util.ArrayList;
//import java.util.Vector;

//import com.mysql.jdbc.Statement;

//import es.ucav.dao.*;
//import es.ucav.util.*;
//import es_iam.beans.Producto;
import es.ucav.util.ConexionBBDD;
import es.ucav.beans.Asignatura;



public class AsignaturasDAO {
	
	//Connection conexion = null ;
	ConexionBBDD con =null;
	ResultSet resultado;
	PreparedStatement plantillaSQL=null;

	/**
	 * Constructor que hace la conexion a la base dedatos
	 * Todos los daos tiene que ser igual
	 */
	
	public AsignaturasDAO(){
		//conexion=ConexionBBDD.conectar();
		
        con =new ConexionBBDD();
       
     
		
	}
	




public boolean Add_Asignatura(Asignatura asignatura) throws SQLException {

    String sql = "insert into DBAcademia.asignaturas ( descripcion, id_horario, id_profesor ) values ( ?,?,?) ";
    
    PreparedStatement statement = con.ObtenerConexionPool().prepareStatement(sql);
    statement.setString(1, asignatura.getDescripcion());
    statement.setInt(2, asignatura.getId_horario());
    statement.setInt(3, asignatura.getId_profesor());
     
    boolean filasInsertadas = statement.executeUpdate() > 0;
    statement.close();
    con.devolverConexionPool(); 
    return filasInsertadas;    
    
    
    

}


public boolean Asignar_Alumnos(Asignatura asignatura, String[] lista_alumnos ) throws SQLException {
	 String sql;
	Connection conexion = null;
	PreparedStatement statement1 = null;
	PreparedStatement statement2 = null;
	boolean rowInserted = false;
	try {
	        conexion=con.ObtenerConexionPool();   
	        conexion.setAutoCommit(false); 
	        
	        
	
		    //1.-borramos todos los alumnos asignados a esa asignatura para volverlos a insertar en el paso 2 con los que vienen por parametro
		   sql = "delete from DBAcademia.alumnos_asignaturas where  id_asignatura = ? ";
		    
    
		   statement1 = conexion.prepareStatement(sql);
		    statement1.setInt(1, asignatura.getId_asignatura());
		    rowInserted = statement1.executeUpdate() > 0;
		    
    //2.- recorrremos la lista de alumnos y los insertamos en la tabla alumnos_asignaturas
    if (!lista_alumnos[0].equals("")) {
		    for (String individualValue: lista_alumnos ) {           
		        //play with individual dropdown item here, for example
		        sql = "insert into DBAcademia.alumnos_asignaturas values ( ?,?) ";
		        
		        
		        statement2 = conexion.prepareStatement(sql);
		        statement2.setInt(1, asignatura.getId_asignatura());
		        statement2.setInt(2, Integer.parseInt(individualValue));
		        rowInserted = statement2.executeUpdate() > 0;
		    	
		        System.out.println(individualValue);
		    }
    }
 //  statement.setInt(1, asignatura.getId_horario());
     
    if  (rowInserted ) {
  	  conexion.commit();
      }else { 
      	 conexion.rollback();
      }
      
      
  	return rowInserted ;  
      
      
      
     
      	
      } catch (SQLException e) {

  		System.out.println(e.getMessage());
  		 conexion.rollback();
  		rowInserted  = false;
  		 return rowInserted ;  

  	} finally {
  		
  		if (statement1 != null) {
  			statement1.close();
  		}

  		if (statement2 != null) {
  			statement2.close();
  		}

  		if (conexion != null) {
  			  con.devolverConexionPool(); 
  		}

  	}
  }   
    
    


 
public List<Asignatura> Listar_Asignaturas() throws SQLException {
    List<Asignatura> ListaAsignaturas = new ArrayList<>();
     
    String sql = "SELECT a.id_asignatura AS id_asignatura, a.descripcion AS descripcion ,b.descripcion AS horario , CONCAT( c.nombre ,' ', c.apellido1, ' ', c.apellido2) AS profesor " + 
    		" FROM asignaturas a left JOIN horarios b ON (a.id_horario = b.id_horario) " + 
    		" LEFT JOIN profesores c ON (a.id_profesor = c.id_profesor) " ;
	   		//" WHERE a.id_asignatura = ?";
     
    //connect();
     
    PreparedStatement statement = con.ObtenerConexionPool().prepareStatement(sql);
    
    ResultSet resultSet = statement.executeQuery(sql);
     
    while (resultSet.next()) {
        int l_id_Asignatura = resultSet.getInt("id_asignatura");
        String l_descripcion = resultSet.getString("descripcion");
        String l_horario = resultSet.getString("horario");
        String l_profesor = resultSet.getString("profesor");
  
        
        //float price = resultSet.getFloat("precio");
         
        Asignatura asignatura= new Asignatura(l_id_Asignatura, l_descripcion, l_horario, l_profesor);
        ListaAsignaturas.add(asignatura);
    }
     
    resultSet.close();
    statement.close();
    con.devolverConexionPool(); 
    //disconnect();
     
    return ListaAsignaturas;
 }


public List<Asignatura> Listar_Asignaturas(String Usuario) throws SQLException {
    List<Asignatura> ListaAsignaturas = new ArrayList<>();
     
    String sql = "SELECT A.descripcion AS asignatura , B.descripcion AS horario " +
" FROM asignaturas A INNER JOIN horarios B ON (A.id_horario= B.id_horario) " + 
" INNER JOIN alumnos_asignaturas C ON (A.id_asignatura= C.id_asignatura) " +
" INNER JOIN alumnos D ON (C.id_alumno= D.id_alumno) " +
" WHERE D.usuario = ?" +
" ORDER BY B.id_horario";
	   		//" WHERE a.id_asignatura = ?";
     
    //connect();
     
    PreparedStatement statement = con.ObtenerConexionPool().prepareStatement(sql);
    statement.setString(1, Usuario);
    
    ResultSet resultSet = statement.executeQuery();
     
    while (resultSet.next()) {
        //int l_id_Asignatura = resultSet.getInt("id_asignatura");
        String l_descripcion = resultSet.getString("asignatura");
        String l_horario = resultSet.getString("horario");
       
  
        
        //float price = resultSet.getFloat("precio");
         
        Asignatura asignatura= new Asignatura( l_descripcion, l_horario);
        ListaAsignaturas.add(asignatura);
    }
     
    resultSet.close();
    statement.close();
    con.devolverConexionPool(); 
    //disconnect();
     
    return ListaAsignaturas;
 }



public List<Asignatura> Listar_Asignaturas_Profe(String Usuario) throws SQLException {
    List<Asignatura> ListaAsignaturas = new ArrayList<>();
     
    String sql =  "SELECT A.descripcion AS asignatura , B.descripcion AS horario  " +
    		 " FROM asignaturas A INNER JOIN horarios B ON (A.id_horario= B.id_horario) " + 
				" INNER JOIN profesores C ON (A.id_profesor = C.id_profesor) " +
				" WHERE C.usuario = ? " +
				" ORDER BY horario ";
	   		//" WHERE a.id_asignatura = ?";
     
    //connect();
     
    PreparedStatement statement = con.ObtenerConexionPool().prepareStatement(sql);
    statement.setString(1, Usuario);
    
    ResultSet resultSet = statement.executeQuery();
     
    while (resultSet.next()) {
        //int l_id_Asignatura = resultSet.getInt("id_asignatura");
        String l_descripcion = resultSet.getString("asignatura");
        String l_horario = resultSet.getString("horario");
       
  
        
        //float price = resultSet.getFloat("precio");
         
        Asignatura asignatura= new Asignatura( l_descripcion, l_horario);
        ListaAsignaturas.add(asignatura);
    }
     
    resultSet.close();
    statement.close();
    con.devolverConexionPool(); 
    //disconnect();
     
    return ListaAsignaturas;
 }



public boolean deleteAsignatura(Asignatura asignatura) throws SQLException {
	
	
    String sql = "DELETE FROM asignaturas where id_asignatura = ?";
   
    
    PreparedStatement statement = con.ObtenerConexionPool().prepareStatement(sql);
    statement.setInt(1, asignatura.getId_asignatura());
     
    boolean rowDeleted = statement.executeUpdate() > 0;
    statement.close();
    con.devolverConexionPool(); 
    return rowDeleted;    

}  


public boolean Asignar_profe_Asignatura(int id_profesor, int id_asignatura) throws SQLException {
	
	
    String sql = "UPDATE asignaturas SET id_profesor = ? where id_asignatura = ?";
   
    
    PreparedStatement statement = con.ObtenerConexionPool().prepareStatement(sql);
    statement.setInt(1, id_profesor);
    statement.setInt(2, id_asignatura);
     
    boolean rowUpdate = statement.executeUpdate() > 0;
    statement.close();
    con.devolverConexionPool(); 
    return rowUpdate;    

}  



}

 