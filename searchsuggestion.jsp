<%@page import="java.sql.*,com.hinduja.asterix.*,java.util.*"%>

<%
   String email = "";
   String q = request.getParameter("query");
   if(q.length()>2) {  


 ArrayList<Patient> list2=PatientWorker.getAllPatientbyName(q); 
  for(Patient bt2:list2)
                            {
		out.println("<ul class=\"list-unstyled\">");
		out.print("<li>"+bt2.getFirstName()+" "+bt2.getLastName()+"</li>");
								
			}
			out.println("</ul>");	
   }else{
	   
 ArrayList<Patient> list2=PatientWorker.getAllPatientbyNameLength(q); 
  for(Patient bt2:list2)
                            {
		out.println("<ul class=\"list-unstyled\">");
		out.print("<li>"+bt2.getFirstName() +" "+bt2.getLastName()+"</li>");
								
			}
			out.println("</ul>");	
   }
%>