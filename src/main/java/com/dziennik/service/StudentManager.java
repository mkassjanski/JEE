package com.dziennik.service;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.dziennik.domain.Student;


@Stateless
public class StudentManager {

	@PersistenceContext
	EntityManager em;
	
	public Student get(Long id){
		return em.find(Student.class, id);
	}
	
	public void add(Student student) {
		student.setId(null);
		em.persist(student);
        em.flush();
	}
	
	@SuppressWarnings("unchecked")
	public List<Student> getAllStudents() {
		return em.createNamedQuery("student.all").getResultList();
	}
}
