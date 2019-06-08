<%@ page import="com.hinduja.asterix.*,java.sql.*"%>
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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="./plugins/images/favicon1.ico">
    <title>Clinic Management</title>
    <!-- Bootstrap Core CSS -->
    <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="css/animate.css" rel="stylesheet">
    <!-- Menu CSS -->
    <link href="./plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="css/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="css/colors/default.css" id="theme" rel="stylesheet">
   
</head>

<body class="fix-header">
        <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
        </svg>
    </div>
   <div id="wrapper">
    
        <nav class="navbar navbar-default navbar-static-top m-b-0">
            <div class="navbar-header">
                 <jsp:include page="header-links.jsp" />
                <!-- /Logo -->
                <!-- Search input and Toggle icon -->
                <ul class="nav navbar-top-links navbar-left">
                    <li><a href="javascript:void(0)" class="open-close waves-effect waves-light"><i class="ti-menu"></i></a></li>
                    <li class="dropdown">
                        
                       
                    </li>
                   
                </ul>
                <ul class="nav navbar-top-links navbar-right pull-right">
                    <li>
                        <form role="search" class="app-search hidden-sm">
                            <input type="text" placeholder="Search..." class="form-control"> <a href=""><i class="fa fa-search"></i></a> </form>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#"> <img src="./plugins/images/users/user.jpg" alt="user-img" width="36" class="img-circle"><b class="hidden-xs"><%= sefname%><%= selname%></b><span class="caret"></span> </a>
                        <ul class="dropdown-menu dropdown-user animated flipInY">
                            <li>
                                <div class="dw-user-box">
                                    <div class="u-img"><img src="./plugins/images/users/user.jpg" alt="user" /></div>
                                    <div class="u-text">
                                        <h4><%= sefname%><%= selname%></h4>
                                        <p class="text-muted"><%= seemail%></p><a href="profile1.jsp" class="btn btn-rounded btn-danger btn-sm">View Profile</a></div>
                                </div>
                            </li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#"><i class="ti-user"></i> My Profile</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="logout.jsp"><i class="fa fa-power-off"></i> Logout</a></li>
                        </ul>
                        <!-- /.dropdown-user -->
                    </li>
                    <!-- /.dropdown -->
                </ul>
            </div>
         
        </nav>
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav slimscrollsidebar">
                <div class="sidebar-head">
                    <h3><span class="fa-fw open-close"><i class="ti-close ti-menu"></i></span> <span class="hide-menu">Navigation</span></h3> </div>
                <div class="user-profile">
                    <div class="dropdown user-pro-body">
                             <div><img src="./plugins/images/users/user.jpg" alt="user-img" class="img-circle"></div>
						<h3><%= sefname%><%= selname%></h3>
                    </div>
                </div>
                                 
                         <jsp:include page="navbar.html" />
       
                           
                   
                   
                             
                            </li>
                        </ul>
                    </li>
                 
                </ul>
            </div>
        </div>
      
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">Prescription records </h4> </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                          <a href="PrescriptionForm.jsp"  class="btn btn-success pull-right m-l-20 hidden-xs hidden-sm waves-effect waves-light">Add More Prescription</a>
                        
                    </div>
                </div>
		    </header>
			 <div class="white-box table-responsive">
    <table id="bootstrap-data-table" class="table table-striped table-bordered">
                    <thead>
                      <tr>
					  <th>patient name</th>
					  <th>patient email</th>
					  <th>Patient Complaints</th>
                        <th>Findings</th>
                        <th>Advice</th>
                        <th>Patient Charges</th>
                        <th>Date</th>
                        <th>Time</th>
						<th>Options</th>

                      </tr>
                    </thead>
                    <tbody>
                   
 <%
 try{

 int id;
 int dr_id;
 int pt_id;
 String pt_complaints = "";
 String findings = "";
 String advice = "";
 String patientcharges = "";
 String date = "";
 String time = "";
  String url = "jdbc:mysql://localhost/clinicmanagement";
 String user = "root";
 String pass = "root";
Class.forName("com.mysql.jdbc.Driver");
Connection myConn = DriverManager.getConnection(url,user,pass);
Statement myStmt = myConn.createStatement();
String query = "Select * from prescription where dr_id='"+seid+"'";
ResultSet rs = myStmt.executeQuery(query);
while(rs.next()){


id = rs.getInt("id"); 
dr_id = rs.getInt("dr_id"); 
pt_id = rs.getInt("pt_id"); 
pt_complaints  = rs.getString("pt_complaints");
findings = rs.getString("findings"); 
advice = rs.getString("advice");
patientcharges = rs.getString("patientcharges");
date = rs.getString("date");
time = rs.getString("time");

Patient p=PatientWorker.getPatientbyId(pt_id);
%>
                      <tr>
					  <td><%= p.getFirstName() %> <%= p.getLastName() %> </td>
					  <td><%= p.getEmail() %> </td>
                        <td ><!---<a href="updateform.jsp?update_id=<%= id %>">----><%= pt_complaints %></td></a>
                        <td><%= findings %></td>
                        <td><%= advice %></td>
                        <td><%= patientcharges %></td>
                        <td><%= date %></td>
                        <td><%= time %></td>
						<td><a href="deleteprescription.jsp?delete_id=<%= id %>"><button  class="btn btn-danger" onclick="return confirm('Are you sure to delete ?');"><i class="fa fa-trash"></i></button></a>&ensp;
						<a href="prescriptionupdateform.jsp?update_id=<%= id %>"><button  class="btn btn-primary" >	<i class="fa fa-pencil"></i></button></a>
						<a target="_blank" href="letter.jsp?id=<%= id %>"><i class="icon glyphicon glyphicon-duplicate" aria-hidden="true" style="font-size: 22px;"></i></a>
						</td>
						
                      </tr>
   <%                   
}

 %>
 </body>
</html>
<%
 }catch(Exception e){
 e.printStackTrace();
 }
 %><br><br><%
            Object messg=session.getAttribute("message");
            if(messg!=null)
            {
            String messg1=(String)messg;
            session.setAttribute("message","");
            %>
           <center> <b><%=messg1%></b></center>
            <%
            }
            else
            {
                
            }
