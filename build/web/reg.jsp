<%@ page import ="java.sql.*" %>
<%
	String name = request.getParameter("name");   
    	String email = request.getParameter("email");
    	//String city = request.getParameter("city");
    	String number = request.getParameter("num");
    	String uname = request.getParameter("username");
	String password=request.getParameter("pass");
	Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
    	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/hackWork","skukreja", "none");
    	Statement st = con.createStatement();
    	ResultSet rs;
    	int i = st.executeUpdate("insert into member(name,email,number,uname,password) values ('"+name+"' , '"+email+"' , '"+number+"' , '"+uname+"' , '"+password+"')");
	if(i>0)
	{
                out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
                session.setAttribute("userid", uname);
        	response.sendRedirect("login.html");
       		 
    	} else {
        	response.sendRedirect("index.html");
    	}
%>