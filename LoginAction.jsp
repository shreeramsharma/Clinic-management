<%@page import="com.hinduja.asterix.*"%>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Document</title>
 </head>
 <body>
  <%
  String email=request.getParameter("email");
  String password=request.getParameter("password");

Doctor d=new Doctor();
d.setEmail(email);
d.setPassword(password);

  String result=DoctorWorker.checkLogin(d);
  if(result.equals("SUCCESS"))
  {
 session.setAttribute("seemail",d.getEmail()); 
  session.setAttribute("sepassword",d.getPassword()); 

response.sendRedirect("index.jsp");
  %>

  <%
  }
  else
  {
//out.println("Failed");

	response.sendRedirect("login.jsp");

//response.sendRedirect("login.html");
  }
  %>
 </body>
</html>
