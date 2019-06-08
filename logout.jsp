
<%@page contentType="text/html" pageEncoding="UTF-8" import="com.myinstitute.*,java.io.*,java.lang.*,java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String seusername="";
        Object o=session.getAttribute("seusername");
        if(o==null)
            {
                session.invalidate();
                response.setHeader("Cache-Control","no-cache");
                response.setHeader("Cache-Control","no-store");
                response.setHeader("Pragma","no-cache");
                response.setDateHeader ("Expires", 0);
                response.sendRedirect("login.jsp");
            }
        else
        {
            session.invalidate();
             response.sendRedirect("login.jsp");
        }
        %>
    </body>
</html>
