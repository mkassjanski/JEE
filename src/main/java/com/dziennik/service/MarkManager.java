package com.dziennik.service;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.dziennik.domain.Mark;
//import com.dziennik.domain.Student;
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

	
	@SuppressWarnings("unchecked")
	public List<Mark> getAllMarks() {
		return em.createNamedQuery("marks.all").getResultList();
	}
	
}
