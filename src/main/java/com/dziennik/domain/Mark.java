package com.dziennik.domain;

import javax.persistence.*;
import java.util.Date;


@Entity
@NamedQueries({ 
	@NamedQuery(name = "marks.all", query = "Select m from Mark m order by m.id")
})
public class Mark {
	private Long id;
 	private Student student;
	private Double mark;
	private String subject;
    
    public Mark() {
   	}
    
    public Mark(Student student, Double mark, String subject ) {
    	this.student=student;
    	this.mark=mark;
    	this.subject=subject;
    }

    
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	@ManyToOne
	@JoinColumn(name = "id_student", nullable = false)
	public Student getStudent() {
	return student;
	}
	
	public void setStudent(Student student) { 
		this.student = student; 
	}

	public Double getMark() {
		return mark;
	}

	public void setMark(Double mark) {
		this.mark = mark;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

    
}