%>
    <!-- .right-sidebar -->
                <div class="right-sidebar">
                    <div class="slimscrollright">
                        <div class="rpanel-title"> Service Panel <span><i class="ti-close right-side-toggle"></i></span> </div>
                        <div class="r-panel-body">
                            <ul id="themecolors" class="m-t-20">
                                <li><b>With Light sidebar</b></li>
                                <li><a href="javascript:void(0)" data-theme="default" class="default-theme">1</a></li>
                                <li><a href="javascript:void(0)" data-theme="green" class="green-theme">2</a></li>
                                <li><a href="javascript:void(0)" data-theme="gray" class="yellow-theme">3</a></li>
                                <li><a href="javascript:void(0)" data-theme="blue" class="blue-theme">4</a></li>
                                <li><a href="javascript:void(0)" data-theme="purple" class="purple-theme">5</a></li>
                                <li><a href="javascript:void(0)" data-theme="megna" class="megna-theme">6</a></li>
                                <li><b>With Dark sidebar</b></li>
                                <br/>
                                <li><a href="javascript:void(0)" data-theme="default-dark" class="default-dark-theme">7</a></li>
                                <li><a href="javascript:void(0)" data-theme="green-dark" class="green-dark-theme">8</a></li>
                                <li><a href="javascript:void(0)" data-theme="gray-dark" class="yellow-dark-theme">9</a></li>
                                <li><a href="javascript:void(0)" data-theme="blue-dark" class="blue-dark-theme">10</a></li>
                                <li><a href="javascript:void(0)" data-theme="purple-dark" class="purple-dark-theme">11</a></li>
                                <li><a href="javascript:void(0)" data-theme="megna-dark" class="megna-dark-theme working">12</a></li>
                            </ul>
                         
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
                  <footer class="footer text-center"> 2018 &copy; by Clinic Management </footer>
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    <!-- jQuery -->
    <script src="./plugins/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Menu Plugin JavaScript -->
    <script src="./plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
    <!--slimscroll JavaScript -->
    <script src="js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="js/waves.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="js/custom.min.js"></script>
    <script src="js/validator.js"></script>
    <!--Style Switcher -->
    <script src="./plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
</body>

</html>
<%
 }
%>
