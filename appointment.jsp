<%@page import="com.hinduja.asterix.*,java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta name="description" content="Responsive Admin Template" />
    <meta name="author" content="RedstarHospital" />
    <title>Clinic Management</title>
    <!-- google font -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&amp;subset=all" rel="stylesheet" type="text/css" />
	<!-- icons -->
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
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> 
	<link href="css/plugins.min.css" rel="stylesheet" type="text/css" />
	    <link href="css/signup/theme_style.css" rel="stylesheet" id="rt_style_components" type="text/css" />
	    <link href="css/signup/bootstrap/css/bootstrap.min.css" rel="stylesheet" id="rt_style_components" type="text/css" />
		
   
    <link href="css/signup/style.css" rel="stylesheet" type="text/css" />
</head>
<!-- END HEAD -->
<body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md page-full-width header-white white-sidebar-color logo-indigo">
    <div class="page-wrapper">
       
      <div class="container-login100-form-btn">     
          <a href="login.jsp"  class="btn btn-success ">Back To Login</a>	  
  
 <div class="page-content-wrapper">
            <div class="page-content">
           <div class="container">
          <div class="row">
           <div class="col-md-12 col-sm-12">
              <div class="card card-box">
                  <div class="card-head">
                    <header>Book Appointment</header>
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
   
                                </div>
                                <div class="card-body" id="bar-parent">
                                    <form action="AddAppointment.jsp" method="POST">
                                        <div class="form-body">
                                        	<div class="form-group row">
                                                <label class="control-label col-md-3">Title
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <select class="form-control input-height" name="title">
                                                        <option value="">Select...</option>
                                                        <option value="miss">Miss</option>
                                                        <option value="mr">Mr.</option>
                                                        <option value="mrs">Mrs.</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="control-label col-md-3">First Name
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <input type="text" name="firstname" data-required="1" placeholder="enter first name" class="form-control input-height" /> </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="control-label col-md-3">Last Name
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <input type="text" name="lastname" data-required="1" placeholder="enter last name" class="form-control input-height" /> </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="control-label col-md-3">Date Of Appointment
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <div class="input-group date form_date " data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                                                <input class="form-control input-height" size="16" name="dateofappointment" placeholder="date of appointment" type="text" value="">
                                                <span class="input-group-addon"><span class="fa fa-calendar"></span></span>
                                            </div>
                                            <input type="hidden" id="dtp_input2" value="" />
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="control-label col-md-3">Address
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <textarea name="address" placeholder="address" class="form-control-textarea" rows="5" ></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="control-label col-md-3">Date Of Birth
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <div class="input-group date form_date " data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                                                <input class="form-control input-height" size="16" name="dateofbirth" placeholder="date of birth" type="text" value="">
                                                <span class="input-group-addon"><span class="fa fa-calendar"></span></span>
                                            </div>
                                            <input type="hidden" id="dtp_input5" value="" />
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="control-label col-md-3">Contact No.
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <input name="contact" type="text" placeholder="mobile number" class="form-control input-height" /> </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="control-label col-md-3">Email
                                                </label>
                                                <div class="col-md-5">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">
                                                                <i class="fa fa-envelope"></i>
                                                            </span>
                                                        <input type="text" class="form-control input-height" name="email" placeholder="Email Address"> </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="control-label col-md-3">Consulting Doctor
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
												<%ArrayList<Doctor> list2=DoctorWorker.getAllDoctor(); %>
												<select class="form-control input-height" name="consultingdoctor">
												<option value="">Select...</option>
                                                        
                                                      <%for(Doctor bt2:list2)
                                                      {
                                                      %>
                                                    <option value="<%= bt2.getId()%>">Dr. <%= bt2.getFirstName()%> <%= bt2.getLastName()%></option>
                                                        
														<%
													  }
														%>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="control-label col-md-3">Injury/Condition
                                                </label>
                                                <div class="col-md-5">
                                                    <input name="injury" type="text" placeholder="Injury/Condition" class="form-control input-height" />
                                                </div>
                                            </div>
                                            
											<div class="form-group row">
												<label class="control-label col-md-3">Note 
												</label>
												<div class="col-md-5">
													<textarea name="note" class="form-control-textarea" placeholder="note" rows="5"></textarea>
												</div>
											</div>
										</div>
                                        <div class="form-actions">
                                            <div class="row">
                                                <div class="offset-md-3 col-md-9">
                                                    <button type="submit" class="btn btn-info">Submit</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>


                                </div>

                            </div>
                        </div>
                    </div>

                </div>
                </div>
				
            </div>
           
            
        </div>
      
        <div class="page-footer">
            <div class="page-footer-inner"> 2017 &copy; Clinic Management
              
            </div>
            <div class="scroll-to-top">
                <i class="icon-arrow-up"></i>
            </div>
        </div>
        <!-- end footer -->
    </div>
    <!-- start js include path -->
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
	<script src="js/bootstrapdatetimepicker/bootstrap-datetimepicker.js"  charset="UTF-8"></script>
    <script src="js/bootstrapdatetimepicker/bootstrap-datetimepicker-init.js"  charset="UTF-8"></script>	
     <!-- end js include path -->
</body>

</html>
