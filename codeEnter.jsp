<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<%

    try
    {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e)
    {
        out.print("Database connection Error" + e );
        System.out.println("Driver class not found");
        e.printStackTrace();
    }
    Connection con = null;
    try
    {
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/homeservice","root","");
    } catch (SQLException e)
    {
        out.print("Database connection Error" + e );
        System.out.println("Database connection not established");
        e.printStackTrace();
    }

    Statement st= null;
    try
    {
        assert con != null;
        st = con.createStatement();
    } catch (SQLException e)
    {
        out.print("Database connection Error" + e );
        System.out.println("Statement not created");
        e.printStackTrace();
    }

    ResultSet rs = null;
    try 
    {
        assert st != null;
        String email = request.getParameter("email").toLowerCase();
        String verification_code = request.getParameter("userVcode").trim();
        rs = st.executeQuery("select * from forgot_password_check where Email_ID = '" + email+ "' ");
 
        long[] timeArray=new long[1000];

        if (rs.next()){
            int i = 0;
            while (rs.next()){
                timeArray[i] = rs.getLong(3);
            }
        }

        long maxi = 0;
        for (long i:
             timeArray) {
            if(maxi < i){
                maxi = i;
            }
        }

        rs = st.executeQuery("select * from forgot_password_check where Email_ID = '" + email + "' and ElapseTime = '"+maxi+"' ");

        if (rs.next()) 
        {

            if(rs.getString(2).equals(verification_code))
            {
                 //session.setAttribute("Email_ID", email);
				 
                 out.print("<script> window.location.href='login1.jsp' </script>");
            }
            else
            {
                st.executeUpdate("delete from users where email = '" + email + "'");
                out.print("<script> alert('Code Mismatch'); " +
                        "setTimeout(function() {window.location.href='codeEnter1.jsp'});  </script>");
            }
        }
        else
        {
                st.executeUpdate("delete from users where email = '" + email + "'");
                out.print("<script> alert('Email not found'); setTimeout(function() {window.location.href='codeEnter1.jsp'});  </script>");

        }
    }
    catch (SQLException e)
    {
        out.print("Database connection Error" + e );
        System.out.println("Sql query error");
        e.printStackTrace();
    }
    finally{
		rs.close();
		st.close();
        con.close();    
    }
%>