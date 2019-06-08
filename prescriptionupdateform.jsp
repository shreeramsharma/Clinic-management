<%@ page import="java.sql.*,com.hinduja.asterix.*"%>
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
    <title>Clinic Mangement</title>
                 
</head>

<body class="fix-header">
<%
//String update_id=request.getParameter("update_id");
int upd_id=Integer.parseInt(request.getParameter("update_id"));
Prescription p=PrescriptionWorker.getPrescriptionbyId(upd_id);


%>

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
                        <form role="search" class="app-search hidden-sm 	">
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
                            <li><a href="#"><i class="ti-wallet"></i> My Balance</a></li>
                            <li><a href="#"><i class="ti-email"></i> Inbox</a></li>
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

            </div>
        </div>

        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">Update Prescription Data </h4> </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                    </div>
                </div
                <!-- .row -->
                <div class="col-md-8 col-xs-12">
                        <div class="white-box">
                            <form class="form-horizontal form-material" action="updateprescription.jsp" method="POST">
							<input type="hidden" name="PtId" value="<%= seid%>">
							<input type="hidden" name="id" value="<%= p.getId()%>">
                                
								<div class="form-group">
                                    <label class="col-md-12">Patient Complaints</label>
                                    <div class="col-md-12">
                                        <input type="text" name="pt_complaints" value="<%= p.getPtcomplaints()%>" placeholder="Enter ptcomplaints	 complaints...." class="form-control form-control-line"> </div>
                                </div>
                                <div class="form-group">
                                    <label for="example-email" class="col-md-12">Findings</label>
                                    <div class="col-md-12">
                                        <input type="text" name="findings" value="<%= p.getFindings()%>" placeholder="Enter findings..." class="form-control form-control-line" name="example-email" id="example-email"> </div>
                                </div>
								<div class="form-group">
                                    <label class="col-md-12">Advice</label>
                                    <div class="col-md-12">
                                        <input type="text" name="advice" value="<%= p.getAdvice()%>" placeholder="Enter Advice...." class="form-control form-control-line"> </div>
                                </div>
								<div class="form-group">
                                    <label class="col-md-12">Patient Charges</label>
                                    <div class="col-md-12">
                                        <input type="text" name="patientcharges" value="<%= p.getPatientcharges()%>" placeholder="Enter Patient charges...." class="form-control form-control-line"> </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Date</label>
                                    <div class="col-md-12">
                                        <input type="date" name="date" value="<%= p.getDate()%>" placeholder="Enter date...." class="form-control form-control-line"> </div>
                                </div>
								<div class="form-group">
                                    <label class="col-md-12">Time</label>
                                    <div class="col-md-12">
                                        <input type="time" name="time" value="<%= p.getTime()%>" placeholder="Enter Time...." class="form-control form-control-line"> </div>
                                </div>
                                <div class="form-group">
                                   <button type="submit" class="btn btn-primary btn-sm">
                                      <i class="fa fa-dot-circle-o"></i> Submit
                                   </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-sm-6">
                       
                           
             
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