<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Verify Email</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Dark.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link href='index.css' rel='stylesheet' type='text/css'>
</head>

<body>
    <div class="login-dark">
        <form method="POST" action="codeEnter.jsp"> 
		
            <span> VERIFY EMAIL </span>
			
            
            <div class="form-group"><input class="form-control" type="email" id="email" name="email" required="" placeholder="Email"></div>
            <div class="form-group"><input class="form-control" type="text" id="password" name="userVcode" required="" placeholder="Code"></div>
            <div class="form-group"><button class="btn btn-primary btn-block" type="submit">VERIFY</button></div>
          </form>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
	
	<script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function () {
      'use strict';
      window.addEventListener('load', function () {
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.getElementsByClassName('needs-validation');
        // Loop over them and prevent submission
        var validation = Array.prototype.filter.call(forms, function (form) {
          form.addEventListener('submit', function (event) {
            if (form.checkValidity() === false) {
              event.preventDefault();
              event.stopPropagation();
            }
            form.classList.add('was-validated');
          }, false);
        });
      }, false);
    })();
  </script>
  
</body>

</html>