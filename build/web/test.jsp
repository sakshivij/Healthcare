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
    <script src="http:/maps.google.com/maps?file=api&v=3&key=AIzaSyCo1Xqn-KGMatR_X2uEbfcSYUpGLUCXy3Q" type="text/javascript"></script>
     <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>

</head>
    
<body>
      <table border="0" cellpadding="0" cellspacing="3">
<tr>
    <td colspan="2">
        Source:
        <input type="text" id="txtSource" value="Bandra, Mumbai, India" style="width: 200px" />
        &nbsp; Destination:
        <input type="text" id="txtDestination" value="Andheri, Mumbai, India" style="width: 200px" />
        <br />
        <input type="button" value="Get Route" onclick="GetRoute()" />
        <hr />
    </td>
</tr>
<tr>
    <td colspan="2">
        <div id="dvDistance">
        </div>
    </td>
</tr>
<tr>
    <td>
        <div id="dvMap1" style="width: 500px; height: 500px">
        </div>
         <div id="dvMap" style="width: 500px; height: 500px">
        </div>
    </td>
    <td>
        <div id="dvPanel" style="width: 500px; height: 500px">
        </div>
    </td>
</tr>
</table>
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
      
      <script type="text/javascript">
var source, destination;
var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
google.maps.event.addDomListener(window, 'load', function () {
    new google.maps.places.SearchBox(document.getElementById('txtSource'));
    new google.maps.places.SearchBox(document.getElementById('txtDestination'));
    directionsDisplay = new google.maps.DirectionsRenderer({ 'draggable': true });
});

function GetRoute() {
    var latlng = new google.maps.LatLng(39.305, -76.617);
    var mapOptions = {
        zoom: 7,
        center: latlng
    };
    map = new google.maps.Map(document.getElementById('dvMap'), mapOptions);
   
    //*********DIRECTIONS AND ROUTE**********************//
    source ="Bandra, Mumbai, India";// document.getElementById("txtSource").value;
    //destination = document.getElementById("txtDestination").value;
  destination = "<%= k %>";
    var request = {
        origin: source,
        destination: destination,
        travelMode: google.maps.TravelMode.DRIVING
    };
   
 
    //*********DISTANCE AND DURATION**********************//
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
            var dvDistance = document.getElementById("dvDistance");
           dvDistance.innerHTML = "";
            dvDistance.innerHTML += "Distance: " + distance + "<br />";
            dvDistance.innerHTML += "Duration:" + duration;
 
        } else {
            alert("Unable to find the distance via road.");
        }
    });
}

 GetRoute();
</script>
      <br>
      <%
      
    }
     System.out.println("successfully updated"+rs);
  }
   
 catch(Exception e2){
 System.out.println("Exception occurred"+e2);
   
}
 %>
  
       <script type="text/javascript">
var source, destination;
var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
google.maps.event.addDomListener(window, 'load', function () {
    new google.maps.places.SearchBox(document.getElementById('txtSource'));
    new google.maps.places.SearchBox(document.getElementById('txtDestination'));
    directionsDisplay = new google.maps.DirectionsRenderer({ 'draggable': true });
});
 
function GetRoute() {
    var mumbai = new google.maps.LatLng(18.9750, 72.8258);
    var mapOptions = {
        zoom: 7,
        center: mumbai
    };
    map = new google.maps.Map(document.getElementById('dvMap'), mapOptions);
    directionsDisplay.setMap(map);
    directionsDisplay.setPanel(document.getElementById('dvPanel'));
 
    //*********DIRECTIONS AND ROUTE**********************//
    source = document.getElementById("txtSource").value;
    destination = document.getElementById("txtDestination").value;
  //destination = ";
    var request = {
        origin: source,
        destination: destination,
        travelMode: google.maps.TravelMode.DRIVING
    };
    directionsService.route(request, function (response, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
        }
    });
 
    //*********DISTANCE AND DURATION**********************//
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
            var dvDistance = document.getElementById("dvDistance");
           dvDistance.innerHTML = "";
            dvDistance.innerHTML += "Distance: " + distance + "<br />";
            dvDistance.innerHTML += "Duration:" + duration;
 
        } else {
            alert("Unable to find the distance via road.");
        }
    });
}
</script>
</body>
</html>
