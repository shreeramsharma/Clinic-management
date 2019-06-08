<%@ page import="java.sql.*,com.hinduja.asterix.*" %>

<%
String stid = request.getParameter("id");
int id= Integer.parseInt(stid);		
String pt_complaints=request.getParameter("pt_complaints");
String findings=request.getParameter("findings");
String advice=request.getParameter("advice");
String date=request.getParameter("date");
String time=request.getParameter("time");

Prescription p=new Prescription();
  p.setPtcomplaints(pt_complaints);
  p.setFindings(findings);
  p.setAdvice(advice);
  p.setDate(date);
  p.setTime(time);
  p.setId(id);
 
  String result=PrescriptionWorker.updatePrescription(p);
if(result.equals(Results.SUCCESS)){
//out.println("Updated Succesfully");
 session.setAttribute("message","Data updated successfully.");
response.sendRedirect("prescriptiondata.jsp");		

}else{
out.println("Something went wrong!");
}

%>