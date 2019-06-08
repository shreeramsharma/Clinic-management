<%@ page import="java.sql.*,com.hinduja.asterix.*" %>

<%
String stid = request.getParameter("id");
int id= Integer.parseInt(stid);		
String firstname=request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String contact=request.getParameter("contact");
String clinicaddress=request.getParameter("clinicaddress");
String email=request.getParameter("email");
String password=request.getParameter("password");


Doctor d=new Doctor();
  d.setFirstName(firstname);
  d.setLastName(lastname);
  d.setContact(contact);	
  d.setClinicaddress(clinicaddress);
  d.setEmail(email);
  d.setId(id);
 
  String result=DoctorWorker.updateDoctor(d);
if(result.equals(Results.SUCCESS)){
//out.println("Updated Succesfully");
 session.setAttribute("message","Data updated successfully.");
response.sendRedirect("profile1.jsp");		

}else{
out.println("Something went wrong!");
}

%>