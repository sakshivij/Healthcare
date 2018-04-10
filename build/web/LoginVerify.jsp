<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>
<%
String user,pass;
user=(String)request.getParameter("user");
pass=(String)request.getParameter("psw");

//step1 load the driver class  
Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
  
//step2 create  the connection object  
Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/hackWork","skukreja","none");  
  
//step3 create the statement object  
Statement stmt=con.createStatement();  
  
//step4 execute query  
String query="SELECT uname,password FROM member WHERE uname='"+user+"'";
ResultSet rs=stmt.executeQuery(query);
String name="";
String password="";
while(rs.next())
{	
	name=rs.getString("uname");
	
	password=rs.getString("password");

}
if(name.equals(user) && password.equals(pass))
{
    String redirectURL = "index.html";
    response.sendRedirect(redirectURL);
}	    
else
{
    String redirectURL = "#";
    response.sendRedirect(redirectURL);
}

con.close();
%>