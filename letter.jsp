<%@ page import="com.hinduja.asterix.*,java.sql.*,java.util.*"%>
<%
 String seemail=(String)session.getAttribute("seemail");  

 String sepassword=(String)session.getAttribute("sepassword");  

 String seid = "";
 String sefname = "";
 String selname = "";
 if(seemail==null &&  sepassword == null)
 {
	session.invalidate();
	response.sendRedirect("login.jsp");
 }else{


 try{
  String url = "jdbc:mysql://localhost/clinicmanagement";
 String user = "root";
 String pass = "root";
Class.forName("com.mysql.jdbc.Driver");
Connection myConn = DriverManager.getConnection(url,user,pass);
Statement myStmt = myConn.createStatement();
String query = "Select * from doctor where email = '"+seemail+"' and password = '"+sepassword+"'  ";
ResultSet rs = myStmt.executeQuery(query);
while(rs.next()){
seid = rs.getString("id"); 
sefname = rs.getString("firstname"); 
selname = rs.getString("lastname"); 

}
 }catch(Exception e){
 e.printStackTrace();
 }


 %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta name="description" content="Responsive Admin Template" />
    <meta name="author" content="RedstarHospital" />
    <title>Redstar Hospital | Bootstrap Responsive Hospital Admin Template</title>
    <!-- google font -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&amp;subset=all" rel="stylesheet" type="text/css" />
	<!-- icons -->
    <link href="../assets/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<!--bootstrap -->
      <link href="css/signup/theme_style.css" rel="stylesheet" id="rt_style_components" type="text/css" />
   
    <link href="css/signup/style.css" rel="stylesheet" type="text/css" />
   
	<link href="css/signup/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Material Design Lite CSS -->
	<link rel="stylesheet" href="css/signup/iconic/css/material.min.css">
	<link rel="stylesheet" href="css/material_style.css">
	<!-- Theme Styles -->
    <link href="css/theme_style.css" rel="stylesheet" id="rt_style_components" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/plugins.min.css" rel="stylesheet" type="text/css" />
    <link href="css/responsive.css" rel="stylesheet" type="text/css" />
	<link href="css/theme-color.css" rel="stylesheet" type="text/css" />
	<!-- favicon -->
    <link rel="shortcut icon" href="img/favicon.ico" /> 
</head>
<!-- END HEAD -->
<body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md page-full-width header-white white-sidebar-color logo-indigo">
  
        <%	int id=Integer.parseInt(request.getParameter("id"));
    Prescription p=PrescriptionWorker.getPrescriptionbyId(id);

 	
    Patient pw=PatientWorker.getPatientbyId(p.getPtId());
	int itseid = Integer.parseInt(seid);
    Doctor d=DoctorWorker.getDoctorbyId(itseid);
    DrQualification dq=DrQualificationWorker.getDrQualificationbyDrId(itseid);
    
    

	
%>
			<div class="container">
            <div class="page-content-wrapper">
                <div class="page-content">
                   
				   <div class="row">
					<div class="col-md-12">
						<div class="white-box">
						   
							<div class="row">
						<div class="col-md-12">
							<div class="pull-left">
								<address>
				<img src="./plugins/images/pres1.jpg" alt="home" class="light-logo" />
             

				</address>
			</div>
			<div class="pull-right text-right">
				<address>
					
					<p class="font-bold addr-font-h4" style="text-transform: capitalize;">Dr.  	<%= d.getFirstName()%> <%= d.getLastName()%></p>
					<p><strong style="text-transform: uppercase;"> <%= dq.getQualification() %></p></strong>
					<p class="text-muted m-l-30"><strong><%= d.getClinicaddress()%></strong>
						
						
					</p>
					<p class="m-t-30">
						
						
					</p>
					<p>
						
					</p>
				</address>
			</div>
		</div>
		 <strong><p class="font-bold addr-font-h5" style="text-transform: capitalize;">Name: <%= pw.getFirstName()%> <%= pw.getLastName()%>&ensp; Email:<%= pw.getEmail()%>&ensp; <br>Age: <%= pw.getAge()%>&ensp; Gender: <%= pw.getGender()%><br><b>Date :</b> <i class="fa fa-calendar"></i> <%= p.getDate()%> <br> Time:<i class="fi-clock"></i> <%= p.getTime()%> </p></strong>
		<div class="col-md-12">
			<div class="table-responsive m-t-40">
				<table class="table table-hover">
					<thead>
						<tr>
							<th class="text-center">#</th>
	                                                    <th>Medicine</th>
	                                                    <th class="text-right">Dosage</th>
	                                                    <th class="text-right">Number Of Days</th>
	                                                   
	                                                </tr>
	                                            </thead>
	                                            <tbody> 
												<%ArrayList<Presmedi> list2=PresmediWorker.getAllPresmedibyPres_Id(id);%>
												 <%for(Presmedi m:list2) {
													 %>
	                                                <tr>
	                                                    <td class="text-center">1</td>
	                                                    <td><%= m.getMedicine()%></td>
	                                                    <td><%= m.getDosage()%></td>
	                                                    <td><%= m.getDays()%></td>
	                                                    
	                                                </tr>
													<%
												 }
													%>
	                                                
	                                            </tbody>
	                                        </table>
	                                    </div>
	                                </div>
	                                							
	                                <div class="col-md-12">
	                                    <div class="pull-right m-t-30 text-right">
	                                       <h4><strong>Total Charges</strong></h4>
										   
										
										 <div class="text-muted m-l-30"><i class="fa fa-inr"></i><strong><%= p.getPatientcharges()%>/-</div	></strong>
										
	                                    <div class="clearfix"></div>
	                                    <hr>
										<div class="text-right">
	                                        <button class="btn btn-danger" type="submit"> Proceed to payment </button>
	                                        <button onclick="javascript:window.print();" class="btn btn-default btn-outline" type="button"> <span><i class="fa fa-print"></i> Print</span> </button>
	                                        </div>
	                                   
										
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
                </div>
            </div>
            <!-- end page content -->
            <!-- start chat sidebar -->
            <div class="chat-sidebar-container" data-close-on-body-click="false">
                <div class="chat-sidebar">
                   
                   
 					
            <!-- end chat sidebar -->
        </div>
        <!-- end page container -->
        <!-- start footer -->
        <div class="page-footer">
            
            <div class="scroll-to-top">
                <i class="icon-arrow-up"></i>
            </div>
        </div>
        <!-- end footer -->
    </div>
    <!-- start js include path -->

</body>


</html>
<%
 }
%>