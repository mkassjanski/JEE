package com.dziennik.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;

@Entity
@NamedQuery(name = "student.all", query = "Select s from Student s order by s.id")
public class Student {

	private Long id;
	private String FirstName;
	private String LastName;
	private Long IndexNumber;
	
	
	public Student(){
		
	}
	
	public Student(String FirstName, String LastName, Long IndexNumber ){
		this.FirstName = FirstName;
		this.LastName = LastName;
		this.IndexNumber = IndexNumber;
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getFirstName() {
		return FirstName;
	}
	public void setFirstName(String firstName) {
		FirstName = firstName;
	}
	public String getLastName() {
		return LastName;
	}
	public void setLastName(String lastName) {
		LastName = lastName;
	}
	public Long getIndexNumber() {
		return IndexNumber;
	}
	public void setIndexNumber(Long indexNumber) {
		IndexNumber = indexNumber;
	}
	
}
