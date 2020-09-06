<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.*" %>
<%@page import="java.sql.*"%>
<%! String email=null; %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>bookings</title>
    <link rel="stylesheet" href="assets4/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Advent+Pro">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets4/css/PHP-Contact-Form-dark-1.css">
    <link rel="stylesheet" href="assets4/css/PHP-Contact-Form-dark.css">
    <link rel="stylesheet" href="assets4/css/styles.css">
</head>

<body style="background-color: rgba(255,255,255,0);background-image: url(&quot;assets4/img/stone%202.jpg&quot;);background-repeat: no-repeat;background-size: cover;">
<div id="contact" class="img-fluid" style="height: 550px;color: rgba(33,37,41,0);background-repeat: no-repeat;background-size: auto;background-color: rgba(49,49,49,0);">
        <div class="container img-fluid" style="color: rgba(4,6,8,0);width: 1200px;">
            <div class="intro">
                <h2 class="img-fluid" style="font-family: 'Advent Pro', sans-serif;color: rgb(8,3,5);font-size: 50px;">SERVICE DEKO</h2>
                <p class="img-fluid" style="color: rgb(8,8,8);font-size: 20px;">BOOKINGS</p>
            </div>
			<%
             try{
            	 email=(String)session.getAttribute("email"); 
            	session.setAttribute("email", email);
                Connection con;
                PreparedStatement pst;
                ResultSet rs;
                Class.forName("com.mysql.jdbc.Driver");
            	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeservice?useSSL=false&serverTimezone=UTC","root","");
          		String service=request.getParameter("service");
    			String price=request.getParameter("price");
    			String id=request.getParameter("id");
                        String id1=request.getParameter("id1");
       			String query="select * from homeservice.users where email='"+email+"'";
	      		Statement st=con.createStatement();
	      		rs=st.executeQuery(query);
	       while(rs.next()){
	      
	       //email=rs.getString("email");
	       //request.getSession().setAttribute("email", email); 
               System.out.println("start");
              
	    %>
           
            <form name="myform" action="insertbook.jsp?id=<%=id%>&id1=<%=id1%>"  method="POST">
                <div class="messages"></div>
                <div class="controls">
                    <div class="form-row">
                        <div class="col-md-6 col-lg-3 img-fluid" style="background-color: #ede6e6;">
                            <div class="form-group"><label for="form_service" style="color: rgb(7,7,13);">SERVICE</label><input class="form-control img-fluid" type="text"  id="service" data-error="Your service" name="service" required="" placeholder="pet service *" value='<%=service %>'readonly>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3 img-fluid" style="background-color: #ede6e6;">
                            <div class="form-group" style="background-color: #ede6e6;"><label for="form_price" style="color: rgb(7,7,13);">PRICE</label><input class="form-control img-fluid" type="price" id="price" data-error="" name="price" required="" placeholder="5000 *" value='<%=price %>' readonly>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 col-lg-3" style="background-color: #ede6e6;">
                        <div class="form-group img-fluid" style="background-color: #ede6e6;"><label for="form_phone" style="color: #03060b;">PHONE NUMBER</label><input class="form-control img-fluid" type="tel" id="phno" data-error="invaild number." name="phno" required="" placeholder="+91 *" value='<%=rs.getString("phone_number") %>' required>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3" style="background-color: #ede6e6;">
                        <div class="form-group img-fluid"><label for="form_phone" style="color: #020608;">PIN CODE</label><input class="form-control img-fluid" type="pincode" id="pincode" data-error="" name="pincode" placeholder="85621*"value='<%=rs.getString("pincode") %>' required>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 col-lg-6 img-fluid" style="background-color: #ede6e6;">
                        <div class="form-group img-fluid"><label for="form_message" style="color: #050707;">ADDRESS</label><input class="form-control img-fluid" type="text" id="address" data-error="" rows="4" name="address" required="" placeholder="kormangal,bangalore*" value='<%=rs.getString("address")%>' required>
                            <div
                                class="help-block with-errors"></div>
                    </div>
                </div>
                 <div class="col-md-12 col-lg-7 col-xl-7 offset-xl-2 text-left img-fluid" style="margin-top: 20px;"><button class="btn btn-success btn-send img-fluid" value="book" type="submit" style="color: #060000;background-color: rgb(2,230,133);padding: 8px;width: 150PX;">BOOK NOW</button></div>
        </div>
        <div class="form-row">
            <div class="col-md-12 img-fluid">
                <p class="text-muted img-fluid"><br></p>
            </div>
        </div>
		 <%
                    }
                   }
                catch(Exception e){
                    System.out.println("Class not found");
                }
                %> 
        </form>
    </div>
    </div>
    <script src="assets4/js/jquery.min.js"></script>
    <script src="assets4/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets4/js/PHP-Contact-Form-dark-1.js"></script>
    <script src="assets4/js/PHP-Contact-Form-dark.js"></script>
</body>

</html>