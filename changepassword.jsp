<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.servlet.*" %>
    <%@ page import="java.sql.*" %>
   <%
    System.out.println("----------------------------------");
      String profemail=(String)session.getAttribute("profemail");    
    session.setAttribute("profemail", profemail);
    Connection con;
	PreparedStatement pst;
	ResultSet rs;
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeservice?useSSL=false&serverTimezone=UTC","root","");
    %>
<!doctype html>
   
<html lang="en">
    <%
      response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
   // String ID = null;
      
    if (session.getAttribute("profemail") == null) {
        response.sendRedirect("login_prof.jsp");
    } 
      %>     
   <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="title icon" href="images/title-img.png">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/all.js" integrity="sha384-xymdQtn1n3lH2wcu0qhcdaOpQwyoarkgLVxC/wZ5q7h9gHtxICrpcaSUfygqZGOe" crossorigin="anonymous">
    </script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://www.parsecdn.com/js/parse-1.4.2.min.js"></script>
   
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <title>Modify Details</title>
	<style>
	<style>
	body {
  font-family: 'Montserrat', sans-serif;
/*  background-color: black;*/
         background-color: white;
}



/* navbar */
.sidebar {
     height: 100vh;

   background-color:black;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;

}

            
        
        
       
        .col-md-8
        {
             background-image:   url(img1.jpeg);
            background-repeat: no-repeat;
            
 background-position: center;
            background-size: cover;
        }

.bottom-border {
  border-bottom: 1px groove white;
}

.sidebar-link {
  transition: all .4s;
}

.sidebar-link:hover {
  background:linear-gradient(91.41deg,white .15%,white 99.82%);
  border-radius: 5px;
    font-size: 20px;
}

.current {
  background-color: #f44336;
  border-radius: 7px;
  box-shadow: 2px 5px 10px #111;
  transition: all .3s;
}

.current:hover {
  background-color: #f66436;
  border-radius: 7px;
  box-shadow: 2px 5px 20px #111;
  transform: translateY(-1px);
}

.search-input {
  background: transparent;
  border: none;
  border-radius: 0;
  border-bottom: 2px solid white;
  transition: all .4s;
}

.search-input:focus {
  background: transparent;
  box-shadow: none;
  border-bottom: 2px solid #dc3545;
}

.search-button {
  border-radius: 50%;
  padding: 10px 16px;
  transition: all .4s;
}

.search-button:hover {
  background-color: black;
  transform: translateY(-1px);
}

.icon-parent {
  position: relative;
}

.icon-bullet::after {
  content: "";
  position: absolute;
  top: 7px;
  left: 15px;
  height: 12px;
  width: 12px;
  background-color: #f44336;
  border-radius: 50%;
}

@media (max-width: 768px) {
  .sidebar {
    position: static;
    height: auto;
  }

  .top-navbar {
    position: static;
  }
}
/* end of navbar */

/* cards */
.card-common {
  box-shadow: 1px 2px 5px #999;
  transition: all .4s;
}

.card-common:hover {
  box-shadow: 2px 3px 15px #999;
  transform: translateY(-1px);
}
        .form-group
        {
/*            color: white;*/
            color: black;
        }
        .j a
        {
            text-align: center;
            font-size: 30px;
        }
        .form-color
        {
            background-color: white;
            margin-left: 10%;
            
        }
/* end of cards */
        .nav-item{
            height: 10vh;
        }
        .text-center{
            margin-right: 7%;
        }
       
                
</style>

  </head>
  <body>
    
    
    
    <nav class="navbar navbar-expand-md navbar-light">
    <button class="navbar-toggler ml-auto mb-2 bg-light" type="button" data-toggle="collapse" data-target="#myNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="myNavbar">
        <div class="container-fluid">
            <div class="row">

                <div class="col-xl-2 col-lg-3 col-md-4 sidebar fixed-top">

                    <div class="bottom-border pb-3">
                      
                        <div class="j">
                            <a href="#" class="text-white">SERVICE DEKO</a></div>

                       <ul class="navbar-nav flex-column mt-4">
                            <li class="nav-item"><a href="postad1.jsp" class="nav-link text-white p-3 mb-2 sidebar-link  ">Add Advertisement</a></li>
                            <li class="nav-item"><a href="ModifyDetails.jsp" class="nav-link text-white p-3 mb-2 sidebar-link  ">Modify Your Details</a></li>
                            <li class="nav-item"><a href="viewadd.jsp" class="nav-link text-white p-3 mb-2 sidebar-link  ">View ADs</a></li>
                            <li class="nav-item"><a href="viewbookings.jsp" class="nav-link text-white p-3 mb-2 sidebar-link  ">View Your Bookings</a></li>
                            <li class="nav-item"><a href="changepassword.jsp" class="nav-link text-white p-3 mb-2 sidebar-link  ">Change Password</a></li>
                            <li class="nav-item"><a href="logout_prof.jsp" class="nav-link text-white p-3 mb-2 sidebar-link  ">Log out</a></li>
                            <li class="nav-item"><a href="warning.jsp" class="nav-link text-white p-3 mb-2 sidebar-link  ">Delete Account</a></li>

                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </div>
</nav>
      
      
      
    <section>
         <script>
        function validatePassword()
        {
  			var pass = document.getElementById("signpassword").value;
  			var re_pass = document.getElementById("signre_password").value;
  			if(pass=="" ||re_pass==""  ){
         		document.getElementById("password_message").innerHTML = "password is empty";
         	}else if(pass==re_pass){

                  	// document.getElementById("Registerbutton").disabled = false;
                    document.getElementById("password_message").innerHTML = "";
        	 }else{ 
             	//	 document.getElementById("Registerbutton").disabled = true;
            document.getElementById("password_message").innerHTML = "password is not matching ";
			  		
           }
	}
    </script>
    <script>
 function clicked(){
     console.log("button clicked")
 }

    </script>  

        <form class="validate-form" action="changepassword1.jsp" method="post">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
                
                <div class="container profile profile-view" id="profile">
                    <div class="row">
                        <div class="col-md-12 alert-col relative">
                            <h2 class="text"><br><strong>Change Password</strong><br><br></h2>
                        </div>
                        </div>
      
            
               
                <div class="col-md-8">
                    
                        <% String query="select * from homeservice.proffsignup where profemail='"+profemail+"'";
	                                                        Statement st=con.createStatement();
	                                                        rs=st.executeQuery(query);
	                                                        while(rs.next()){
	                                                        	
	                                                        	profemail=rs.getString("profemail");
	                                                        	request.getSession().setAttribute("profemail", profemail); 
	                                                        %>
                    
                       
                        <div class="form-group"><input class="form-control" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" type="password" onkeyup="validatePassword()" id="signpassword" name="password" title="Must contain atleast one number and one uppercase and lowercase letter, and at least 6 or more characters" required="" minlength="6" placeholder="New Password*"></div>
                        <div class="form-group"><input class="form-control" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" type="password" onkeyup="validatePassword()" id="signre_password" name="passwordrepeat" title="Must contain atleast one number and one uppercase and lowercase letter, and at least 6 or more characters" required="" minlength="6" placeholder="Re-enter New Password*"></div>
                        <span style="color: red;" id="password_message"></span> 
                        
                         <% } %>
                            <div class="form-group text-center"><button class="btn btn-primary" type="submit" value="submit" onclick=clicked()  >Submit</button></div>   
                             
                             </%>   
                            </%>
                    
                   </div>
                                
            </div>
   
                            </div>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/Profile-Edit-Form.js"></script>
                  </div>
            </div>
          
        </form>
      
    </section>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<script src="script.js"></script>
  </body>
</html>


