
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%! String email=null; %>
	
<%
    Connection con;
       PreparedStatement pst;
       ResultSet rs,rs1,rs2,rs3,rs4;
       Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeservice?useSSL=false&serverTimezone=UTC","root","");
       email=(String)session.getAttribute("email");    
       session.setAttribute("email", email);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Home cleaning</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Aclonica">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Aguafina+Script">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Aladin">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="assets/css/Contact-Form-Clean.css">
    <link rel="stylesheet" href="assets/css/Features-Boxed.css">
    <link rel="stylesheet" href="assets/css/Footer-Basic.css">
    <link rel="stylesheet" href="assets/css/Footer-Clean.css">
    <link rel="stylesheet" href="assets/css/Footer-Dark.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="assets/css/Navigation-with-Button.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>
<body class="text-center" style="padding: 10px;">
    <nav class="navbar navbar-light navbar-expand-md" style="background-color: #000000;">
        <div class="container-fluid"><a class="navbar-brand" href="index.jsp" style="color: #00b5d6;font-size: 30px;"><strong><em>Service Deko</em></strong></a><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1" style="background-color: #00b5d6;"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div
                class="collapse navbar-collapse text-left" id="navcol-1">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item" role="presentation"><a class="nav-link" href="index.jsp" style="color: #00b5d6;">Home</a></li>
                   <!-- <li class="nav-item" role="presentation"><a class="nav-link active" href="login1.jsp" style="color: #00b5d6;">Login /Sign Up</a></li> -->
					<%
