<%@ page import="java.sql.*" %>
<%@ page import="resumehub.DBConnection" %>

<%
Connection con = DBConnection.getConnection();
PreparedStatement ps = con.prepareStatement("SELECT * FROM resume ORDER BY id DESC");
ResultSet rs = ps.executeQuery();

boolean hasData = false;
%>

<!DOCTYPE html>
<html>
<head>
<title>View Resume</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>

<div class="resume-container">

<h1>My Resume</h1>

<%
while(rs.next()){
    hasData = true;
    int id = rs.getInt("id");
%>

<div class="profile-card">

    <div class="profile-header">
        <h2><%= rs.getString("name") %></h2>
        <p><%= rs.getString("email") %></p>
        <p><%= rs.getString("phone") %></p>
        <p><%= rs.getString("address") %></p>
    </div>

    <div class="profile-body">

        <h3>Skills</h3>
        <p><%= rs.getString("skills") %></p>

        <h3>Education</h3>
        <p><%= rs.getString("education") %></p>

        <h3>Experience</h3>
        <p><%= rs.getString("experience") %></p>

        <h3>Projects</h3>
        <p><%= rs.getString("projects") %></p>

    </div>

    <div class="button-group">

        <a href="dashboard.jsp" class="btn">Back</a>
        <a href="editResume.jsp?id=<%=id%>" class="btn">Edit</a>
        <a href="DeleteServlet?id=<%=id%>" class="btn">Delete</a>
        <a href="PDFServlet?id=<%=id%>" class="btn">PDF</a>

    </div>

</div>

<br>

<%
}
%>

<%
if(!hasData){
%>

<h3>No Resume Found 😢</h3>
<a href="createResume.jsp" class="btn">Create Resume</a>

<%
}
%>

</div>

</body>
</html>

<%
rs.close();
ps.close();
con.close();
%>