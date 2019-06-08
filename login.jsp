<!DOCTYPE html>
<html>

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
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="../assets/iconic/css/material-design-iconic-font.min.css">
    <!-- bootstrap -->

    <!-- style -->
    <link rel="stylesheet" href="css/extra_pages.css">
	<!-- favicon -->
    <link rel="shortcut icon" href="img/favicon.ico" /> 
	 <link href="css/signup/theme_style.css" rel="stylesheet" id="rt_style_components" type="text/css" />
	    <link href="css/signup/bootstrap/css/bootstrap.min.css" rel="stylesheet" id="rt_style_components" type="text/css" />
</head>
<body>
    <div class="limiter">
	<div class="container-login100-form-btn">
	<a href="appointment.jsp"  class="btn btn-success ">Book Appointment</a>

					</div>
		<div class="container-login100 page-background">
		
			<div class="wrap-login100">
			
	                <form class="login100-form validate-form" action="LoginAction.jsp" method="POST">
					<span class="login100-form-logo">
						<img alt="" src="img/hospital.png">
					</span>
					
					<span class="login100-form-title p-b-34 p-t-27">
						Log in
					</span>
					<div class="wrap-input100 validate-input" data-validate = "Enter Email">
						<input class="input100" type="text" name="email" placeholder="Email">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="password" placeholder="Password">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>
					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Login
						</button>
					</div>
					<div class="text-center p-t-30">
						<a class="txt1" href="DoctorRegisteration.jsp">
							<strong><h3>Don't have an account?Signup</h3></strong>
						</a>
					</div>
					<div class="text-center p-t-30">
						<a class="txt1" href="forgotpassword.jsp">
							<strong><h3>Forgot Password?</h3></strong>
						</a>
						
				</form>
			</div>
		</div>
	</div>
   
</body>

</html>