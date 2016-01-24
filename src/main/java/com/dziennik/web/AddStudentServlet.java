package com.dziennik.web;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dziennik.service.StudentManager;

@WebServlet(urlPatterns = "/AddStudent")
public class AddStudentServlet extends HttpServlet {
	
    @EJB
    private StudentManager sm = new StudentManager();
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("student/add.jsp").forward(request, response);
    }
}
