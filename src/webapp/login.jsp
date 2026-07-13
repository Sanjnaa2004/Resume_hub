<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="container">

    <h2>Login</h2>

    <form action="LoginServlet" method="post">

        <input type="email" name="email" placeholder="Enter Email" required>

        <input type="password" name="password" placeholder="Enter Password" required>

        <input type="submit" value="Login" class="btn">

    </form>

    <div style="text-align:center; margin-top:15px;">
        <a href="register.jsp" class="btn">Create Account</a>
    </div>

</div>

</body>
</html>