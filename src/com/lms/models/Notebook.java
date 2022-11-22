package com.lms.models;

public class Notebook {
	int id;
	int student_id;
	String name;
	int notes = 0;
	public int getId() {
		return id;
	}
	public Notebook(int id, int student_id, String name, int notes) {
		super();
		this.id = id;
		this.student_id = student_id;
		this.name = name;
		this.notes = notes;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStudent_id() {
		return student_id;
	}
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNotes() {
		return notes;
	}
	public void setNotes(int notes) {
		this.notes = notes;
	}
	@Override
	public String toString() {
		return "Notebook [id=" + id + ", student_id=" + student_id + ", name=" + name + ", notes=" + notes + "]";
	}
		
}
