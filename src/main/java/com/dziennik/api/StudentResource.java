package com.dziennik.api;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.dziennik.domain.Student;
import com.dziennik.service.StudentManager;


@Stateless
@Path("/student")
public class StudentResource {
    @EJB
    private StudentManager sm;
    
    @GET
    @Path("/showAll")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Student> showAll() {
    	 return sm.getAllStudents();
    }

    @POST
    @Path("/add")
    @Produces(MediaType.APPLICATION_JSON)
    public Student add(
            @FormParam("FirstName") String FirstName,
            @FormParam("LastName") String LastName,
            @FormParam("IndexNumber") Long IndexNumber)
    {

    	Student student = new Student();

    	student.setFirstName(FirstName);
    	student.setLastName(LastName);
    	student.setIndexNumber(IndexNumber);

        sm.add(student);

        return student;
    }

}
