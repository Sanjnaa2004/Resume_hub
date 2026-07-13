<%@ page import="java.sql.*" %>
<%@ page import="resumehub.DBConnection" %>

<%
int id = Integer.parseInt(request.getParameter("id"));

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
    "SELECT * FROM resume WHERE id=?"
);

ps.setInt(1, id);

ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Resume</title>
<link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="container">

<h2>Edit Resume</h2>

<%
if(rs.next()){
%>

<form action="UpdateServlet" method="post">

<input type="hidden" name="id" value="<%=rs.getInt("id")%>">

<!-- BASIC INFO -->
<h3>Basic Information</h3>

<label>Name</label>
<input type="text" name="name" value="<%=rs.getString("name")%>" required>

<label>Email</label>
<input type="email" name="email" value="<%=rs.getString("email")%>" required>

<label>Phone</label>
<input type="text" name="phone" value="<%=rs.getString("phone")%>" required>

<label>Address</label>
<input type="text" name="address" value="<%=rs.getString("address")%>">

<!-- SKILLS -->
<h3>Skills</h3>
<textarea name="skills"><%=rs.getString("skills")%></textarea>

<!-- EDUCATION -->
<h3>Education</h3>
<textarea name="education"><%=rs.getString("education")%></textarea>

<!-- EXPERIENCE -->
<h3>Experience</h3>
<textarea name="experience"><%=rs.getString("experience")%></textarea>

<!-- PROJECTS -->
<h3>Projects</h3>
<textarea name="projects"><%=rs.getString("projects")%></textarea>

<button type="submit" class="btn">Update Resume</button>

</form>

<%
} else {
%>

<h3>No Resume Found</h3>

<%
}
%>

</div>

</body>
</html>