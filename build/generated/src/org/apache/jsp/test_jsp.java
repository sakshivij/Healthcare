package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class test_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

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
      out.write("<!DOCTYPE html>\n");
      out.write("<html >\n");
      out.write("<head>\n");
      out.write("    <title></title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <table border=\"0\" cellpadding=\"0\" cellspacing=\"3\">\n");
      out.write("<tr>\n");
      out.write("    <td colspan=\"2\">\n");
      out.write("        Source:\n");
      out.write("        <input type=\"text\" id=\"txtSource\" value=\"Bandra, Mumbai, India\" style=\"width: 200px\" />\n");
      out.write("        &nbsp; Destination:\n");
      out.write("        <input type=\"text\" id=\"txtDestination\" value=\"Andheri, Mumbai, India\" style=\"width: 200px\" />\n");
      out.write("        <br />\n");
      out.write("        <input type=\"button\" value=\"Get Route\" onclick=\"GetRoute()\" />\n");
      out.write("        <hr />\n");
      out.write("    </td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("    <td colspan=\"2\">\n");
      out.write("        <div id=\"dvDistance\">\n");
      out.write("        </div>\n");
      out.write("    </td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("    <td>\n");
      out.write("        <div id=\"dvMap\" style=\"width: 500px; height: 500px\">\n");
      out.write("        </div>\n");
      out.write("    </td>\n");
      out.write("    <td>\n");
      out.write("        <div id=\"dvPanel\" style=\"width: 500px; height: 500px\">\n");
      out.write("        </div>\n");
      out.write("    </td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("    <script type=\"text/javascript\" src=\"http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places\"></script>\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("var source, destination;\n");
      out.write("var directionsDisplay;\n");
      out.write("var directionsService = new google.maps.DirectionsService();\n");
      out.write("google.maps.event.addDomListener(window, 'load', function () {\n");
      out.write("    new google.maps.places.SearchBox(document.getElementById('txtSource'));\n");
      out.write("    new google.maps.places.SearchBox(document.getElementById('txtDestination'));\n");
      out.write("    directionsDisplay = new google.maps.DirectionsRenderer({ 'draggable': true });\n");
      out.write("});\n");
      out.write(" \n");
      out.write("function GetRoute() {\n");
      out.write("    var mumbai = new google.maps.LatLng(18.9750, 72.8258);\n");
      out.write("    var mapOptions = {\n");
      out.write("        zoom: 7,\n");
      out.write("        center: mumbai\n");
      out.write("    };\n");
      out.write("    map = new google.maps.Map(document.getElementById('dvMap'), mapOptions);\n");
      out.write("    directionsDisplay.setMap(map);\n");
      out.write("    directionsDisplay.setPanel(document.getElementById('dvPanel'));\n");
      out.write(" \n");
      out.write("    //*********DIRECTIONS AND ROUTE**********************//\n");
      out.write("    source = document.getElementById(\"txtSource\").value;\n");
      out.write("    destination = document.getElementById(\"txtDestination\").value;\n");
      out.write(" \n");
      out.write("    var request = {\n");
      out.write("        origin: source,\n");
      out.write("        destination: destination,\n");
      out.write("        travelMode: google.maps.TravelMode.DRIVING\n");
      out.write("    };\n");
      out.write("    directionsService.route(request, function (response, status) {\n");
      out.write("        if (status == google.maps.DirectionsStatus.OK) {\n");
      out.write("            directionsDisplay.setDirections(response);\n");
      out.write("        }\n");
      out.write("    });\n");
      out.write(" \n");
      out.write("    //*********DISTANCE AND DURATION**********************//\n");
      out.write("    var service = new google.maps.DistanceMatrixService();\n");
      out.write("    service.getDistanceMatrix({\n");
      out.write("        origins: [source],\n");
      out.write("        destinations: [destination],\n");
      out.write("        travelMode: google.maps.TravelMode.DRIVING,\n");
      out.write("        unitSystem: google.maps.UnitSystem.METRIC,\n");
      out.write("        avoidHighways: false,\n");
      out.write("        avoidTolls: false\n");
      out.write("    }, function (response, status) {\n");
      out.write("        if (status == google.maps.DistanceMatrixStatus.OK && response.rows[0].elements[0].status != \"ZERO_RESULTS\") {\n");
      out.write("            var distance = response.rows[0].elements[0].distance.text;\n");
      out.write("            var duration = response.rows[0].elements[0].duration.text;\n");
      out.write("            var dvDistance = document.getElementById(\"dvDistance\");\n");
      out.write("           dvDistance.innerHTML = \"\";\n");
      out.write("            dvDistance.innerHTML += \"Distance: \" + distance + \"<br />\";\n");
      out.write("            dvDistance.innerHTML += \"Duration:\" + duration;\n");
      out.write(" \n");
      out.write("        } else {\n");
      out.write("            alert(\"Unable to find the distance via road.\");\n");
      out.write("        }\n");
      out.write("    });\n");
      out.write("}\n");
      out.write("</script>\n");
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
