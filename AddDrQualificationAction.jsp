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
  int idrid = Integer.parseInt(request.getParameter("drid"));
  String  qualification =request.getParameter("qualification");
  String  institute =request.getParameter("institute");
  
  
  DrQualification q=new DrQualification();
				q.setDrId(idrid);
				q.setQualification(qualification);
				q.setInstitute(institute);  
  
  String result=DrQualificationWorker.addDrQualification(q);
  if(result.equals(Results.SUCCESS))
  {
  //out.println("Inserted Succesfully!"); 
  session.setAttribute("message","Data inserted successfully.");
  response.sendRedirect("drqualificationdata.jsp");	
  }
  else
  {
  out.println("Insertion Failed!");
  }
  
  %>
  
 
 </body>
</html>