if (session.getAttribute("email") == null) {
%>
<li class="nav-item" role="presentation"><a class="nav-link" href="login1.jsp" style="color: #00b5d6;">Login/Sign Up</a></li>

<%
}  else {
%>
<li class="nav-item" role="presentation"><a class="nav-link" href="user_index.jsp" style="color: #00b5d6;">Profile</a></li>

<%
}
%>

                   <li class="nav-item" role="presentation"><a class="nav-link" href="login_prof1.jsp" style="color: #00b5d6;">Login as Professional</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="#" style="color: #00b5d6;">About Us</a></li>
                </ul>
        </div>
        </div>
    </nav>
    <div style="padding: 10px;margin-top: 25px;">
        <div class="row" style="height: 100px;background-color: #70cee2;margin-top: 30px;">
            <div class="col-lg-2 text-left"><a class="btn btn-primary border rounded-circle" role="button" style="background-color: rgb(0,0,0);font-size: 25px;" href="index.jsp"><i class="fa fa-arrow-left" style="color: rgb(255,255,255);"></i></a></div>
            <div class="col" style="background-color: #70cee2;">
                <h1 style="background-color: #70cee2;">House Cleaning</h1>
            </div>
        </div>
    </div>
    <div style="padding: 10px;margin-top: 30px;">
        <div style="padding: 10px;margin-right: 5px;">
            <div class="row" style="margin-bottom: 30px;">
                <div class="col">
                    <h3 style="background-color: rgb(0,0,0);color: rgb(255,255,255);">Sofa</h3>
                </div>
                <div class="col">
                    <h3 style="background-color: rgb(0,0,0);color: rgb(255,255,255);">Kitchen</h3>
                </div>
                <div class="col" style="margin-left: 5px;">
                    <h3 style="background-color: rgb(0,0,0);color: rgb(255,255,255);">Full House</h3>
                </div>
            </div>
        </div>
    </div>
	 <%
    String qu="select * FROM postadd WHERE profadd='Home Cleaning'";
    Statement st=con.createStatement();
    st=con.createStatement();
    rs1=st.executeQuery(qu);
    if(rs1.next()){
        
    String que="select * from postadd where servadd='Sofa Cleaning'";
    st=con.createStatement();
    rs2=st.executeQuery(que);
    boolean Records=rs2.next();
    if(Records){
    %>
    <div style="padding: 10px;"><img class="img-fluid" src="assets/img/s3.png" style="height: 350px;width: 18860px;" text="SOFA CLEANING" />
</div>
<%
      try{  
do{
%>
    <div style="padding: 10px;"><input class="form-control-plaintext" type="text" value="Sofa cleaning" readonly="" style="background-color: rgb(0,0,0);filter: grayscale(0%);margin-top: 10px;color: rgb(255,255,255);"></div>
    <div style="padding: 10px;">
        <div class="row" style="background-color: #b2d8d8;margin: 5px;">
            <div class="col-xl-5" style="margin: 20px;">
                <div class="row">
                    <div class="col-xl-12"><img class="img-fluid" src="assets/img/2seat1sofa.jpg" style="width: 450px;height: 250px;padding: 10px;background-color: #6bc9db;"></div>
                </div><br>
				<input class="form-control-plaintext" type="text" value="Sofa Cleaning" readonly="" style="color: rgb(0,0,0);background-color: rgb(249,249,249);margin-top: 30px;">
				
				              <%
                                String service4="Sofa Cleaning";
                                String price4=rs2.getString("setaprice");    
                                String idd=rs2.getString("id");
                              %>
                                <%
                                    String query4="select * from detail where id1='"+idd+"' and email='"+email+"'";
                                    st=con.createStatement();
                                    rs=st.executeQuery(query4);
                                    if(rs.next()){
                                    %>
				    <input onclick="window.location.href='cart.jsp?id1=<%=idd%>'" style="background-color:rgb(6,51,99);border: none;margin-top:10px;color: white;padding:10px; " type="button"  id="cart" value="GO TO CART"/>
<%}
else{%>
				<input class="btn btn-primary" role="button" data-bs-hover-animate="pulse" style="background-color: rgb(6,51,99);margin-top:10px;margin-left: 5px;"onclick="window.location.href='goto1.jsp?id1=<%=idd%>&service=<%=service4%>&price=<%=price4%>'" id="cart" value="ADD TO CART"/>
<%}%>
				<button onclick="window.location.href='bookorder.jsp?id1=<%=idd%>&service=<%=service4%>&price=<%=price4%>'" class="btn btn-primary text-center border rounded-0" type="button" style="width: 200px;background-color: rgb(0,0,0);margin-top:10px;margin-right: 15px;">BOOK NOW</button>
                <input
                    class="form-control-plaintext" type="text" value="₹<%=rs2.getString("setaprice")%> " readonly="" style="color: rgb(0,0,0);margin-top: 20px;background-color: rgb(255,255,255);"></div>
            <div class="col" style="margin: 20px;"><input class="form-control-plaintext" type="text" value="Full Sofa Cleaning" readonly="" style="background-color: rgb(0,0,0);color: rgb(255,255,255);"><input class="form-control-plaintext" type="text" value="DESCRIPTION" readonly="" style="color: rgb(0,0,0);background-color: rgb(255,255,255);margin-top: 20px;">
                <p
                    class="text-left" style="font-size: 20px;"><%=rs2.getString("description")%></p>
					<input class="form-control-plaintext" type="text" value="EQUIPMENT NEEDED" readonly="" style="color: rgb(0,0,0);background-color: rgb(255,255,255);">
                    <p
                        class="text-left" style="font-size: 20px;"><%=rs2.getString("equipments")%></p>
						
            </div>
        </div>
    </div>
		 <%
        }while(rs2.next());
}
catch(Exception e){
out.println("e");
}
}
 String que1="select * from postadd where servadd='Kitchen Cleaning'";
    st=con.createStatement();
    rs3=st.executeQuery(que1);
boolean Records1=rs3.next();
    if(Records1){
%>
    <div style="padding: 10px;"><img class="img-fluid" src="assets/img/k7.jpg" style="width: 1890px;height: 350px;margin:30px 0px 30px" /></div>
    <div style="padding: 10px;"><input class="form-control-plaintext" type="text" value="Full Kitchen" readonly="" style="background-color: rgb(0,0,0);margin-top: 30px;color: rgb(255,255,255);"></div>
<%
   try{     
do{
%>
    <div style="padding: 10px;">
        <div class="row" style="margin: 20px;background-color: #b2d8d8;">
            <div class="col-xl-5" style="margin: 20px;">
                <div class="row">
                    <div class="col-xl-12"><img class="img-fluid" src="assets/img/kitchen%20cleaning.jpg" style="width: 450px;height: 250px;background-color: #6bc9db;padding: 10px;"></div>
                </div><input class="form-control-plaintext" type="text" value="Full Kitchen" readonly="" style="color: rgb(0,0,0);background-color: rgb(249,249,249);margin-top: 30px;">
				<%
                                String service4="Kitchen Cleaning";
                                String price4=rs3.getString("setaprice");
                                String idd=rs3.getString("id");
                                %>
                                <%
                                    String query4="select * from detail where id1='"+idd+"' and email='"+email+"'";
                                    st=con.createStatement();
                                    rs=st.executeQuery(query4);
                                    if(rs.next()){
                                    %>
									 <input onclick="window.location.href='cart.jsp?id1=<%=idd%>'" style="background-color:rgb(6,51,99);margin-top: 20px;border: none;color: white;padding:10px; " type="button"  id="cart" value="GO TO CART"/>
<%}
else{%>
				
				<input class="btn btn-primary" role="button" data-bs-hover-animate="pulse" style="background-color: rgb(6,51,99);margin-top: 20px;margin-left: 5px;"onclick="window.location.href='goto1.jsp?id1=<%=idd%>&service=<%=service4%>&price=<%=price4%>'" id="cart" value="ADD TO CART"/>
<%}%>
			<button onclick="window.location.href='bookorder.jsp?id1=<%=idd%>&service=<%=service4%>&price=<%=price4%>'" class="btn btn-primary text-center border rounded-0" type="button" style="width: 200px;background-color: rgb(0,0,0);margin-top: 20px;margin-left: 15px;">BOOK NOW</button>
                <input
                    class="form-control-plaintext" type="text" value="₹<%=rs3.getString("setaprice")%> " readonly="" style="color: rgb(0,0,0);margin-top: 20px;background-color: rgb(255,255,255);"></div>
            <div class="col"><input class="form-control-plaintext" type="text" value="Full Kitchen Cleaning" readonly="" style="background-color: rgb(0,0,0);color: rgb(255,255,255);"><input class="form-control-plaintext" type="text" value="DESCRIPTION" readonly="" style="color: rgb(0,0,0);background-color: rgb(255,255,255);margin-top: 20px;">
                <p
                    class="text-left" style="font-size: 20px;"><%=rs3.getString("description")%></p><input class="form-control-plaintext"
                        type="text" value="EQUIPMENT NEEDED" readonly="" style="color: rgb(0,0,0);background-color: rgb(255,255,255);">
                    <p class="text-left" style="font-size: 20px;"><%=rs3.getString("equipments")%></p>
            </div>
        </div>
    </div>
	 <%
                            }while(rs3.next());
}catch(Exception e){
out.println("e");
}
}
String que2="select * from postadd where servadd='Full Home Cleaning'";
    st=con.createStatement();
    rs4=st.executeQuery(que2);
boolean Records2=rs4.next();
    if(Records2){
    
%>
    <div style="padding: 10px;"><img class="img-fluid" src="assets/img/house11.jpeg" style="width: 1886px;height: 350px;" /></div>
    <div style="padding: 10px;"><input class="form-control-plaintext" type="text" value="Home Cleaning" readonly="" style="background-color: rgb(0,0,0);color: rgb(255,255,255);margin-top: 30px;"></div>
<%
  try{   
do{
%>
    <div style="padding: 10px;">
        <div class="row" style="margin: 20px;background-color: #b2d8d8;">
            <div class="col-xl-5" style="margin: 10px;">
                <div class="row">
                    <div class="col-xl-12"><img class="img-fluid" src="assets/img/full%20hoyse%20cleaning2.jpg" style="width: 450px;height: 250px;padding: 10px;margin-right: 5px;background-color: #6bc9db;"></div>
                </div><input class="form-control-plaintext" type="text" value="Full Home Cleaning" readonly="" style="color: rgb(0,0,0);background-color: rgb(255,255,255);margin-top: 30px;">
				<%
                                String service4="Full Home Cleaning";
                                String price4=rs4.getString("setaprice");
                                String idd=rs4.getString("id");
                                %>
                                <%
                                    String query4="select * from detail where id1='"+idd+"' and email='"+email+"'";
                                    st=con.createStatement();
                                    rs=st.executeQuery(query4);
                                    if(rs.next()){
                                    %>
									<input onclick="window.location.href='cart.jsp?id1=<%=idd%>'" style="background-color:rgb(6,51,99);margin-top: 20px;border: none;color: white;padding:10px; " type="button"  id="cart" value="GO TO CART"/>
<%}
else{%>
				
				<input class="btn btn-primary" role="button" data-bs-hover-animate="pulse" style="background-color: rgb(6,51,99);margin-top: 20px;"onclick="window.location.href='goto1.jsp?id1=<%=idd%>&service=<%=service4%>&price=<%=price4%>'" id="cart" value="ADD TO CART"/>
<%}%>
				<button onclick="window.location.href='bookorder.jsp?id1=<%=idd%>&service=<%=service4%>&price=<%=price4%>'"class="btn btn-primary text-center border rounded-0" type="button" style="width: 200px;background-color: rgb(0,0,0);margin-top: 20px;margin-left: 15px;">BOOK NOW</button>
                <input
                    class="form-control-plaintext" type="text" value="₹<%=rs4.getString("setaprice")%>" readonly="" style="color: rgb(0,0,0);margin-top: 20px;background-color: rgb(255,255,255);">
				</div>
            <div class="col" style="margin: 10px;"><input class="form-control-plaintext" type="text" value="Full Home Cleaning" readonly="" style="background-color: rgb(0,0,0);color: rgb(255,255,255);"><input class="form-control-plaintext" type="text" value="DESCRIPTION" readonly="" style="color: rgb(0,0,0);background-color: rgb(255,255,255);margin-top: 20px;">
                <p
                    class="text-left" style="font-size: 20px;"><%=rs4.getString("description")%></p>
                    <input
                        class="form-control-plaintext" type="text" value="EQUIPMENT NEEDED" readonly="" style="color: rgb(0,0,0);background-color: rgb(255,255,255);">
                        <p class="text-left" style="font-size: 20px;"><%=rs4.getString("equipments")%></p>
            </div>
        </div>
    </div>
	 <%
       }while(rs4.next());
}
catch(Exception e){
out.println("e");
}
}
}

%>
    <div class="footer-dark"><a href="#" style="margin-bottom: 5px;margin-right: 5px;color: #ffffff;">Terms and Conditions</a><a href="#" style="color: #ffffff;margin-bottom: 5px;margin-left: 5px;">Privacy Policy</a>
        <footer>
            <div class="container" style="margin-top: 10px;">
                <div class="row">
                    <div class="col item social"><a href="#"><i class="icon ion-social-facebook"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-instagram"></i></a></div>
                </div>
                <p class="copyright" style="color: rgb(240,255,255);">Service Deko © 2020<br></p>
            </div>
        </footer>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
</body>

</html>