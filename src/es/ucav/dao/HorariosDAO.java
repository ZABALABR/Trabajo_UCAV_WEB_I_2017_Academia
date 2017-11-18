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

import es.ucav.beans.Horario;



public class HorariosDAO {
	
	//Connection conexion = null ;
	ConexionBBDD con =null;
	ResultSet resultado;
	PreparedStatement plantillaSQL=null;

	/**
	 * Constructor que hace la conexion a la base de datos
	 * Todos los daos tiene que ser igual
	 */
	
	public HorariosDAO(){
		//conexion=ConexionBBDD.conectar();
		
        con =new ConexionBBDD();
       
        //conexion = con.conectar();
		
	}
	




public boolean Add_Horario(Horario horario) throws SQLException {
	
	

    
    String sql = "insert into DBAcademia.horarios ( descripcion ) values ( ?) ";
    
    PreparedStatement statement = con.ObtenerConexionPool().prepareStatement(sql);
    statement.setString(1, horario.getDescripcion());
 //  statement.setInt(1, asignatura.getId_horario());
     
    boolean filasInsertadas = statement.executeUpdate() > 0;
    statement.close();
    con.devolverConexionPool(); 
    return filasInsertadas;  
}
 
public List<Horario> Listar_Horarios() throws SQLException {
    List<Horario> ListaHorarios = new ArrayList<>();
     
    String sql = "SELECT * FROM horarios";
     
    //connect();
     
    PreparedStatement statement = con.ObtenerConexionPool().prepareStatement(sql);
    ResultSet resultSet = statement.executeQuery(sql);
     
    while (resultSet.next()) {
        int l_id_horario = resultSet.getInt("id_horario");
        String l_descripcion = resultSet.getString("descripcion");

        //float price = resultSet.getFloat("precio");
         
        Horario horario = new Horario(l_id_horario, l_descripcion);
        ListaHorarios.add(horario);
    }
     
    resultSet.close();
    statement.close();
    con.devolverConexionPool(); 
    //disconnect();
     
    return ListaHorarios;
 }






    
  
     
   
public boolean deleteHorario(Horario horario) throws SQLException {
	
	
    String sql = "DELETE FROM horarios where id_horario = ?";
   
    
    PreparedStatement statement = con.ObtenerConexionPool().prepareStatement(sql);
    statement.setInt(1, horario.getId_horario());
     
    boolean rowDeleted = statement.executeUpdate() > 0;
    statement.close();
    con.devolverConexionPool(); 
    return rowDeleted;    
}  
}

 