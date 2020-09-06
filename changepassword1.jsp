<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
//HttpSession session = request.getSession();
//String =request.getSession.getAttribute(profemail);
String profemail=(String)session.getAttribute("profemail");
String profemails=request.getParameter("profemail");

String password=request.getParameter("password");

if(password != null)
{
Connection con = null;
PreparedStatement ps = null;
String personID =profemail;
try
{

    Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeservice?useSSL=false&serverTimezone=UTC","root","");
String sql="Update homeservice.proffsignup set password=?where profemail='"+profemail+"'";
ps = con.prepareStatement(sql);
  


ps.setString(1,password);

int i = ps.executeUpdate();

if(i > 0)
{
	System.out.println("Success");

	out.print("<script> alert('Changes Saved');" +
"setTimeout(function() {window.location.href='welcome.jsp'});</script>");
}
else
{
	System.out.println("Failed");

out.print("<script>alert('There is a problem in updating Record.');</script>");
}
}
catch(SQLException sql)
{
	System.out.println("SQLException"+sql);
    request.setAttribute("error", sql);
    out.println(sql);
}
catch(Exception sql1)
{
	System.out.println("Exception"+sql1);
	request.setAttribute("error", sql1);
	out.println(sql1);
}

finally {
	con.close();
	ps.close();
}
}
    else {
	System.out.println("Null");

}
%>