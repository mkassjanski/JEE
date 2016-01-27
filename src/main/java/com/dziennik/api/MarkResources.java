package com.dziennik.api;

import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.dziennik.domain.Student;
import com.dziennik.domain.Mark;
import com.dziennik.service.StudentManager;
import com.dziennik.service.MarkManager;

@Stateless
@Path("/mark")
public class MarkResources {
    @EJB
    private MarkManager mm;
    @EJB
    private StudentManager sm;

    
    @GET
    @Path("/showAll")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Mark> showAll() {
    	 return mm.getAllMarks();
    }
    
    
    @GET
    @Path("/preview/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Mark preview(@PathParam("id") long id) {
    	 return mm.get(id);
    }
    
    @POST
    @Path("/add")
    @Produces(MediaType.APPLICATION_JSON)
    public Mark add(
            @FormParam("student") Long student,
            @FormParam("mark") Double mark,
            @FormParam("subject") String subject)
    {
    	Mark markk = new Mark();

    	markk.setStudent(sm.get(student));
    	markk.setMark(mark);
    	markk.setSubject(subject);
    	markk.setCreatedAt(new Date());

    	mm.add(markk);

       return markk;
    }
    @PUT
    @Path("/edit/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Mark edit(
            @PathParam("id") Long id,
            @FormParam("student") Long student,
            @FormParam("mark") Double mark,
            @FormParam("subject") String subject)
    {
    Mark markk = new Mark();

    markk = mm.get(id);
	mm.edit(markk, sm.get(student), mark, subject);
	return markk;
    }

    @DELETE
    @Path("/delete/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public void usun(@PathParam("id") long id)
    {
        mm.delete(id);
    }
}
