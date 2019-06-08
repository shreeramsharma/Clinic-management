<%@ page import="com.hinduja.asterix.*,java.sql.*,java.util.*"%>
<%
 String seemail=(String)session.getAttribute("seemail");  

 String sepassword=(String)session.getAttribute("sepassword");  

 Integer iseid = null;
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
iseid = rs.getInt("id"); 
sefname = rs.getString("firstname"); 
selname = rs.getString("lastname"); 

}

 }catch(Exception e){
 e.printStackTrace();
 }
//int iseid = Integer.parseInt(seid);

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
	
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <title>Clinic Management</title>
                   
<script>

     $(document).ready(function(){
      var i=1;
     $("#add_row").click(function(){
      $('#addr'+i).html('<div ><label class="col-md-12" style="padding-top:30px;">Medicine</label><div class="col-md-12"><input type="text" name="medicine[]" placeholder="Enter Medicine...." class="form-control form-control-line"> </div><div class="col-md-12" style="padding-top:30px;"><label >Dosage</label><br>&ensp;<select name="dosage1[]" class="btn btn-default dropdown-toggle"><ul class="dropdown-menu"><option>1</option><option>0</option></select>&ensp;<select name="dosage2[]" class="btn btn-default dropdown-toggle"><option>1</option><option>0</option></select>&ensp;<select name="dosage3[]" class="btn btn-default dropdown-toggle"><option>1</option><option>0</option></select></u></div></div>');

      $('#tab_logic').append('<div id="addr'+(i+1)+'"></div>');
      i++; 
  });
     $("#delete_row").click(function(){
    	 if(i>1){
		 $("#addr"+(i-1)).html('');
		 i--;
		 }
	 });

});
</script>

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
                        <a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#"> <img src="./plugins/images/users/user.jpg" alt="user-img" width="36" class="img-circle"><b class="hidden-xs" style="text-transform: capitalize;"><%= sefname%> <%= selname%></b><span class="caret"></span> </a>
                        <ul class="dropdown-menu dropdown-user animated flipInY">
                            <li>
                                <div class="dw-user-box">
                                    <div class="u-img"><img src="./plugins/images/users/user.jpg" alt="user" /></div>
                                    <div class="u-text">
                                        <h4 style="text-transform: capitalize;"><%= sefname%> <%= selname%></h4>
                                        <p class="text-muted"><%= seemail%></p><a href="profile1.jsp" class="btn btn-rounded btn-danger btn-sm">View Profile</a></div>
                                </div>
                            </li>
                            <li role="separator" class="divider"></li>
                            <li><a href="DrQualificationForm.jsp"><i class="ti-user"></i> My Profile</a></li>
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
                        <h4 class="page-title">Medicine </h4> </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        
                      
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- .row -->
                <div class="col-md-8 col-xs-12">
				  
                        <div class="white-box">
						
                            <form class="form-horizontal form-material" action="AddPresmediAction.jsp" method="POST">
							<div class="form-group">
                                    <label class="col-md-12">Patient Id</label>
                                     <div class="col-12 col-md-6">
									 <%ArrayList<Prescription> list2=PrescriptionWorker.getAllPrescriptionbyDrId(iseid);
										
									 %>
													   
                                                    <select name="pres_id" id="select" class="form-control" required="">
													   <option disabled selected value=""> -- select an option -- </option>
                                                       
                                                      <%for(Prescription bt2:list2)
                                                      {
                                                      %>
                                                 <option value="<%= bt2.getId()%>" style="text-transform: uppercase;"><%												 
												 
													   Patient pt=PatientWorker.getPatientbyId(bt2.getPtId());										   
												 %><%= pt.getFirstName()%> <%= pt.getLastName()%></option>
                                               <%
                                                    }
                                               %>
                                               														
                                                      
                                                 </select>
                                                </div>
												</div>
                                <div class="form-group">
								<input type="hidden" name="dr_id" value="<%= iseid%>">
								
                                               														
                                                      
                                            
                                             <div style="float:right;"><span  id="add_row" <button  class="btn btn-primary"><i class="glyphicon glyphicon-plus"></i></span></button>
								 <span id="delete_row" <button  class="btn btn-danger"><i class="glyphicon glyphicon-trash"></i></span></div>	   
                                    <label class="col-md-12">Medicine</label>
									
                                    <div class="col-md-10">
                                        <input type="text" name="medicine[]" placeholder="Enter Medicine...." class="form-control form-control-line"> </div>
                                <br></div>
								<div class="form-group">
								<div class="col-md-10">
				       <label class="col-md-15">Dosage</label><br>
						         <select name="dosage1[]" class="btn btn-default dropdown-toggle">
						         <ul class="dropdown-menu">
									<option>1</option>
									<option>0</option>
								</select>&nbsp;
								<select name="dosage2[]" class="btn btn-default dropdown-toggle">
									<option>1</option>
									<option>0</option>
								</select>&nbsp;
								<select name="dosage3[]" class="btn btn-default dropdown-toggle">
									<option>1</option>
									<option>0</option>
								</select>
								</u>   		
								<br>
                               </div></div>
                                <div class="form-group" id="tab_logic"><div class="col-md-12" id='addr1'></div></div>
	                            	<div class="form-group">
                                    <label class="col-md-12">Number Of Days</label>
                                    <div class="col-md-12">
                                        <input type="text" name="days" placeholder="Enter Days...." class="form-control form-control-line"> </div>
                                </div>
						     <div class="form-group" id="tab_logic"><div class="col-md-12" id='addr1'></div></div>
	                            	<div class="form-group">
                                    <label class="col-md-12">Comments</label>
                                    <div class="col-md-12">
                                        <input type="text" name="comments" placeholder="Enter Comments...." class="form-control form-control-line"> </div>
                                </div>
                                <div class="form-group">
                                   <button type="submit" class="btn btn-primary btn-sm">
                                      <i class="fa fa-dot-circle-o"></i> Submit
                                   </button>
                                   <button type="reset" class="btn btn-danger btn-sm">
                                   <i class="fa fa-ban"></i> Reset
                                   </button>
                                    </div>
                                </div>
								
								
								
                            </form>
							
                        </div>
                    </div>
                    <div class="col-sm-6">
                     <%
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
