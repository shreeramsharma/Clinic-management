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
 String result = "";
 
  String Medicine[]=request.getParameterValues("medicine[]");
  String dosage1[]=request.getParameterValues("dosage1[]");
  String dosage2[]=request.getParameterValues("dosage2[]");
  String dosage3[]=request.getParameterValues("dosage3[]");
  String[] totaldosage = new String[100];
  String Days=request.getParameter("days");
  String Comments=request.getParameter("comments");
  String  pres_id = request.getParameter("pres_id");
  String  dr_id = request.getParameter("dr_id");
  int ipres_id = Integer.parseInt(pres_id);
  Presmedi m=new Presmedi();
  for(int i=0;i<Medicine.length;i++){
	totaldosage[i] = dosage1[i] +"-"+ dosage2[i] +"-"+ dosage3[i];
  m.setMedicine(Medicine[i]);
  m.setDosage(totaldosage[i]);
  m.setDays(Days);
  m.setComments(Comments);
  m.setPres_Id(ipres_id);
  m.setDr_Id(dr_id);
  
  result=PresmediWorker.addPresmedi(m); 
  }
  
  
  if(result.equals(Results.SUCCESS))
  {
  //out.println("Inserted Succesfully!"); 
  session.setAttribute("message","Data inserted successfully.");
   response.sendRedirect("PresmediForm.jsp");	
  }
  else
  {
  out.println("Insertion Failed!");
  }
  
  %>
  
 
 </body>
</html>
