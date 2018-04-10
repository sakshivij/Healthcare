<%-- 
    Document   : mail
    Created on : Apr 7, 2018, 11:46:47 PM
    Author     : HCL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>

<html>

    <head>

        <title>Sending Mail Through JSP</title>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="viewport" content="width=device-width">

    </head>

    <body bgcolor="khaki">

        <form action="mailJSP.jsp">

            <table>

                <tr><td><b><font color="red">To:

                    </td>

                    <td><b><b><input type="text" name="mail" value="Enter sender mail-id"/><br/>

                    </td>

                </tr>

                <tr>

                    <td>

                        <b><font color="red">Subject:

                    </td>

                    <td>

                        <input type="text" name="sub" value="Enter Subject Line"><br/>

                    </td>

                </tr>

                <tr>

                    <td>

                        <b><font color="red">Message Text:

                    </td>

                    <td>

                        <textarea rows="12" cols="80" name="mess"></textarea><br/>

                    </td>

                </tr>

                <tr>

                    <td>

                        <input type="submit" value="Send">

                    </td>

                    <td>

                        <input type="reset" value="Reset">

                    </td>

                </tr>

            </table>

        </form>

    </body>

</html>