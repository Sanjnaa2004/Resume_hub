<%@ page contentType="text/html;charset=UTF-8"%>
<%
if(session.getAttribute("user") == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Dashboard</title>

<!-- IMPORTANT: correct path -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

<!-- ICON LIBRARY (FIX) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

</head>

<body>

<div class="dashboard-box">

    <h1>ResumeHub Dashboard</h1>

    <div class="card-container">

        <a href="createResume.jsp" class="card">📝 Create Resume</a>
        <a href="viewResume.jsp" class="card">👁 View Resume</a>
        <a href="PDFServlet" class="card">📄 PDF</a>
        <a href="logout.jsp" class="card">🚪 Logout</a>

    </div>

</div>

</body>
</html>