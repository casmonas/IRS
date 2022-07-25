<?php
    ob_start();

    session_start();

    $valid_session = isset($_SESSION['username']) ? $_SESSION['username'] === session_id() : FALSE;
    if (!$valid_session || $_SESSION['utype'] != "requester") {
        
        
?>
        <div class="errorPage">
            <h1 style="position:relative;top: 0%;color: rgb(255, 0, 76); font-family: 'Bebas Neue',sans-serif;font-size: 3em;text-align:center;">You aren't Logged in!<h2>
            <img align="center" src="./assets/img/Other/failed.png" alt="">
            <p style="position:relative;top: 0%;font-family: 'Bebas Neue',sans-serif;font-size: 2em;text-align:center;">Please <a style="color: rgb(255, 0, 76); font-family: 'Bebas Neue',sans-serif;font-size: 1em;text-align:center;" href="../index.php"> Log In</a> </p>
            
        </div>
        

        <style>
            body{
                background-color: white;
            }
            .errorPage{
                position: absolute;
                top: 25%;
                left: 20%;
                width: 60%;
                height: 400px;
                border: 2px solid red;
                border-radius: 10px;
                -webkit-border-radius: 10px;
                -moz-border-radius: 10px;
                -ms-border-radius: 10px;
                -o-border-radius: 10px;
                text-align: center;
            }
            .errorPage img{
                position: relative;
                margin-left: auto;
                margin-right: auto;
                width: 150px;
                height: 150px;
            }
        </style>
        
<?php

        exit();
    }

    else{       

        if (( time() - $_SESSION['last_login_timestamp'])> 300)
        {
            header('Location: ../logout.php');   
        }

        else
        {
            $uid = $_SESSION['userid'];
            $ut = $_SESSION['utype'];
            $_SESSION['last_login_timestamp']= time();
        
            require("../db/config.php");
?>










<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>IRS | </title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bbootstrap 4 -->
  <link rel="stylesheet" href="../plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="../plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="../plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="../plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="../plugins/summernote/summernote-bs4.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
 <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
      </li>
    </ul>


    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
      
      <!-- Notifications Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="fa fa-power-off"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <span class="dropdown-item dropdown-header"></span>
          <div class="dropdown-divider"></div>
          <a href="../logout.php" class="dropdown-item">
            <button class="btn btn-danger btn-sm btn-lg" style="width:100%"><i class="fa fa-power-off"></i> Logout</button>
          </a>
       
          <div class="dropdown-divider"></div>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#">
          <i class="fas fa-th-large"></i>
        </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="../index.php" class="brand-link">
      <span class="brand-text font-weight-light"><h2 align="center"><strong>IRS</strong></h2></span>

    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="../dist/img/admin.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Chika Simon</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item has-treeview menu-open">
            <a href="dashboard.php" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="department.php" class="nav-link">
              <i class="nav-icon fas fa-building"></i><p>Department
                  </p></a>
          </li>

          <li class="nav-item has-treeview">
            <a href="proplan.php" class="nav-link active">
              <i class="nav-icon fas fa-clone"></i>
              <p>
                Request
                <i class="right fas fa-angle-left"></i>
              </p></a>
    
              <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="dashboard.php" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Make Request</p>
                </a>
              </li>
               <li class="nav-item">
                <a href="totalrequests.php" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Request Detail</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="requeststatus.php" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Request Status</p>
                </a>
              </li>
            </ul>
          </li>


          <li class="nav-item has-treeview">
            <a href="productsandmaterials.php" class="nav-link">
              <i class="nav-icon fas fa-palette"></i>
              <p>
                Products & Materials
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
               <li class="nav-item">
               <a href="productsandmaterials.php" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Management</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="itemcategory.php" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Category</p>
                </a>
              </li>
            </ul>
          </li>

            

          
     
          <li class="nav-item has-treeview">
            <a href="voucher.php" class="nav-link">
              <i class="nav-icon fas fa-sticky-note"></i>
              <p>
                Voucher
              </p>
            </a>
          </li>

          
          <li class="nav-item has-treeview">
          <a href="../logout.php" class="nav-link">
              <i class="nav-icon fas fa-sticky-note"></i>
              <p>
                Log Out
              </p>
            </a>
          </li>
                  </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Material Request Form</h1>
            <div class="userName"><p>Welcome, <span><?=$uid?></span></p></div>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
       
     <!-- Form starts here -->
              <form role="form"   method="post">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>

            <div class="modal-body">
              <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title" align="center">Make a Material Request</h3>
              </div>
                <div class="card-body">
                    <div class="row">
                  <div class="col-sm-4">
                      <!-- text input -->
                      <div class="form-group">
                        <label>Material Request ID</label>
                        <input type="text" class="form-control" name="materialrequestID"  placeholder="Enter Tracking ID ...">
                      </div>
                    </div>
                  <div class="col-sm-4">
                      <!-- text input current_timestamp()  CURRENT_TIMESTAMP   SELECT * FROM `irs`.`categorytable` WHERE `categoryID` = 'CAT101'-->
                      <div class="form-group">
                        <label>Material Name</label>
                        <input type="text" class="form-control" name="materialName"  placeholder="Enter Name of Material...">
                        
                        </select>
                      </div>
                    </div>
                    <div class="col-sm-4">
                      <!-- text input -->
                      <div class="form-group">
                        <label>Request Time</label>
                        <input type="time" class="form-control" name="requestTime" placeholder="00.00">
                      </div>
                    </div>
                  </div>
                    <div class="row">
                    <div class="col-sm-4">
                      <!-- text input -->
                      <div class="form-group">
                        <label>Requested By</label>
                        <input type="text" class="form-control" name="userID" placeholder="Enter Your ID">
                      </div>
                    </div>
                  <div class="col-sm-4">
                      <!-- text input -->
                      <div class="form-group">
                        <label>Request Date</label>
                        <input type="date" class="form-control" name="requestDate" placeholder="00.00">
                      </div>
                    </div>
                    <div class="col-sm-4">
                      <!-- text input -->
                      <div class="form-group">
                        <label>Executing Authority</label>
                        <select class="form-control" name="authority" id="authority">
                        <option value="">Select Authority</option>
                          <option value="Performing Authority 1">Performing Authority 1</option>
                          <option value="Performing Authority 2">Performing Authority 2</option>
                        </select>
                      </div>
                    </div>
                    </div>
                    <div class="col-sm-12">
                      <!-- text input -->
                      <div class="form-group">
                        <label>Requesting Department</label>
                        <input type="text" class="form-control" name="department" placeholder="Enter ...">
                      </div>
                    </div>
                  
                </div>
            </div>
            </div>          
             <?php

            require("../db/config.php");
              if( isset($_POST['btnSave'])){
              
                // Create connection $conn = new mysqli($servername, $username, $password, $dbname); // Check connection if ($conn->connect_error) {   die("Connection failed: " . $conn->connect_error); }  
                                 
                //CURRENT_TIMESTAMP
                            

                                if (!empty($_POST["materialrequestID"]) && !empty($_POST["materialName"])  
                                && !empty($_POST["authority"])  && !empty($_POST["department"]) && !empty($_POST["userID"]))
                                {                                       

                                    $materialrequestID = $_POST['materialrequestID'];
                                    $materialName = $_POST['materialName'];
                                    $authority = $_POST['authority'];
                                    $department = $_POST['department'];
                                    // $requestStatus = $_POST['requestStatus'];
                                    $userID = $_POST['userID'];

                                    $iSql = " INSERT INTO `materialRequestTable` (`materialrequestID`, `materialName`,`authority`, `department`,`userID`)  VALUES ('$materialrequestID', '$materialName','$authority', '$department','$userID') ";
 
                                    
                                    echo $iSql;

                                    $iResult = mysqli_query($conn, $iSql); 

                                    if (!$iResult) {
                                    printf("Errormessage: %s\n", mysqli_error($conn));
                                    }
                                    
                                
                                    $conn->close();
                                    echo "<h1 style='color:green;'>Added</h1>";
                                    // header("Refresh:0; url=addItems.php");
                                }
                                else{
                                    echo "<center><h5 style='color:RED;'>You have empty fields, please check!</h5></center>";
                                }
                                
              }
              
              
                
                ?>

            <div class="modal-footer justify-content-between">
              <!-- <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button> -->
              <button type="submit" class="btn btn-primary" name="btnSave">Send</button>
            </div>
          </div>
              </form>
      
   
        
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <strong>Footer<a href="http://adminlte.io"></a>.</strong>
    
    <div class="float-right d-none d-sm-inline-block">
      
    </div>
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<!-- jQuery -->
<script src="../plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="../plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="../plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="../plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="../plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="../plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="../plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="../plugins/moment/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="../plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="../plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="../plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="../dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../dist/js/demo.js"></script>
</body>
</html>


<?php

    }
}

?>
