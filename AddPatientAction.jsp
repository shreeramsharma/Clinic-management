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
  String FirstName=request.getParameter("firstname");
  String LastName=request.getParameter("lastname");
  String Dateofbirth=request.getParameter("dateofbirth");
  String Gender=request.getParameter("gender");
  String Age=request.getParameter("age");
  String Email=request.getParameter("email");
  String Address=request.getParameter("address");
  String Contact=request.getParameter("contact");
  String dr_id = request.getParameter("dr_id");
  
  Patient p=new Patient();
  p.setFirstName(FirstName);
  p.setLastName(LastName);
  p.setDateofbirth(Dateofbirth);
  p.setGender(Gender);
  p.setAge(Age);
  p.setEmail(Email);
  p.setAddress(Address);
  p.setContact(Contact);
  p.setDrId(dr_id);
  
  
  String result=PatientWorker.addPatient(p);
  if(result.equals(Results.SUCCESS))
  {
 // out.println("Inserted Succesfully!"); 
  session.setAttribute("message","Data inserted successfully.");
  response.sendRedirect("patientdata.jsp");	
  }
  else
  {
  out.println("Insertion Failed!");
  }
  
  %>
  
 
 </body>
</html>
