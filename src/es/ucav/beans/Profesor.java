package es.ucav.beans;

public class Profesor {

	
	private int id_profesor;
	private String nombre;
	private String apellido1;
	private String apellido2;
	private String usuario;
	
	
    public Profesor() {
    }
 
    public Profesor(int id_profesor) {
    	this.id_profesor = id_profesor;
    }
 

    
    
	public Profesor(int id_profesor, String nombre, String apellido1, String apellido2, String usuario) {
		super();
		this.id_profesor = id_profesor;
		this.nombre = nombre;
		this.apellido1 = apellido1;
		this.apellido2 = apellido2;
		this.usuario= usuario;
		//this.usuario = nombre + '_' + id_profesor;
	}
	public int getId_profesor() {
		return id_profesor;
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
	public void setId_profesor(int id_profesor) {
		this.id_profesor = id_profesor;
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
