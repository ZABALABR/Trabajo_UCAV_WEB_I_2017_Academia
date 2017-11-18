package es.ucav.beans;

public class Horario {

	
	private int id_horario;
	private String descripcion;
	public Horario(int id_horario, String descripcion) {
		super();
		this.id_horario = id_horario;
		this.descripcion = descripcion;
	}
	public int getId_horario() {
		return id_horario;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setId_horario(int id_horario) {
		this.id_horario = id_horario;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	
	
 
}

    
    

	
