<%-- 
    Document   : mailJSP
    Created on : Apr 7, 2018, 11:47:59 PM
    Author     : HCL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*,javax.mail.*"%>

<%@ page import="javax.mail.internet.*" %>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>



<%! Connection con;
          String k,e;
         %>
    <%  int a=0;
         ResultSet rs=null;
  con = DriverManager.getConnection("jdbc:derby://localhost:1527/organisation","root","root");
  if(con!=null)
      System.out.println("Data is successfully retrieved!");
  else
      System.out.println("no connection");
      //Creating a result for getting status that messsage is delivered or not!

    String result="";

    // Get recipient's email-ID, message & subject-line from index.html page

    final String blood = request.getParameter("blood");

    final String num_bottle = request.getParameter("num_bottle");
    
    final String address = request.getParameter("address");

    final String contact = request.getParameter("contact");

     //request.getParameter("mail");

    final String subject = "Blood Needed!"; //request.getParameter("sub");

    final String messg = "Please respond if applicable.Blood Group: "+ blood+" Number of botles : "
            +num_bottle+" Address : "+address+ " Contact :"+contact;
            //request.getParameter("mess");

 

    // Sender's email ID and password needs to be mentioned

    final String from = "igdtunistash@gmail.com";

    final String pass = "gitanjalikijai";

 

    // Defining the gmail host

    String host = "smtp.gmail.com";

 

    // Creating Properties object

    Properties props = new Properties();

 

    // Defining properties

    props.put("mail.smtp.host", host);

    props.put("mail.transport.protocol", "smtp");

    props.put("mail.smtp.auth", "true");

    props.put("mail.smtp.starttls.enable", "true");

    props.put("mail.user", from);

    props.put("mail.password", pass);

    props.put("mail.port", "465");

 

    // Authorized the Session object.

    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {

        @Override

        protected PasswordAuthentication getPasswordAuthentication() {

            return new PasswordAuthentication(from, pass);

        }

    });
    
        MimeMessage message = new MimeMessage(mailSession);

        // Set From: header field of the header.

        message.setFrom(new InternetAddress(from));

        // Set To: header field of the header.

         message.setSubject(subject);

        // Now set the actual message

        message.setText(messg);


  //String name=(String)request.getParameter("name");
  //String password=(String)request.getParameter("pass");
  //String designation=(String)request.getParameter("designation");
  try {
      
    System.out.println("Empty string");
 
  String sql="Select * from  org_info";
 PreparedStatement ps = con.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE, 
    ResultSet.CONCUR_READ_ONLY);

  // ps.setInt(1, a11);
  //ps.setString(2,password);
 // ps.setString(3,designation);
     rs=ps.executeQuery();
     while (rs.next()) { // <-- "Iterate" the ResultSet
      k=rs.getString("ADDRESS");
      e=rs.getString("EMAIL");
      %>
      <%= k %>
      <script>
          destination = "<%= k%>";
          email="<%= e%>";
          get_rout();
          </script>
   
      <br>
      <br>
     

<%


 

        // Create a default MimeMessage object.

        
        %>
       
<title>Sending Mail in JSP</title>
 <script>
        var destination,email;
    </script>
<body>
<h1><center><font color="blue">Sending Mail Using JSP</font></h1>

        
          <div id="source"></div>
           <div id="source"></div>
     
            <p id="demo"></p>
            
               <script type="text/javascript">
        var source, destination;
        var darection = new google.maps.DirectionsRenderer;
        var directionsService = new google.maps.DirectionsService;
        google.maps.event.addDomListener(window, 'load', function () {
            new google.maps.places.SearchBox(document.getElementById('source'));
            new google.maps.places.SearchBox(document.getElementById('destination'));
            
        });

        function get_rout() {


            var mapOptions = {
                mapTypeControl: false,
                center: {lat: -33.8688, lng: 151.2195},
                zoom: 13
            };
            
          
            source = <%= address  %>;"Kashmere gate, Delhi, India"; //document.getElementById("source").value;
             
       // document.getElementById("destination").value;



            
            var service = new google.maps.DistanceMatrixService();
            service.getDistanceMatrix({
                origins: [source],
                destinations: [destination],
                travelMode: google.maps.TravelMode.DRIVING,
                unitSystem: google.maps.UnitSystem.METRIC,
                avoidHighways: false,
                avoidTolls: false
            }, function (response, status) {
                if (status == google.maps.DistanceMatrixStatus.OK && response.rows[0].elements[0].status != "ZERO_RESULTS") {
                    var distance = response.rows[0].elements[0].distance.text;
                    var duration = response.rows[0].elements[0].duration.text;
                    if(parseFloat(distance)< 50.0){
                    document.getElementById("demo").innerHTML += distance+"\n";
                    
                     <%
            final String to =e; //"gitanjali1077@gmail.com"; //e;

        message.addRecipient(Message.RecipientType.TO,

                new InternetAddress(to));
  
        // Set Subject: header field

       %>
                         

              }
                    distancefinel = distance.split(" ");
                    $('.distance').val(distancefinel[0]);
                    
                    
                    
                } else {
                    alert("Unable to find the distance via road.");
                }
            });
        }
        
        
        
        
    </script>
     <%
      
    
     System.out.println("successfully updated"+rs);
  
 %>
      <%
        // Send message

     
    } 
}catch (MessagingException mex) {

        mex.printStackTrace();

        result = "Error: unable to send mail....";

    }


 Transport.send(message);

        result = "Your mail sent successfully....";


%>
          
<b><center><font color="red"><% out.println(result);%></b>

    
  
        </body>

