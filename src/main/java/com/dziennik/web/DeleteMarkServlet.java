package com.dziennik.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/MarkDelete/*")
public class DeleteMarkServlet extends HttpServlet {
	  @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String link = request.getPathInfo();
	        Long MarkID = WebUtils.getStudentID(request);

	        request.setAttribute("MarkID", MarkID);
	        request.getRequestDispatcher("/mark/delete.jsp").forward(request, response);
	    }
}
