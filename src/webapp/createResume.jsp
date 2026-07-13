<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Create Resume</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>

<div class="container">

    <h2>Create Resume</h2>

    <form action="${pageContext.request.contextPath}/ResumeServlet" method="post">

        <!-- BASIC INFO -->
        <h3>Basic Information</h3>

        <input type="text" name="name" placeholder="Full Name" required>

        <input type="email" name="email" placeholder="Email" required>

        <input type="text" name="phone" placeholder="Phone Number" required>

        <input type="text" name="address" placeholder="Address">

        <!-- SKILLS -->
        <h3>Skills</h3>

        <textarea name="skills" placeholder="Enter your skills (e.g. Java, HTML, CSS)"></textarea>

        <!-- EDUCATION -->
        <h3>Education</h3>

        <textarea name="education" placeholder="Education details (College, Degree, Year)"></textarea>

        <!-- EXPERIENCE -->
        <h3>Experience</h3>

        <textarea name="experience" placeholder="Work experience or internships"></textarea>

        <!-- PROJECTS -->
        <h3>Projects</h3>

        <textarea name="projects" placeholder="Your projects (optional)"></textarea>

        <!-- BUTTON -->
        <button type="submit" class="btn">Save Resume</button>

    </form>

</div>

</body>
</html>