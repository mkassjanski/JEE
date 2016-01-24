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
	
	public void update(Student student, String firstName, String lastName, Long indexNumber) {
		student = em.find(Student.class, student.getId());
		student.setFirstName(firstName);
		student.setLastName(lastName);
		student.setIndexNumber(indexNumber);
		em.merge(student);
	}
	
    public void delete(Long id) {
    	Student student = em.find(Student.class, id);
        em.remove(student);
    }
    
	@SuppressWarnings("unchecked")
	public List<Student> getAllStudents() {
		return em.createNamedQuery("student.all").getResultList();
	}
}
