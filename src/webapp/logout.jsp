<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="jakarta.servlet.http.*" %>

<%
    // get existing session (do not create new one)
    HttpSession session1 = request.getSession(false);

    // invalidate only if session exists
    if (session1 != null) {
        session1.invalidate();
    }

    // redirect to login page
    response.sendRedirect("login.jsp");
%>