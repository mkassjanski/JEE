package com.dziennik.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/MarkPreview/*")
public class PreviewMarkServlet extends HttpServlet {
	  @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  Long MarkID = WebUtils.getStudentID(request);

	        request.setAttribute("MarkID", MarkID);
	        request.getRequestDispatcher("/mark/preview.jsp").forward(request, response);
	    }
}
