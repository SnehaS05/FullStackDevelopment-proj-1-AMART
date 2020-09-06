<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
      response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);  %> 
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>booking</title>
    <link rel="stylesheet" href="assets2/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Titillium+Web:400,600,700">
    <link rel="stylesheet" href="assets2/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets2/css/Button-Change-Text-on-Hover.css">
    <link rel="stylesheet" href="assets2/css/Google-Style-Text-Input.css">
    <link rel="stylesheet" href="assets2/css/Profile-Edit-Form-1.css">
    <link rel="stylesheet" href="assets2/css/Profile-Edit-Form.css">
    <link rel="stylesheet" href="assets2/css/Sidebar-Menu-1.css">
    <link rel="stylesheet" href="assets2/css/Sidebar-Menu.css">
    <link rel="stylesheet" href="assets2/css/styles.css">
</head>

<body class="img-fluid" style="margin: 0px;">
    <div id="wrapper">
        <div id="sidebar-wrapper" class="img-fluid" style="background-color: rgb(231,90,90);color: rgb(0,0,1);font-family:times new roam; ">
            <ul class="sidebar-nav">
                <li class="sidebar-brand"> <a class="text-center d-md-flex justify-content-md-start img-fluid" href="#" style="color: rgb(0,0,1);background-color: #f8c1c1;">&nbsp; &nbsp; &nbsp; &nbsp; SERVICE DEKO</a></li>
                <li> <a href="#"></a></li>
                <li> <a href="user_index.jsp" style="color: rgb(0,0,1);">&nbsp; <i class="fa fa-user"></i>&nbsp; &nbsp; &nbsp; My Profile</a></li>
                <li> <a href="booking.jsp" style="color: rgb(0,0,1); background-color:white;">&nbsp; <i class="fa fa-star"></i>&nbsp; &nbsp; &nbsp;My Booking</a></li>
				<li> <a href="cart.jsp" style="color: rgb(0,0,1);">&nbsp; <i class="fa fa-cart-plus"></i>&nbsp; &nbsp; &nbsp;My cart</a></li>
                <li> <a href="logout_user.jsp" style="color: rgb(0,0,1);">&nbsp; <i class="fa fa-sign-out"></i>&nbsp; &nbsp; &nbsp;Log out</a></li>
            </ul>
        </div>
        <div class="page-content-wrapper"style=" width:100%; hieght=auto; margin: 0px; font-size=3vw;">
            <div class="container-fluid" style="background-color: rgb(255,255,255);"><a class="btn btn-link" role="button" id="menu-toggle" href="#menu-toggle"><i class="fa fa-bars img-fluid" style="color: rgb(231,90,90);"></i></a></div>
            <h3 class="img-fluid" style="color: rgb(231,90,90); width:100%; height:auto; font-size:2vw;">&nbsp;My Booking&nbsp;<i class="fa fa-star"></i></h3>
            <% String email=(String)session.getAttribute("email");  
       Connection con;
       PreparedStatement pst;
       ResultSet rs;
       Class.forName("com.mysql.jdbc.Driver");
       con=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeservice?useSSL=false&serverTimezone=UTC","root","");
       String query1="select * from homeservice.address where email='"+email+"'";
       Statement st1=con.createStatement();
       rs=st1.executeQuery(query1);
       boolean Records=rs.next();
       
      if(!Records){%>
			<div class="col-12 col-lg-7 offset-0 offset-md-4 offset-lg-4 offset-xl-5 img-fluid" style="margin: 0px;height:100px;width:400px;">
                <h1 class="d-flex justify-content-start align-items-center img-fluid" style="width:100%;height:auto;font-size:2vw; color:gray;text-type:normal;
				"><h4>no booking right now</h4></h1>
            </div>
            <div class="col-8 col-sm-5 col-md-5 col-lg-4 offset-0 offset-sm-0 offset-md-4 offset-lg-4 offset-xl-5 img-fluid" style="width:250px; height: auto;margin:0px;">
			<a href="index.jsp" style="background-color: rgb(138,203,55);border-color:rgb(138,203,55)" class="btn btn-primary btn-lg">Book The Services</a>
        </div>
		 <%} 
   else{%>
          <div class="col-8 col-sm-5 col-md-5 col-lg-4 offset-0 offset-sm-0 offset-md-4 offset-lg-4 offset-xl-5 img-fluid" style="width:250px; height: auto;margin:0px;">
			<a href="index.jsp" style="background-color: rgb(138,203,55);border-color:rgb(138,203,55)" class="btn btn-primary btn-lg">Continue Booking</a>
        </div>
   <% }		
       try{
           do{%>
		<div class="text-right highlight-phone"align="right">
        <div class="container">
            <div class="row"><div class="col-md-12">
                <div class="col-md-8">
                    <div class="text-right intro">
                        <div style="background-color: white;color: black" class="col col-sm col-md">
                        <p style="font-size: 20px" align="left" value="" type="text"><%=rs.getString("servadd")%></p>
                        <p style="font-size: 20px" align="left"><i class="fas fa-rupee-sign"></i>Price:<%=rs.getString("price")%></p>
                        <p style="font-size: 20px" align="left" value="date" type="date" pattern="dd-MMM-yyyy" >Date:
                           <%=rs.getString("date")%><br>
                         </p>
                         <p style="font-size: 20px" align="left" value="date" type="date" pattern="dd-MMM-yyyy" >Time:
                           <%=rs.getString("time")%><br>
                         </p>
                         <button style="background-color:rgb(231,90,90);border-color: rgb(231,90,90);"  align="right">Order Confirmed</button>
                        
                        </div></div>
            </div>
        </div>
    </div></div>
	  
        <%
           }while(rs.next());
}
catch(SQLException error){
System.out.println("Error");
 }
 finally{
		con.close();
	}

 %>
      
    
    <br><br>
    
      
        
    
    <br><br>
         </div>
    </div>
    <div class="btn-group btn-group-toggle" data-toggle="buttons"></div>
    <div></div>
    <div class="btn-group btn-group-toggle" data-toggle="buttons"></div>
    <script src="assets2/js/jquery.min.js"></script>
    <script src="assets2/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets2/js/Profile-Edit-Form.js"></script>
    <script src="assets2/js/Sidebar-Menu.js"></script>
</body>

</html>