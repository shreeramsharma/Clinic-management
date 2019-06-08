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
 
  String title=request.getParameter("title");
  String firstname=request.getParameter("firstname");
  String lastname=request.getParameter("lastname");
  String dateofappointment=request.getParameter("dateofappointment");
  String address=request.getParameter("address");
  String dateofbirth=request.getParameter("dateofbirth");
  String contact=request.getParameter("contact");
  String email=request.getParameter("email");
  String consultingdoctor=request.getParameter("consultingdoctor");
  String injury=request.getParameter("injury");
  String note=request.getParameter("note");
  String dr_id = request.getParameter("dr_id");

  
  Appointment a=new Appointment();
  a.setTitle(title);
  a.setFirstname(firstname);
  a.setLastname(lastname);
  a.setDateofappointment(dateofappointment);
  a.setAddress(address);
  a.setDateofbirth(dateofbirth);
  a.setContact(contact);
  a.setEmail(email);
  a.setConsultingdoctor(consultingdoctor);
  a.setInjury(injury);
  a.setNote(note);
  a.setDrId(dr_id);
  
  
  String result=AppointmentWorker.addAppointment(a);
  if(result.equals(Results.SUCCESS))
  {
  //out.println("Inserted Succesfully!");
  session.setAttribute("message","Appointment Submitted successfully.");
	response.sendRedirect("appointment.jsp");	

  }
  else
  {
  out.println("Insertion Failed!");
  }
  
  %>
  
 
 </body>
</html>
