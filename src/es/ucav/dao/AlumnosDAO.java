package es.ucav.dao;


import java.sql.Connection;
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
import es.ucav.beans.Alumno;



public class AlumnosDAO {
	
	//Connection conexion = null ;
	ConexionBBDD con =null;
	ResultSet resultado;
	PreparedStatement plantillaSQL=null;

	/**
	 * Constructor que hace la conexion a la base dedatos
	 * Todos los daos tiene que ser igual
	 */
	
	public AlumnosDAO(){
		//conexion=ConexionBBDD.conectar();
		
        con =new ConexionBBDD();
       
        //conexion = con.conectar();
		
	}
	
/*	// metemos un metodo para cada accion sobre la tabla
	
	public void add(Alumno Alumno){
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



public boolean Add_Alumno(Alumno Alumno) throws SQLException {
	
	
/*
    String sql = "INSERT INTO book (title, author, price) VALUES (?, ?, ?)";
   
    
   // ConexionBBDD con =new ConexionBBDD();
    
    //conexion = con.conectar();
    //PreparedStatement statement =  conexion.prepareStatement(sql);
    
     
    PreparedStatement statement =  con.ObtenerConexionPool().prepareStatement(sql);
    statement.setString(1, Alumno.getNombre());
    statement.setString(2, Alumno.getApellido1());
    statement.setString(3, Alumno.getApellido2());
     
    boolean rowInserted = statement.executeUpdate() > 0;*/
    
    
    boolean bAlta;
    int iAlta;
    iAlta=0;
    CallableStatement prcProcedimientoAlmacenado =con.ObtenerConexionPool().prepareCall("{ CALL DBAcademia.Alta_Alumnos(?,?,?,?) }");
	// cargar parametros al SP
	//prcProcedimientoAlmacenado.setInt("pParametro1", 1);
	prcProcedimientoAlmacenado.setString("v_nombre", Alumno.getNombre());
	prcProcedimientoAlmacenado.setString("v_apellido1", Alumno.getApellido1());
	prcProcedimientoAlmacenado.setString("v_apellido2", Alumno.getApellido2());
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
 
public List<Alumno> Listar_Alumnos() throws SQLException {
    List<Alumno> ListaAlumnos = new ArrayList<>();
     
    String sql = "SELECT * FROM alumnos";
     
    //connect();
     
    PreparedStatement statement = con.ObtenerConexionPool().prepareStatement(sql);
    ResultSet resultSet = statement.executeQuery(sql);
     
    while (resultSet.next()) {
        int l_id_Alumno = resultSet.getInt("id_alumno");
        String l_nombre = resultSet.getString("nombre");
        String l_apellido1 = resultSet.getString("apellido1");
        String l_apellido2 = resultSet.getString("apellido2");
        String l_usuario = resultSet.getString("usuario");
        
        //float price = resultSet.getFloat("precio");
         
        Alumno alumno = new Alumno(l_id_Alumno, l_nombre, l_apellido1, l_apellido2,l_usuario);
        ListaAlumnos.add(alumno);
    }
     
    resultSet.close();
    statement.close();
    con.devolverConexionPool(); 
    //disconnect();
     
    return ListaAlumnos;
 }


public List<String> Listar_Alumnos_Asignatura(int id_asignatura, String sEn) throws SQLException {
	List<String> list = new ArrayList<String>();

    String sql;
if (sEn.equals("SI")){
	sql = " SELECT a.id_alumno, nombre, apellido1, apellido2 FROM alumnos a LEFT JOIN alumnos_asignaturas  b ON (a.id_alumno=b.id_alumno) WHERE b.id_asignatura = ? ";
}
else{
	sql = " SELECT a.id_alumno, nombre, apellido1, apellido2 FROM alumnos a LEFT JOIN alumnos_asignaturas  b ON (a.id_alumno=b.id_alumno) WHERE b.id_asignatura <> ?  or b.id_asignatura IS NULL";
}


    
  
     
    //connect();
     
    PreparedStatement statement = con.ObtenerConexionPool().prepareStatement(sql);
    statement.setInt(1, id_asignatura);
    ResultSet resultSet = statement.executeQuery();
     
    while (resultSet.next()) {
        int l_id_Alumno = resultSet.getInt("id_alumno");
        String l_nombre = resultSet.getString("nombre");
        String l_apellido1 = resultSet.getString("apellido1");
        String l_apellido2 = resultSet.getString("apellido2");
        //String l_usuario = resultSet.getString("usuario");
       

        
        list.add(l_id_Alumno +":" + l_nombre + " " + l_apellido1 + " " + l_apellido2 );
    }
     
    resultSet.close();
    statement.close();
    con.devolverConexionPool(); 
    //disconnect();
     
    return list;
 }
 
public boolean deleteAlumno(Alumno alumno) throws SQLException {
	
	
    String sql = "DELETE FROM alumnos where id_alumno = ?";
    Connection conexion = null;
    PreparedStatement statement1 = null;
    PreparedStatement statement2 = null;
    boolean rowDeleted = false;
    
    
    try {
    conexion=con.ObtenerConexionPool();   
    conexion.setAutoCommit(false); 
     
    statement1 = conexion.prepareStatement(sql);
    statement1.setInt(1, alumno.getId_alumno());   
    rowDeleted = statement1.executeUpdate() > 0;
    
    sql = "DELETE FROM usuarios where usuario = ?";
    statement2 = conexion.prepareStatement(sql);
    statement2.setString(1, alumno.getUsuario());   
    rowDeleted = statement2.executeUpdate() > 0;    
    
    
    if  (rowDeleted) {
	  conexion.commit();
    }else { 
    	 conexion.rollback();
    }
    
    
	return rowDeleted;  
    
    
    
   
    	
    } catch (SQLException e) {

		System.out.println(e.getMessage());
		 conexion.rollback();
		 rowDeleted = false;
		 return rowDeleted;  

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
}

 