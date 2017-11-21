package es.ucav.beans;

public class Asignatura {

	
	private int id_asignatura;
	private String descripcion;
	//private int id_horario;
	private String horario;
	private String profesor;
	
	private int id_horario;
	private int id_profesor;
	
	
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
	public Asignatura( String descripcion, String horario) {
		super();
		
		this.descripcion = descripcion;
		this.horario = horario;
		
	}
	public int getId_horario() {
		return this.id_horario;
	}

	public int getId_profesor() {
		return this.id_profesor;
	}

	public void setId_horario(int id_horario) {
		this.id_horario = id_horario;
	}

	public void setId_profesor(int id_profesor) {
		this.id_profesor = id_profesor;
	}

	public Asignatura(String descripcion, int id_horario, int id_profesor) {
		super();
		this.descripcion = descripcion;
		this.id_horario = id_horario;
		this.id_profesor = id_profesor;
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
