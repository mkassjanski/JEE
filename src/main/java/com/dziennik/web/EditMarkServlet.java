package com.dziennik.web;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dziennik.service.MarkManager;
import com.dziennik.service.StudentManager;

@WebServlet(urlPatterns = "/MarkEdit/*")
public class EditMarkServlet extends HttpServlet {
	
    @EJB
    private StudentManager sm;
    @EJB
    private MarkManager mm;
    
	  @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        Long MarkID = WebUtils.getStudentID(request);
	
	        request.setAttribute("MarkID", mm.get(MarkID));
	        request.setAttribute("StudentID", sm.getAllStudents());
	        request.getRequestDispatcher("/mark/edit.jsp").forward(request, response);
	    }
}
