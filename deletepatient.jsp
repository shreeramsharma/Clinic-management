<%@page import="com.hinduja.asterix.*"%>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Delete Patient Data</title>
 </head>
 <body>
  <%@ page import="java.sql.*"%>

<%

String delete_id = request.getParameter("delete_id");
if(delete_id != null){
  try{

String url = "jdbc:mysql://localhost:3306/clinicmanagement";
String user = "root";
String pass = "root";

Class.forName("com.mysql.jdbc.Driver");
Connection myConn = DriverManager.getConnection(url,user,pass);


String sql = "DELETE FROM patient WHERE id="+delete_id;

PreparedStatement ps = myConn.prepareStatement(sql);

int i = ps.executeUpdate();
int ptdeleteid = Integer.parseInt(delete_id);
String deletePresciption=PrescriptionWorker.deleteprescriptionbyptid(ptdeleteid);
  

//out.println("Data deleted");
response.sendRedirect("patientdata.jsp");



}catch(Exception e){
e.printStackTrace();
}
}


%>

 </body>
</html>
