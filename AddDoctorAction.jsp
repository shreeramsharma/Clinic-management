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
 // String user=(String)session.getAttribute("user");
  String FirstName=request.getParameter("firstname");
  String LastName=request.getParameter("lastname");

  String Contact=request.getParameter("contact");
  String Clinicaddress=request.getParameter("clinicaddress");
String email = request.getParameter("email");
String password = request.getParameter("password");
  
  Doctor d=new Doctor();
  d.setFirstName(FirstName);
  d.setLastName(LastName);

  d.setContact(Contact);
  d.setClinicaddress(Clinicaddress);
  d.setEmail(email);
  d.setPassword(password);
  
  
  String result=DoctorWorker.addDoctor(d);
  if(result.equals(Results.SUCCESS))
  {
  //out.println("Inserted Succesfully!"); 
  session.setAttribute("message","Data inserted successfully.");
  response.sendRedirect("index.jsp");	
  }
  else
  {
  out.println("Insertion Failed!");
  }
  
  %>
  
 
 </body>
</html>
