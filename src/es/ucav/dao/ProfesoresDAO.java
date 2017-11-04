package es.ucav.dao;


//import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.CallableStatement;
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
import es.ucav.beans.Profesor;



public class ProfesoresDAO {
	
	//Connection conexion = null ;
	ConexionBBDD con =null;
	ResultSet resultado;
	PreparedStatement plantillaSQL=null;

	/**
	 * Constructor que hace la conexion a la base dedatos
	 * Todos los daos tiene que ser igual
	 */
	
	public ProfesoresDAO(){
		//conexion=ConexionBBDD.conectar();
		
        con =new ConexionBBDD();
       
        //conexion = con.conectar();
		
	}
	
/*	// metemos un metodo para cada accion sobre la tabla
	
	public void add(Profesor profesor){
		try {
		plantillaSQL = conexion.prepareStatement("INSERT INTO Productos VALUES (?,?,?,?)");
		
		plantillaSQL.setInt(1, producto.getId_producto());
		plantillaSQL.setString(2, producto.getDescripcion());
		plantillaSQL.setInt(3, producto.getStock());
		plantillaSQL.setInt(4, producto.getPrecio());
		
		// para depurar la sentencia sql que hemos generado
		System.out.println(plantillaSQL.toString());
		
		//ejecutar la plantilla
		plantillaSQL.execute();
		
		
		
		
		}catch (SQLException e) {
			
			     e.printStackTrace();
		}
	}	
		
		public void remove (Producto producto){
		try {
		plantillaSQL = conexion.prepareStatement("DELETE FROM Productos WHERE id_producto=?");
		
		plantillaSQL.setInt(1, producto.getId_producto());
		
		// para depurar la sentencia sql que hemos generado
		System.out.println(plantillaSQL.toString());
		
		//ejecutar la plantilla
		plantillaSQL.execute();
		
		
		
		
		}catch (SQLException e) {
			
			     e.printStackTrace();
			}
	
    	}
		
	
		public Producto busquedaId (Producto producto){
			
			Producto aux =null ;
			try {
			plantillaSQL = conexion.prepareStatement("SELECT * FROM Productos WHERE id_producto=?");
			
			plantillaSQL.setInt(1, producto.getId_producto());
			
			resultado = plantillaSQL.executeQuery();
			//imprimir la consulta que se genera
			System.out.println(plantillaSQL.toString());
			
			if (resultado.next()){
				aux=new Producto();
				aux.setId_producto(resultado.getInt("id_producto"));
				aux.setDescripcion(resultado.getString("descripcion"));
				aux.setStock(resultado.getInt("stock"));
				aux.setPrecio(resultado.getInt("precio"));
			}
			
		
			
			//ejecutar la plantilla
			//plantillaSQL.execute();
			
			
			
			
			}catch (SQLException e) {
				
				     e.printStackTrace();
				}
			return aux;
		
	    	}
		
		
public Vector list (){
			
			Vector<Producto> lista  =new Vector();
			try {
			plantillaSQL = conexion.prepareStatement("SELECT * FROM Productos ");
			
			
			
			resultado = plantillaSQL.executeQuery();
			
			while (resultado.next()){
				
				Producto producto = new Producto();
				
				producto.setId_producto(resultado.getInt("id_producto"));
				producto.setDescripcion(resultado.getString("descripcion"));
				producto.setStock(resultado.getInt("stock"));
				producto.setPrecio(resultado.getInt("precio"));
				lista.add(producto);
			}
			
		
			
			//ejecutar la plantilla
			//plantillaSQL.execute();
			
			
			
			
			}catch (SQLException e) {
				
				     e.printStackTrace();
				}
			return lista;
		
	    	}
				
		
public void modificar(Producto producto){
	try {
	plantillaSQL = conexion.prepareStatement("UPDATE Productos SET Descripcion=?,Stock =?, Precio=? where id_producto=?");
	
	plantillaSQL.setInt(4, producto.getId_producto());
	plantillaSQL.setString(1, producto.getDescripcion());
	plantillaSQL.setInt(2, producto.getStock());
	plantillaSQL.setInt(3, producto.getPrecio());
	
	// para depurar la sentencia sql que hemos generado
	System.out.println(plantillaSQL.toString());
	
	//ejecutar la plantilla
	plantillaSQL.execute();
	
	
	
	
	}catch (SQLException e) {
		
		     e.printStackTrace();
	}
}	


}



*/



public boolean Add_Profesor(Profesor profesor) throws SQLException {
	
	
/*
    String sql = "INSERT INTO book (title, author, price) VALUES (?, ?, ?)";
   
    
   // ConexionBBDD con =new ConexionBBDD();
    
    //conexion = con.conectar();
    //PreparedStatement statement =  conexion.prepareStatement(sql);
    
     
    PreparedStatement statement =  con.ObtenerConexionPool().prepareStatement(sql);
    statement.setString(1, profesor.getNombre());
    statement.setString(2, profesor.getApellido1());
    statement.setString(3, profesor.getApellido2());
     
    boolean rowInserted = statement.executeUpdate() > 0;*/
    
    
    boolean bAlta;
    int iAlta;
    iAlta=0;
    CallableStatement prcProcedimientoAlmacenado =con.ObtenerConexionPool().prepareCall("{ CALL DBAcademia.Alta_Profesores(?,?,?,?) }");
	// cargar parametros al SP
	//prcProcedimientoAlmacenado.setInt("pParametro1", 1);
	prcProcedimientoAlmacenado.setString("v_nombre", profesor.getNombre());
	prcProcedimientoAlmacenado.setString("v_apellido1", profesor.getApellido1());
	prcProcedimientoAlmacenado.setString("v_apellido2", profesor.getApellido2());
	prcProcedimientoAlmacenado.registerOutParameter("v_iAlta", iAlta);
	
	//prcProcedimientoAlmacenado.setInt("pParametro3", 49);
	// ejecutar el SP
	prcProcedimientoAlmacenado.execute();
    
    //statement.close();
	prcProcedimientoAlmacenado.close();
    con.devolverConexionPool();
    bAlta=iAlta>0;
    return bAlta;
}
 
public List<Profesor> Listar_Profesores() throws SQLException {
    List<Profesor> ListaProfesores = new ArrayList<>();
     
    String sql = "SELECT * FROM profesores";
     
    //connect();
     
    PreparedStatement statement = con.ObtenerConexionPool().prepareStatement(sql);
    ResultSet resultSet = statement.executeQuery(sql);
     
    while (resultSet.next()) {
        int l_id_profesor = resultSet.getInt("id_profesor");
        String l_nombre = resultSet.getString("nombre");
        String l_apellido1 = resultSet.getString("apellido1");
        String l_apellido2 = resultSet.getString("apellido2");
        String l_usuario = resultSet.getString("usuario");
        
        //float price = resultSet.getFloat("precio");
         
        Profesor profesor = new Profesor(l_id_profesor, l_nombre, l_apellido1, l_apellido2,l_usuario);
        ListaProfesores.add(profesor);
    }
     
    resultSet.close();
    statement.close();
    con.devolverConexionPool(); 
    //disconnect();
     
    return ListaProfesores;
 }


 
public boolean deleteProfesor(Profesor profesor) throws SQLException {
    String sql = "DELETE FROM profesores where id_profesor = ?";
  
    PreparedStatement statement = con.ObtenerConexionPool().prepareStatement(sql);
    statement.setInt(1, profesor.getId_profesor());
     
    boolean rowDeleted = statement.executeUpdate() > 0;
    statement.close();
    con.devolverConexionPool(); 
    return rowDeleted;    
}
}
 