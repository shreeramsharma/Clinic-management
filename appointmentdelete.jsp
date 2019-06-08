<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Delete Data</title>
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


String sql = "DELETE FROM appointment WHERE id="+delete_id;

PreparedStatement ps = myConn.prepareStatement(sql);

int i = ps.executeUpdate();
//out.println("Data deleted");
response.sendRedirect("index.jsp");



}catch(Exception e){
e.printStackTrace();
}
}


%>

 </body>
</html>
