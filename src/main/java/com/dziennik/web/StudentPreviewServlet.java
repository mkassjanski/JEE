package com.dziennik.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/StudentPreview/*")
public class StudentPreviewServlet extends HttpServlet {
	  @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String link = request.getPathInfo();
	        Long StudentID = WebUtils.getStudentID(request);

	        request.setAttribute("StudentID", StudentID);
	        request.getRequestDispatcher("/student/preview.jsp").forward(request, response);
	    }
}
