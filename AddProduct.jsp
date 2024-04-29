<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Form</title>
 <link rel="stylesheet" href="style5.css">
    <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" >
</head>
<body style="background-color: aquamarine;" >
    <div class="nav-bar">
        <div class="company-name">
            <b>DEAL BREAK</b>
        </div>
        <ul class="navigation-links">
            <li><a href="AddProduct.jsp">Add new Product</a> <i class="fa-solid fa-cart-plus"></i></li>
            <li><a href="MessageRecieved.jsp">Message recieved</a><i class="fa-solid fa-message"></i></li>
            <li><a href="OrderRecieved.jsp">Orders recieved</a><i class="fa-solid fa-message"></i></li>
            <li><a href="CancelOrder.jsp">Cancel orders</a><i class="fa-solid fa-xmark"></i></li>
            <li><a href="DeliveredOrder.jsp">Delieverd orders</a><i class="fa-solid fa-truck"></i></li>
            <li><a href="NewFile.jsp">Logout</a><i class="fa-solid fa-right-from-bracket"></i></li>
        </ul>
    </div>
    <div class="head">
        <form action="AddNewProduct.jsp" autocomplete="off">
            <div class="div-top">
                <div class="left-top">
                    Enter Product-Id <br>
                    <input type="number" placeholder="Enter Product Id" name="ID" required autocomplete="off" >
                </div>
                <div class="right-top">
                    Enter Product Name <br>
                    <input type="text" placeholder="Enter Product Name" name="name" required autocomplete="off" >
                </div>
            </div>

            <div class="div-bottom">
                <div class="left-bottom">
                    Enter Price <br>
                    <input type="number" placeholder="Enter Price " name="price"required autocomplete="off">
                </div>

                <div class="right-bottom">
                    Active <br>
                    <select required name="status" autocomplete="off" >
                        <option value="Yes">Yes</option>
                        <option value="No">No</option>
                    </select>
                </div>
            </div>
            <div class="submit">
                <button><i class="fa-solid fa-circle-arrow-right fa-beat"> Save</i></button>
            </div>
        </form>
        <% 
            String msg = request.getParameter("msg");
            if (msg != null) {
                if (msg.equals("done")) {
                    out.println("<div style='text-align: center; color: green; font-size: 20px;'>Product added successfully</div>");
                } else {
                    out.println("<div style='text-align: center; color: red; font-size: 20px;'>Oops! Something went wrong. Try again!</div>");
                }
            }
        %>
    </div>
</body>
</html>