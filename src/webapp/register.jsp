<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Register</title>
<link rel="stylesheet" href="css/style.css">

<script>
function validateRegister(){

    let name = document.forms["regForm"]["name"].value;
    let email = document.forms["regForm"]["email"].value;
    let password = document.forms["regForm"]["password"].value;

    if(name == ""){
        alert("Name required");
        return false;
    }

    if(email == ""){
        alert("Email required");
        return false;
    }

    if(password.length < 6){
        alert("Password must be at least 6 characters");
        return false;
    }

    return true;
}
</script>

</head>

<body>

<div class="container">

    <h2>Register</h2>

    <form name="regForm" action="RegisterServlet" method="post" onsubmit="return validateRegister()">

        <input type="text" name="name" placeholder="Enter Name">

        <input type="email" name="email" placeholder="Enter Email">

        <input type="password" name="password" placeholder="Enter Password">

        <input type="submit" value="Register" class="btn">

    </form>

    <br>

    <a href="login.jsp" class="btn">Already have account? Login</a>

</div>

</body>
</html>