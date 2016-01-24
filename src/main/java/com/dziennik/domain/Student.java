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
	private String firstName;
	private String lastName;
	private Long indexNumber;
	
	
	public Student(){
		
	}
	
	public Student(String firstName, String lastName, Long indexNumber ){
		this.firstName = firstName;
		this.lastName = lastName;
		this.indexNumber = indexNumber;
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
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public Long getIndexNumber() {
		return indexNumber;
	}
	public void setIndexNumber(Long indexNumber) {
		this.indexNumber = indexNumber;
	}
	
}
