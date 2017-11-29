package es.ucav.beans;

public class Tutoria {

	
	//private int id_tutoria;
	private String fecha;
	private int id_profesor;
	private int id_alumno;
	private int id_estado;
	
	private String profesor;
	private String alumno;
	private String estado;
	public Tutoria(String fecha, int id_profesor, int id_alumno, int id_estado, String profesor, String alummno,
			String estado) {
		super();
		this.fecha = fecha;
		this.id_profesor = id_profesor;
		this.id_alumno = id_alumno;
		this.id_estado = id_estado;
		this.profesor = profesor;
		this.alumno = alummno;
		this.estado = estado;
	}
	public String getFecha() {
		return fecha;
	}
	public int getId_profesor() {
		return id_profesor;
	}
	public int getId_alumno() {
		return id_alumno;
	}
	public int getId_estado() {
		return id_estado;
	}
	public String getProfesor() {
		return profesor;
	}
	public String getAlumno() {
		return alumno;
	}
	public String getEstado() {
		return estado;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public void setId_profesor(int id_profesor) {
		this.id_profesor = id_profesor;
	}
	public void setId_alumno(int id_alumno) {
		this.id_alumno = id_alumno;
	}
	public void setId_estado(int id_estado) {
		this.id_estado = id_estado;
	}
	public void setProfesor(String profesor) {
		this.profesor = profesor;
	}
	public void setAlumno(String alummno) {
		this.alumno = alummno;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	
	
	
 
}

    
    

	
