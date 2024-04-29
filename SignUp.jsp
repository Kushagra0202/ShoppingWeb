<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIGN IN</title>
<link rel="stylesheet" href="style1.css">
</head>
<body style="background-color: #008080;">
    <div class="centered-div">
        <div class="nav-bar" style="background-color: #6c757d;">
            <b>SIGN UP</b>
        </div>
        <div class="sign-in-form">
           <form action="Creation">
         Name:    <input type="text" placeholder="e.g. Kushagra" name="name" autocomplete="off"><br>
         User:   <input type="text" placeholder="e.g. Kush" name="uname" autocomplete="off"><br>
         Email:  <input type="email" placeholder="e.g. randomuser123@example.com" size="30" name="email" autocomplete="off"><br>
         Password: <input type="password" name="pass" autocomplete="off"> <br> 
         Date of Birth:    <input type="date" placeholder="e.g. 2023-09-15" name="dob" autocomplete="off"><br>
         Gender:   <input type="text" placeholder="e.g. M" name="g" autocomplete="off"> <br>
         Phone Number:    <input type="text" placeholder="e.g. 6594320567" name="ph" autocomplete="off"><br>
             <input type="submit" value="Create"><br>
           </form>
        </div>
    </div>
</body>
</html>