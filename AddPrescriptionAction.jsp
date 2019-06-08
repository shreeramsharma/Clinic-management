<%@page import="com.hinduja.asterix.*, java.io.*, java.lang.*, java.sql.*,java.util.*,java.text.*"%>
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

   int idrid = Integer.parseInt(request.getParameter("drid"));
   int iptid = Integer.parseInt(request.getParameter("ptid"));
  String  pt_complaints =request.getParameter("pt_complaints");
  String  findings =request.getParameter("findings");
  String  advice =request.getParameter("advice");
  String  patientcharges =request.getParameter("patientcharges");
  
 java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
String cdate = df.format(date);

   Calendar now = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
	String ctime = sdf.format(now.getTime());

  
  
  Prescription p=new Prescription();
				p.setDrId(idrid);
				p.setPtId(iptid);
				p.setPtcomplaints(pt_complaints);
				p.setFindings(findings);
				p.setAdvice(advice);
				p.setPatientcharges(patientcharges);
				p.setDate(cdate);
				p.setTime(ctime);  
  
  String result=PrescriptionWorker.addPrescription(p);
  if(result.equals(Results.SUCCESS))
  {
  //out.println("Inserted Succesfully!"); 
  session.setAttribute("message","Data inserted successfully.");
  response.sendRedirect("prescriptiondata.jsp");	
  }
  else
  {
  out.println("Insertion Failed!");
  }
  
  %>
 
 </body>
</html>
