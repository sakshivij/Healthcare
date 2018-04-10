package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;

public final class main_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

 Connection con;
         
         
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\n");
      out.write("<head>\n");
      out.write("    <title></title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("  <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>\n");
      out.write(" \n");
      out.write("  <!------- for local server only --------->\n");
      out.write(" <script type=\"text/javascript\" src=\"http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places\"></script>\n");
      out.write(" \n");
      out.write("  <script src=\"//maps.googleapis.com/maps/api/js?key=AIzaSyCo1Xqn-KGMatR_X2uEbfcSYUpGLUCXy3Q&sensor=false&libraries=places\" type=\"text/javascript\"></script>\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("    <script>\n");
      out.write("        var destination;\n");
      out.write("    </script>\n");
      out.write("<body>\n");
      out.write("<div class=\"container\">\n");
      out.write("  <h2>Calculate Distance between two points google maps javascript</h2>\n");
      out.write("\n");
      out.write("  <form class=\"form-inline\" action=\"\">\n");
      out.write("    <div class=\"form-group\">\n");
      out.write("      <label for=\"email\">Source:</label>\n");
      out.write("      <input type=\"text\" class=\"form-control\" id=\"source\" value=\"New Delhi, Delhi, India\" >\n");
      out.write("    </div>\n");
      out.write("    <div class=\"form-group\">\n");
      out.write("      <label for=\"pwd\">Destination:</label>\n");
      out.write("      <input type=\"text\" class=\"form-control\" id=\"destination\" value=\"Delhi Cantt, New Delhi, Delhi, India\" >\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <button type=\"button\" value=\"Get Route\" onclick=\"get_rout()\" >Get Rout & Distance</button>\n");
      out.write("    \n");
      out.write("    <div class=\"form-group\">\n");
      out.write("      <label for=\"pwd\">Distance in km :</label>\n");
      out.write("      <p id=\"demo\"></p>\n");
      out.write("      <input type=\"text\" class=\"form-control distance\" readonly >\n");
      out.write("    </div>\n");
      out.write("  </form>\n");
      out.write(" \n");
      out.write("  <div class=\"row\" >\n");
      out.write("  <br /><br />\n");
      out.write("  <div class='col-md-6' id='maplocation' style=\"height: 450px;\" ></div>\n");
      out.write("  <div class='col-md-6' id='panallocation' style=\"width: 500px; height: 500px\" ></div>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("       <script type=\"text/javascript\">\n");
      out.write("        var source, destination;\n");
      out.write("        var darection = new google.maps.DirectionsRenderer;\n");
      out.write("        var directionsService = new google.maps.DirectionsService;\n");
      out.write("        google.maps.event.addDomListener(window, 'load', function () {\n");
      out.write("            new google.maps.places.SearchBox(document.getElementById('source'));\n");
      out.write("            new google.maps.places.SearchBox(document.getElementById('destination'));\n");
      out.write("            \n");
      out.write("        });\n");
      out.write("\n");
      out.write("        function get_rout() {\n");
      out.write("\n");
      out.write("\n");
      out.write("            var mapOptions = {\n");
      out.write("                mapTypeControl: false,\n");
      out.write("                center: {lat: -33.8688, lng: 151.2195},\n");
      out.write("                zoom: 13\n");
      out.write("            };\n");
      out.write("            \n");
      out.write("          \n");
      out.write("            source = \"Model Town, Delhi, India\"; //document.getElementById(\"source\").value;\n");
      out.write("             \n");
      out.write("       // document.getElementById(\"destination\").value;\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            \n");
      out.write("            var service = new google.maps.DistanceMatrixService();\n");
      out.write("            service.getDistanceMatrix({\n");
      out.write("                origins: [source],\n");
      out.write("                destinations: [destination],\n");
      out.write("                travelMode: google.maps.TravelMode.DRIVING,\n");
      out.write("                unitSystem: google.maps.UnitSystem.METRIC,\n");
      out.write("                avoidHighways: false,\n");
      out.write("                avoidTolls: false\n");
      out.write("            }, function (response, status) {\n");
      out.write("                if (status == google.maps.DistanceMatrixStatus.OK && response.rows[0].elements[0].status != \"ZERO_RESULTS\") {\n");
      out.write("                    var distance = response.rows[0].elements[0].distance.text;\n");
      out.write("                    var duration = response.rows[0].elements[0].duration.text;\n");
      out.write("                    if(parseFloat(distance)< 50.0){\n");
      out.write("                    document.getElementById(\"demo\").innerHTML += distance+\"\\n\";\n");
      out.write("              }\n");
      out.write("                    distancefinel = distance.split(\" \");\n");
      out.write("                    $('.distance').val(distancefinel[0]);\n");
      out.write("                    \n");
      out.write("                    \n");
      out.write("                    \n");
      out.write("                } else {\n");
      out.write("                    alert(\"Unable to find the distance via road.\");\n");
      out.write("                }\n");
      out.write("            });\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("    </script>\n");
      out.write("             ");
      out.write("\n");
      out.write("    ");
  int a=0;
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
      
      
      out.write("\n");
      out.write("      ");
      out.print( k );
      out.write("\n");
      out.write("      <script>\n");
      out.write("          destination = \"");
      out.print( k);
      out.write("\";\n");
      out.write("          get_rout();\n");
      out.write("          </script>\n");
      out.write("   \n");
      out.write("      <br>\n");
      out.write("      <br>\n");
      out.write("      ");

      
    }
     System.out.println("successfully updated"+rs);
  }
   
 catch(Exception e2){
 System.out.println("Exception occurred"+e2);
   
}
 
      out.write("\n");
      out.write("  \n");
      out.write("     \n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
