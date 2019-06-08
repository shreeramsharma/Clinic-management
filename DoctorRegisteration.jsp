<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta name="description" content="Responsive Admin Template" />
    <meta name="author" content="SmartUniversity" />
    <title>Clinic Management</title>
    <!-- google font -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&amp;subset=all" rel="stylesheet" type="text/css" />
	<!-- icons -->
    <link href="css/signup/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	
	<link rel="stylesheet" href="css/signup/iconic/css/material-design-iconic-font.min.css">
    <!-- bootstrap -->
	<link href="css/signup/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- style -->
    <link rel="stylesheet" href="css/extra_pages.css">
	<!-- favicon -->
    <link rel="shortcut icon" href="img/favicon.ico" /> 
	<link href="css/signup/theme_style.css" rel="stylesheet" id="rt_style_components" type="text/css" />
	    <link href="css/signup/bootstrap/css/bootstrap.min.css" rel="stylesheet" id="rt_style_components" type="text/css" />
</head>
<body>
    <div class="limiter">
		<div class="container-login100 page-background">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="AddDoctorAction.jsp" method="POST">
					<span class="login100-form-logo">
						<img alt="" src="img/hospital.png">
					</span>
					<span class="login100-form-title p-b-34 p-t-27">
						Registration
					</span>
					<div class="row">
					<div class="col-lg-6 p-t-20">
					<div class="wrap-input100 validate-input" data-validate = "Enter FirstName">
						<input class="input100" type="text" name="firstname" placeholder="First Name" required="">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>
					</div>
					<div class="col-lg-6 p-t-20">
					<div class="wrap-input100 validate-input" data-validate = "Enter LastName">
						<input class="input100" type="text" name="lastname" placeholder="LastName" required="">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>
					</div>
					<div class="col-lg-6 p-t-20">
					<div class="wrap-input100 validate-input" data-validate="Enter Contact">
						<input class="input100" type="text" name="contact" placeholder="Contact" required="">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>
					</div>
					<div class="col-lg-6 p-t-20">
					<div class="wrap-input100 validate-input" data-validate="Enter Clinic Address" required="">
						<input class="input100" type="text" name="clinicaddress" placeholder="Clinic Address">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>
					</div>
					<div class="col-lg-6 p-t-20">
					<div class="wrap-input100 validate-input" data-validate="Enter Email">
						<input class="input100" type="email" name="email" placeholder="Email" required="">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>
					</div>
					<div class="col-lg-6 p-t-20">
					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="password" placeholder="Password" required="">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>
					</div>
					</div>
					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Register
						</button>
					</div>
					<div class="text-center p-t-30">
						<a class="txt1" href="login.jsp">
							<strong><h3>SignIn</h3></strong>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
    <!-- start js include path -->
    <script src="../assets/jquery.min.js" ></script>
    <!-- bootstrap -->
    <script src="../assets/bootstrap/js/bootstrap.min.js" ></script>
    <script src="../assets/login.js"></script>
    <!-- end js include path -->
</body>
</html>