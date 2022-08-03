
<?php

//include 'db/config.php';


// if user click Login button
if(isset($_POST['btnLogin'])) {
  require('db/config.php');
  // get username and password
  $username = $_POST['username'];
  $password = $_POST['password'];

  // set time for session timeout
  // $currentTime = time() + 25200;
  // $expired = 3600;

  // create array variable to handle error
  $error = array();

  // check whether $username is empty or not
  if(empty($username)) {
      $error['username'] = "*Username should be filled.";
  }

  // check whether $password is empty or not
  if(empty($password)) {
      $error['password'] = "*Password should be filled.";
  }

  // if username and password is not empty, check in database
  if(!empty($username) && !empty($password)) {

      // change username to lowercase
      // $username = strtolower($username);

      //encript password to sha256
      // $password = hash('sha256',$username.$password);

      // get data from user table
      $sql_query = "SELECT username,password,userRole FROM userTable  WHERE username = ? AND password = ?";

      $stmt = $conn->stmt_init();
      if($stmt->prepare($sql_query)) {
          // Bind your variables to replace the ?s
          $stmt->bind_param('ss', $username, $password);
          // Execute query
          $stmt->execute();
          /* store result */
          $stmt->store_result();
          $row = $stmt->num_rows;
          // Close statement object
          $stmt->close();
          if( $row[0] === $u && $row[1] === $p && $row[2] === "VERIFYING AUTHORITY" )
          {
              session_start();
              $_SESSION['userid'] = $u;
              $_SESSION['utype'] = "VERIFYING AUTHORITY";/* this is the key */
              
               //trying to know if this will work with the ut
             // $_SESSION['utype'] = $table->userRole;
              $_SESSION['username'] = session_id();
              $_SESSION['last_login_timestamp'] = time();
              header("Location: public/dashboard.php");                
          }
          else if ( $row[0] === $u && $row[1] === $p && $row[2] === "PERFORMING AUTHORITY 1"){
              session_start();
              $_SESSION['userid'] = $u;            
              $_SESSION['utype'] = "PERFORMING AUTHORITY 1";
              $_SESSION['username'] = session_id();
              $_SESSION['last_login_timestamp'] = time();
              header("Location: performone/dashboard.php");   
          }
          else if ( $row[0] === $u && $row[1] === $p && $row[2] === "AUTHORIZING AUTHORITY 1"){
              session_start();
              $_SESSION['userid'] = $u;            
              $_SESSION['utype'] = "AUTHORIZING AUTHORITY 1";
              $_SESSION['username'] = session_id();
              $_SESSION['last_login_timestamp'] = time();
              header("Location: public/dashboard.php");   
          }
          else if ( $row[0] === $u && $row[1] === $p && $row[2] === "admin"){
              session_start();
              $_SESSION['userid'] = $u;
              $_SESSION['utype'] = "admin";
              $_SESSION['username'] = session_id();
              $_SESSION['last_login_timestamp'] = time();
              header("Location: admin/admindashboard.php");   
          } else {
              $error['failed'] = "Invalid Username or Password!";
          }
      }

  }
}




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

            if(!empty($u) && !empty($p)) {  

            $sql = "SELECT username,password,userRole FROM userTable WHERE username='$u' AND password='$p'";

              $result = mysqli_query($conn, $sql);     
              $row = mysqli_fetch_row($result);



              if( $row[0] === $u && $row[1] === $p && $row[2] === "VERIFYING AUTHORITY" )
              {
                  session_start();
                  $_SESSION['userid'] = $u;
                  $_SESSION['utype'] = "VERIFYING AUTHORITY";/* this is the key */
                  
                  //trying to know if this will work with the ut
                // $_SESSION['utype'] = $table->userRole;
                  $_SESSION['username'] = session_id();
                  $_SESSION['last_login_timestamp'] = time();
                  header("Location: public/dashboard.php");                
              }
              else if ( $row[0] === $u && $row[1] === $p && $row[2] === "PERFORMING AUTHORITY 1"){
                  session_start();
                  $_SESSION['userid'] = $u;            
                  $_SESSION['utype'] = "PERFORMING AUTHORITY 1";
                  $_SESSION['username'] = session_id();
                  $_SESSION['last_login_timestamp'] = time();
                  header("Location: performone/dashboard.php");   
              }
              else if ( $row[0] === $u && $row[1] === $p && $row[2] === "AUTHORIZING AUTHORITY 1"){
                  session_start();
                  $_SESSION['userid'] = $u;            
                  $_SESSION['utype'] = "AUTHORIZING AUTHORITY 1";
                  $_SESSION['username'] = session_id();
                  $_SESSION['last_login_timestamp'] = time();
                  header("Location: public/dashboard.php");   
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
                $error ['failed']= "Incorrect Username or Password";
                  //header("Location: login-form.php?msg=$error");
              }
            }


 
}






?>


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
<script>
    start_loader()
  </script>
<div class="login-box">
  <div class="login-logo">
    <a href="index.php"><b>Internal Request</b>System</a>
  </div>
  <!-- /.login-logo -->
  <form method="POST" id="login-frm">
  <!-- <form action="dashboard.php" method="post"> -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">Sign in to start your session</p>
      <div class="custom-padding2 col-pink btn-danger"><?php echo isset($error['failed']) ? $error['failed'] : '';?></div>

        <div class="input-group mb-3">
          <input type="text" class="form-control" name="username" placeholder="Username" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" placeholder="Password" name="password" required>
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

<script src="dist/js/script.js"></script>


<script>
  $(document).ready(function(){
    end_loader();
  })
</script>

</body>
</html>

