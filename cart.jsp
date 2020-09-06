<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>cart</title>
    <link rel="stylesheet" href="assets3/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets3/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets3/css/Profile-Edit-Form-1.css">
    <link rel="stylesheet" href="assets3/css/Profile-Edit-Form.css">
    <link rel="stylesheet" href="assets3/css/Sidebar-Menu-1.css">
    <link rel="stylesheet" href="assets3/css/Sidebar-Menu.css">
    <link rel="stylesheet" href="assets3/css/styles.css">
</head>

<body class="img-fluid" style="margin: 0px;">
    <div id="wrapper">
        <div id="sidebar-wrapper" style="background-color: rgb(231,90,90);color: rgb(0,0,1);font-family:times new roam; ">
            <ul class="sidebar-nav">
                <li class="sidebar-brand"> <a class="text-center d-md-flex justify-content-md-start" href="#" style="color: rgb(0,0,1);background-color: #f8c1c1;">&nbsp; &nbsp; &nbsp; &nbsp; SERVICE DEKO</a></li>
                <li> <a href="#"></a></li>
                <li> <a href="user_index.jsp" style="color: rgb(0,0,1);">&nbsp; <i class="fa fa-user"></i>&nbsp; &nbsp; &nbsp; My Profile</a></li>
                <li> <a href="booking.jsp" style="color: rgb(0,0,1);">&nbsp; <i class="fa fa-star"></i>&nbsp; &nbsp; &nbsp;My Booking</a></li>
				<li> <a href="cart.jsp" style="color: rgb(0,0,1); background-color:white;">&nbsp; <i class="fa fa-cart-plus"></i>&nbsp; &nbsp; &nbsp;My cart</a></li>
                <li> <a href="logout_user.jsp" style="color: rgb(0,0,1);">&nbsp; <i class="fa fa-sign-out"></i>&nbsp; &nbsp; &nbsp;Log out</a></li>
            </ul>
        </div>
        <div class="page-content-wrapper">
            <div class="container-fluid" style="background-color: rgb(255,255,255);"><a class="btn btn-link img-fluid" role="button" id="menu-toggle" href="#menu-toggle"><i class="fa fa-bars" style="color: rgb(231,90,90);"></i></a></div>
            <h3 class="img-fluid" style="color:rgb(231,90,90);width:100%;height:auto;font-size:2vw">&nbsp;My Cart&nbsp;<i class="fa fa-cart-plus"></i></h3>
			 <% 
       Connection con;
       PreparedStatement pst;
       ResultSet rs;
       Class.forName("com.mysql.jdbc.Driver");
       con=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeservice?useSSL=false&serverTimezone=UTC","root","");
       String email=(String)session.getAttribute("email");  
       session.setAttribute("email", email);
       String query="select * from detail where email='"+email+"'";
       Statement st=con.createStatement();
       rs=st.executeQuery(query);
       boolean Records=rs.next();
       if(!Records){%>
            <div class="col-12 col-lg-7 offset-0 offset-md-4 offset-lg-4 offset-xl-4 img-fluid" style="margin: 0px;height: 150px;width: 400px;">
                <h1 class="text-justify d-flex justify-content-start align-items-center justify-content-xl-center img-fluid" style="width: 300px;height: 100px;font-size: 25px;">&nbsp;Empty Cart</h1>
            </div>
            <div class="col-8 col-sm-5 col-md-5 col-lg-3 offset-0 offset-sm-0 offset-md-4 offset-lg-4 offset-xl-5 img-fluid" style="width: auto;height: auto;margin:0px"><!--<button class="btn btn-primary d-md-flex justify-content-md-start align-items-md-center img-fluid" data-toggle="modal" data-target="#modal1" type="button" style="margin: 0px200px;background-color: rgb(138,203,55);">BOOK THE SERVICES</button></div>-->
			<a href="index.jsp" style="background-color: rgb(138,203,55);border-color:rgb(138,203,55)" class="btn btn-primary btn-lg">Book The Services</a>
        </div>
		 <%}
       
       try{
        int total=0;
           do{
       
       String id=rs.getString("id");
	   String id1=rs.getString("id1");
       total+=rs.getInt("price");
       String service=rs.getString("service");
       String price=rs.getString("price");
       %>
	    <br><br>
    <div>
        <div class="container">
            <div class="row">
                
                
                <div style="background-color: white;color: black" class="col col-sm col-md">
                    <p style="font-size: 30px"><%=service%></p>
                    <p><i class="fas fa-rupee-sign"></i><strong><%=price%></strong></p>
                    <br><a id="remove" href="remove.jsp?id=<%=id%>">Remove</a>
                     
                    <div align="right">
                   <a href="order1.jsp?service=<%=service%>&price=<%=price%>&id=<%=id%>&id1=<%=id1%>" id="order" style="background-color:rgb(231,90,90);border-color: rgb(231,90,90);font-size: 13px" class="btn btn-primary btn-lg"  >Place Order</a></div>
                   <br></div>
                
            </div>
        </div>
    </div>
               
        <%
           }while(rs.next());%>
            <br><br><div  style="color: black;background-color: white" class="col-md-6 col-lg-7">
               <p style="font-size:18px"><b>Price Details</b></p><hr>
               <br>
               <p style="font-size:20px">Total Price:<i class="fa fa-rupee-sign"></i><%=total%></p><br>
               <div align="right"><a href="orderAll.jsp" style="background-color:rgb(231,90,90);border-color: rgb(231,90,90);" class="btn btn-primary btn-lg">  Place Order</a></div>
     
                              
<%}              
catch(SQLException error){
System.out.println("Error");
}
finally{
		con.close();
	}
 %>
      
    
    <br><br>
                     </div>
    </div>
    <script src="assets3/js/jquery.min.js"></script>
    <script src="assets3/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets3/js/Profile-Edit-Form.js"></script>
    <script src="assets3/js/Sidebar-Menu.js"></script>

</div>
</body>

</html>