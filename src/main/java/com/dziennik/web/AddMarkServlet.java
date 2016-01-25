package com.dziennik.web;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.dziennik.service.*;

@WebServlet(urlPatterns = "/AddMark")
public class AddMarkServlet extends HttpServlet{
    @EJB
    private StudentManager sm;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("AllStudents", sm.getAllStudents());
        request.getRequestDispatcher("/mark/add.jsp").forward(request, response);
    }
}
