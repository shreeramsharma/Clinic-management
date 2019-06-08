<%@ page import="java.sql.*,com.hinduja.asterix.*" %>

<%
String stid = request.getParameter("id");
int id= Integer.parseInt(stid);		
String firstname=request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String dateofbirth=request.getParameter("dateofbirth");
String gender=request.getParameter("gender");
String age=request.getParameter("age");
String email=request.getParameter("email");
String address=request.getParameter("address");
String contact=request.getParameter("contact");
String dr_id=request.getParameter("dr_id");

Patient p=new Patient();
  p.setFirstName(firstname);
  p.setLastName(lastname);
  p.setDateofbirth(dateofbirth);
  p.setGender(gender);
  p.setAge(age);
  p.setEmail(email);	
  p.setAddress(address);
  p.setContact(contact);
  p.setId(id);
  p.setDrId(dr_id);
  String result=PatientWorker.updatePatient(p);
if(result.equals(Results.SUCCESS)){
//out.println("Updated Succesfully");
 session.setAttribute("message","Data updated successfully.");
response.sendRedirect("patientdata.jsp");		

}else{
out.println("Something went wrong!");
}

%>