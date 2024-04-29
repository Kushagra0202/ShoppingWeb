<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style3.css">
</head>
<body style="background-color: blueviolet;">
    <div class="centered-div">
        <div class="label">
         <b>FORGOT PASSWORD</b>
        </div>
        <div class="forgot">
             <form action="Password" onsubmit="return validateForm()">
                <input type="text" placeholder="Enter UserName" name="user" ><br>
                <input type="password" placeholder="Enter New PassWord" name="pass" id="newPass"><br>
                <input type="password" placeholder="Confirm Passwword" name="confirmpass" id="confirmPass"><br>
                <input type="submit" value="Reset">
             </form>
        </div>
    </div>
    
    <script >
    function validateForm(){
    	var newPassword = document.getElementById("newPass").value;
    	var confirm = document.getElementById("confirmPass").value;
    	console.log(newPassword);
    	console.log(confirm);
    	if(newPassword !== confirm){
    		alert("Passwords do not match");
    		return false;
    	}
    	return true;
    }
    
    </script>
</body>
</html>