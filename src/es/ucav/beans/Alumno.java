package es.ucav.beans;

public class Alumno {

	
	private int id_alumno;
	private String nombre;
	private String apellido1;
	private String apellido2;
	private String usuario;
	
	
    public Alumno() {
    }
 
    public Alumno(int id_alumno) {
    	this.id_alumno = id_alumno;
    }
 

    
    
	public Alumno(int id_alumno, String nombre, String apellido1, String apellido2, String usuario) {
		super();
		this.id_alumno = id_alumno;
		this.nombre = nombre;
		this.apellido1 = apellido1;
		this.apellido2 = apellido2;
		this.usuario= usuario;
		//this.usuario = nombre + '_' + id_alumno;
	}
	public int getId_alumno() {
		return id_alumno;
	}
	public String getNombre() {
		return nombre;
	}
	public String getApellido1() {
		return apellido1;
	}
	public String getApellido2() {
		return apellido2;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setId_alumno(int id_alumno) {
		this.id_alumno = id_alumno;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public void setApellido1(String apellido1) {
		this.apellido1 = apellido1;
	}
	public void setApellido2(String apellido2) {
		this.apellido2 = apellido2;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	
}
