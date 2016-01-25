package com.dziennik.api;

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

    	mm.add(markk);

       return markk;
    }
}
