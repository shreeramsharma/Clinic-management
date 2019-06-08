<%@page import="com.hinduja.asterix.*"%>
 <%
String action = request.getParameter("DoctorChangeP");
if(action != null){
	  String currentp=JSP.clearEntity(request.getParameter("currentp"));
	  String newp=JSP.clearEntity(request.getParameter("newp"));
	  String confirmp=JSP.clearEntity(request.getParameter("confirmp"));
	String adminId = request.getParameter("adminId");
    Doctor d=DoctorWorker.getDoctorbyId(DrId); 
	int dbaId = d.getId();
	String dbcurrentp = d.getPassword();


	  if(newp.equals(confirmp)){
		 if(currentp.equals(dbcurrentp)){
			 
			   Doctor d=new Doctor();
			   d.setId(dbaId);
					d.setPassword(newp);
					
					
		String result=DoctorWorker.updateDoctor(d);
		 if(result.equals(Results.SUCCESS))
  {
    session.setAttribute("message","Password Updated successfully.");
  response.sendRedirect("AdminSettings.jsp");
  }
  else
  {
  session.setAttribute("message","Something went wrong !! Please try again..");
  response.sendRedirect("AdminSettings.jsp");
  }
		 
		 }else{
		 
			  
  session.setAttribute("message","Current Password doesn't match");
  response.sendRedirect("AdminSettings.jsp");

		 }	  
	  }else{
  		  
  session.setAttribute("message","Both Password must be same");
  response.sendRedirect("AdminSettings.jsp");
	  }

}else{
  response.sendRedirect("AdminSettings.jsp");
}
%>