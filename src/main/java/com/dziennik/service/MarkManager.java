package com.dziennik.service;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.dziennik.domain.Mark;
import com.dziennik.domain.Student;
@Stateless
public class MarkManager {
	
	@PersistenceContext
	EntityManager em;

	public Mark get(Long id) {
		return em.find(Mark.class, id);
	}
	
	public void add(Mark mark) {
		mark.setId(null);
		em.persist(mark);
	}

	public void edit(Mark markk, Student student, Double mark, String subject) {
		markk = em.find(Mark.class, markk.getId());
		markk.setStudent(student);
		markk.setMark(mark);
		markk.setSubject(subject);
		em.merge(markk);
	}

	public void delete(Long id) {
		//mark = em.find(Mark.class, mark.getId());
    	Mark mark = em.find(Mark.class, id);
		Student stud = em.find(Student.class, mark.getStudent().getId());
		stud.getMark().remove(mark);
		em.remove(mark);
		em.merge(stud);
	}
	
	@SuppressWarnings("unchecked")
	public List<Mark> getAllMarks() {
		return em.createNamedQuery("marks.all").getResultList();
	}
	
}
