package es.ucav.beans;

public class Asignatura {

	
	private int id_asignatura;
	private String descripcion;
	//private int id_horario;
	private String horario;
	private String profesor;
	
	
	
	
    public Asignatura() {
    }
 
    public Asignatura(int id_asignatura) {
    	this.id_asignatura = id_asignatura;
    }

	public Asignatura(int id_asignatura, String descripcion, String horario, String profesor) {
		super();
		this.id_asignatura = id_asignatura;
		this.descripcion = descripcion;
		this.horario = horario;
		this.profesor = profesor;
	}

	public int getId_asignatura() {
		return id_asignatura;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public String getHorario() {
		return horario;
	}

	public String getProfesor() {
		return profesor;
	}

	public void setId_asignatura(int id_asignatura) {
		this.id_asignatura = id_asignatura;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public void setHorario(String horario) {
		this.horario = horario;
	}

	public void setProfesor(String profesor) {
		this.profesor = profesor;
	}



	


	
}
