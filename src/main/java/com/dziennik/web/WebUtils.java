package com.dziennik.web;

import javax.servlet.http.HttpServletRequest;

public class WebUtils {
	public static Long getStudentID(HttpServletRequest request) {
        String pathInfo = request.getPathInfo();
        String StudentID = pathInfo.substring(pathInfo.lastIndexOf("/") + 1, pathInfo.length());

        return Long.valueOf(StudentID);
    }

    //public static void redirectToMainPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
       // response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/main"));
   // }

    //public static void redirectToMessageView(HttpServletRequest request, HttpServletResponse response, Long id) throws IOException {
      //  response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/view/" + id));
   // }
}
