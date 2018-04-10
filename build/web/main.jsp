<%-- 
    Document   : main
    Created on : Apr 7, 2018, 4:51:19 PM
    Author     : HCL
--%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
  <!------- for local server only --------->
 <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
 
  <script src="//maps.googleapis.com/maps/api/js?key=AIzaSyCo1Xqn-KGMatR_X2uEbfcSYUpGLUCXy3Q&sensor=false&libraries=places" type="text/javascript"></script>

</head>
    <script>
        var destination;
    </script>
<body>
<div class="container">
  <h2>Calculate Distance between two points google maps javascript</h2>

  <form class="form-inline" action="">
    <div class="form-group">
      <label for="email">Source:</label>
      <input type="text" class="form-control" id="source" value="New Delhi, Delhi, India" >
    </div>
    <div class="form-group">
      <label for="pwd">Destination:</label>
      <input type="text" class="form-control" id="destination" value="Delhi Cantt, New Delhi, Delhi, India" >
    </div>

    <button type="button" value="Get Route" onclick="get_rout()" >Get Rout & Distance</button>
    
    <div class="form-group">
      <label for="pwd">Distance in km :</label>
      <p id="demo"></p>
      <input type="text" class="form-control distance" readonly >
    </div>
  </form>
 
  <div class="row" >
  <br /><br />
  <div class='col-md-6' id='maplocation' style="height: 450px;" ></div>
  <div class='col-md-6' id='panallocation' style="width: 500px; height: 500px" ></div>
  </div>
</div>

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
            
          
            source = "Model Town, Delhi, India"; //document.getElementById("source").value;
             
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
              }
                    distancefinel = distance.split(" ");
                    $('.distance').val(distancefinel[0]);
                    
                    
                    
                } else {
                    alert("Unable to find the distance via road.");
                }
            });
        }
        
        
        
        
    </script>
             <%! Connection con;
         
         %>
    <%  int a=0;
         ResultSet rs=null;
  con = DriverManager.getConnection("jdbc:derby://localhost:1527/organisation","root","root");
  if(con!=null)
      System.out.println("Data is successfully retrieved!");
  else
      System.out.println("no connection");
  
  //String name=(String)request.getParameter("name");
  //String password=(String)request.getParameter("pass");
  //String designation=(String)request.getParameter("designation");
  try{
      
    System.out.println("Empty string");
 
  String sql="Select * from  org_info";
 PreparedStatement ps = con.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE, 
    ResultSet.CONCUR_READ_ONLY);
 String k;
  // ps.setInt(1, a11);
  //ps.setString(2,password);
 // ps.setString(3,designation);
     rs=ps.executeQuery();
     while (rs.next()) { // <-- "Iterate" the ResultSet
      k=rs.getString("ADDRESS");
      
      %>
      <%= k %>
      <script>
          destination = "<%= k%>";
          get_rout();
          </script>
   
      <br>
      <br>
      <%
      
    }
     System.out.println("successfully updated"+rs);
  }
   
 catch(Exception e2){
 System.out.println("Exception occurred"+e2);
   
}
 %>
  
     
</body>
</html>
