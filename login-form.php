


<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>IR System | Log in</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="../../index2.html"><b>Internal Request</b>System</a>
  </div>
  <!-- /.login-logo -->
  <form method="POST">
  <!-- <form action="dashboard.php" method="post"> -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">Sign in to start your session</p>
      <div class="custom-padding2 col-pink btn-danger"><?php echo isset($error['failed']) ? $error['failed'] : '';?></div>

        <div class="input-group mb-3">
          <input type="text" class="form-control" name="username" placeholder="Username">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" placeholder="Password" name="password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          
          <!-- /.col -->
        </div>

      <div class="social-auth-links text-center mb-3">
        <p>- -</p>
        <button class="btn btn-block btn-primary" type="submit" name="btnLogin">
          <i class="fa fa-unlock"></i> Sign in
        </button>
      
      </div>

    </div>
          </form>

    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>

</body>
</html>


<?php

    //include 'db/config.php';


    // start session
    //session_start();

    if( isset($_POST['btnLogin'])){
      require('db/config.php');

      $u = $_POST['username'];
      $p = $_POST['password'];

      if(empty($u)) {
        $error['username'] = "*Username should be filled.";
    }

    // check whether $password is empty or not
    if(empty($p)) {
        $error['password'] = "*Password should be filled.";
    }


      $sql = "SELECT username,password,userRole FROM userTable WHERE username='$u' AND password='$p'";
    
      $result = mysqli_query($conn, $sql);     
      $row = mysqli_fetch_row($result);
    

      if( $row[0] === $u && $row[1] === $p && $row[2] === "VERIFYING AUTHORITY" )
      {
          session_start();
          $_SESSION['userid'] = $u;
          $_SESSION['utype'] = "VERIFYING AUTHORITY";/* this is the key */
          $_SESSION['username'] = session_id();
          $_SESSION['last_login_timestamp'] = time();
          header("Location: public/dashboard.php");                
      }
      else if ( $row[0] === $u && $row[1] === $p && $row[2] === "moderator"){
          session_start();
          $_SESSION['userid'] = $u;            
          $_SESSION['utype'] = "moderator";
          $_SESSION['username'] = session_id();
          $_SESSION['last_login_timestamp'] = time();
          header("Location: moderator.php");   
      }
      else if ( $row[0] === $u && $row[1] === $p && $row[2] === "accounts"){
          session_start();
          $_SESSION['userid'] = $u;            
          $_SESSION['utype'] = "accounts";
          $_SESSION['username'] = session_id();
          $_SESSION['last_login_timestamp'] = time();
          header("Location: accounts.php");   
      }
      else if ( $row[0] === $u && $row[1] === $p && $row[2] === "admin"){
          session_start();
          $_SESSION['userid'] = $u;
          $_SESSION['utype'] = "admin";
          $_SESSION['username'] = session_id();
          $_SESSION['last_login_timestamp'] = time();
          header("Location: admin/admindashboard.php");   
      }
      else
      {
          $msg = "Incorrect Username or Password";
          header("Location: login-form.php?msg=$msg");
      }
    }else{

    }

    if ($_POST)
    {
       
    
    }


    
?>