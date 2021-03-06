package es.ucav.dao;


// import java.sql.Connection;
import java.sql.PreparedStatement;
//import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
//import java.util.Vector;

//import com.mysql.jdbc.Statement;

//import es.ucav.dao.*;
//import es.ucav.util.*;
//import es_iam.beans.Producto;
import es.ucav.util.ConexionBBDD;


import es.ucav.beans.Tutoria;



public class TutoriasDAO {
	
	//Connection conexion = null ;
	ConexionBBDD con =null;
	ResultSet resultado;
	PreparedStatement plantillaSQL=null;

	/**
	 * Constructor que hace la conexion a la base de datos
	 * Todos los daos tiene que ser igual
	 */
	
	public TutoriasDAO(){
		//conexion=ConexionBBDD.conectar();
		
        con =new ConexionBBDD();
       
        //conexion = con.conectar();
		
	}
	




public boolean Add_Tutoria(Tutoria tutoria) throws SQLException {
	
	

    
    String sql = "insert into DBAcademia.tutorias values ( ?,?,?,?) ";
    
    PreparedStatement statement = con.ObtenerConexionPool().prepareStatement(sql);
    statement.setString(1, tutoria.getFecha());
    statement.setInt(2, tutoria.getId_profesor());
    statement.setInt(3, tutoria.getId_alumno());
    statement.setInt(4, tutoria.getId_estado());
    
 //  statement.setInt(1, asignatura.getId_horario());
     
    boolean filasInsertadas = statement.executeUpdate() > 0;
    statement.close();
    con.devolverConexionPool(); 
    return filasInsertadas;  
}
 
public List<Tutoria> Listar_Tutorias(String usuario) throws SQLException {
    List<Tutoria> ListaTutorias = new ArrayList<>();
     
    String sql = "SELECT a.fecha AS fecha,CONCAT(c.nombre, ' ' , c.apellido1, ' ',  c.apellido2) AS profesor , d.estado FROM tutorias a INNER JOIN alumnos b ON (a.id_alumno=b.id_alumno) " + 
    		" INNER JOIN profesores c ON (a.id_profesor = c.id_profesor) " + 
    		" INNER JOIN estados d ON (a.id_estado = d.id_estado) " + 
    		" WHERE b.usuario = ? AND fecha >= NOW() ";
     
    //connect();
     
    PreparedStatement statement = con.ObtenerConexionPool().prepareStatement(sql);
    statement.setString(1,usuario);
    ResultSet resultSet = statement.executeQuery();
     
    while (resultSet.next()) {
    	String l_fecha = resultSet.getString("fecha");
    	String l_profesor = resultSet.getString("profesor");
    	//String l_alumno = resultSet.getString("alumno");
    	String l_estado = resultSet.getString("estado");
    	
         
        Tutoria tutoria = new Tutoria(l_fecha, 0, 0, 0, l_profesor,"", l_estado);
        ListaTutorias.add(tutoria);
    }
     
    resultSet.close();
    statement.close();
    con.devolverConexionPool(); 
    //disconnect();
     
    return ListaTutorias;
 }

public List<Tutoria> Listar_Tutorias_Profe(String usuario) throws SQLException {
    List<Tutoria> ListaTutorias = new ArrayList<>();
     
    String sql = "SELECT a.fecha AS fecha,CONCAT(b.nombre, ' ' , b.apellido1, ' ',  b.apellido2) AS alumno, b.id_alumno ,c.id_profesor, d.estado FROM tutorias a INNER JOIN alumnos b ON (a.id_alumno=b.id_alumno) " + 
    		" INNER JOIN profesores c ON (a.id_profesor = c.id_profesor) " + 
    		" INNER JOIN estados d ON (a.id_estado = d.id_estado) " + 
    		" WHERE c.usuario = ? AND fecha >= NOW() ";
     
    //connect();
     
    PreparedStatement statement = con.ObtenerConexionPool().prepareStatement(sql);
    statement.setString(1,usuario);
    ResultSet resultSet = statement.executeQuery();
     
    while (resultSet.next()) {
    	String l_fecha = resultSet.getString("fecha");
    	String l_alumno = resultSet.getString("alumno");
    	//String l_alumno = resultSet.getString("alumno");
    	String l_estado = resultSet.getString("estado");
    	int l_id_Alumno = resultSet.getInt("id_alumno");
    	int l_id_profesor = resultSet.getInt("id_profesor");
    	
         
        Tutoria tutoria = new Tutoria(l_fecha, l_id_profesor,l_id_Alumno, 0, "",l_alumno, l_estado);
        ListaTutorias.add(tutoria);
    }
     
    resultSet.close();
    statement.close();
    con.devolverConexionPool(); 
    //disconnect();
     
    return ListaTutorias;
 }



// falta meter la rutina de actualizar tutoria......

public boolean Actualizar_Estado_Tutoria(Tutoria tutoria ) throws SQLException {
	
	
    String sql = "UPDATE tutorias SET id_estado=?  WHERE fecha = ? AND id_profesor=? AND id_alumno=?;";
   
    
    PreparedStatement statement = con.ObtenerConexionPool().prepareStatement(sql);
    statement.setInt(1, tutoria.getId_estado());
    statement.setString(2, tutoria.getFecha());
    statement.setInt(3, tutoria.getId_profesor());
    statement.setInt(4, tutoria.getId_alumno());
     
    boolean rowUpdate = statement.executeUpdate() > 0;
    statement.close();
    con.devolverConexionPool(); 
    return rowUpdate;    
}  
}    
  
     
   



 