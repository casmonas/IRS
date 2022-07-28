<?php
    ob_start();

    session_start();

    $valid_session = isset($_SESSION['username']) ? $_SESSION['username'] === session_id() : FALSE;
    if (!$valid_session || $_SESSION['utype'] != "admin") {
        
        
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

        if (( time() - $_SESSION['last_login_timestamp'])> 5000)
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
  <link rel="stylesheet" href="../plugins/datatables-bs4/css/dataTables.bootstrap4.css">
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
          <a class="dropdown-item">
          <!-- onclick="window.location.href='./logout.php'" makes it look for logout.php in the same folder -->
            <button class="btn btn-danger btn-sm btn-lg" onclick="window.location.href='../logout.php'" style="width:100%"><i class="fa fa-power-off"></i> Logout</button>
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
          <li class="nav-item ">
            <a href="admindashboard.php" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
              </p>
            </a>
          </li>
          <li class="nav-item has-treeview ">
            <a href="department.php" class="nav-link">
              <i class="nav-icon fas fa-building"></i><p>Department
                  </p></a>
          </li>
          <li class="nav-item has-treeview">
            <a href="proplan.php" class="nav-link">
              <i class="nav-icon fas fa-clone"></i>
              <p>
                Request
                <i class="right fas fa-angle-left"></i>
              </p></a>
    
              <ul class="nav nav-treeview">
               <li class="nav-item">
                <a href="requestdetail.php" class="nav-link">
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
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-palette"></i>
              <p>
                Products & Materials
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
               <li class="nav-item">
                <a href="manageproducts.php" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Products Management</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="managematerials.php" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Materials Management</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="productcategory.php" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Category Details</p>
                </a>
              </li>
            </ul>
          </li>

     
          <li class="nav-item has-treeview">
            <a href="usermanagement.php" class="nav-link active">
              <i class="nav-icon fas fa-users"></i>
              <p>
                User Management
              </p>
            </a>
          </li>

          <!-- <li class="nav-item has-treeview">
            <a href="../public/voucher.php" class="nav-link">
              <i class="nav-icon fas fa-sticky-note"></i>
              <p>
                Voucher
              </p>
            </a>
          </li> -->
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
            <h1 class="m-0 text-dark">User Management</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
              <li class="breadcrumb-item active">User Management</li>

            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    

   <section class="content">
   <div class="container-fluid">
			<!-- Small boxes (Stat box) -->
			<div class="row">
			<div class="col-12">
			<div class="card">

      <div class="card-header">
        <!-- //the green add button is here -->
        <h3 class="card-title">Users Table</h3> 
      <!--   <button class="btn btn-success btn-sm" style="margin-left:1%" 
        data-toggle="modal" data-target="#add"><i class="fa fa-plus"> Add</i></button> -->
      </div>
     
				<!-- /.card-header -->

			   
	

      <div class="card-body">
                                <form role="form" action="usermanagement.php" name="add" id="add" method="post">
                                <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">Add User</h3>
                                </div>

                                <div class="card-body">
                                <div class="row">
									  <div class="col-sm-6">
									<div class="form-group">
										<label for="exampleInputEmail1">Username</label>
										<input type="text" class="form-control"  name="username" id="exampleInputEmail1" placeholder="Enter ...">
									  </div>
									</div>
									  <div class="col-sm-6">
									  <div class="form-group">
										<label for="exampleInputEmail1">Password</label>
										<input type="text" class="form-control"  name="password" id="exampleInputEmail1" placeholder="Enter ...">
									  </div>
									  </div>
									</div>

                  <div class="row">
									  <div class="col-sm-6">
									<div class="form-group">
										<label for="exampleInputEmail1">Serial Number</label>
										<input type="number" class="form-control"  name="serialnumber" id="exampleInputEmail1" placeholder="Enter ...">
									  </div>
									</div>
									  <div class="col-sm-6">
									  <div class="form-group">
										<label for="exampleInputEmail1">Full Name</label>
										<input type="text"  name="fullname" class="form-control" id="exampleInputEmail1" placeholder="Enter ...">
									  </div>
									  </div>
									</div>



									<div class="row">
									  <div class="col-sm-6">
									<div class="form-group">
										<label for="exampleInputEmail1">Phone Number</label>
										<input type="number" class="form-control"  name="phonenumber" id="exampleInputEmail1" placeholder="Enter ...">
									  </div>
									</div>
									  <div class="col-sm-6">
									  <div class="form-group">
										<label for="exampleInputEmail1">Email</label>
										<input type="email" class="form-control"  name="email" id="exampleInputEmail1" placeholder="Enter ...">
									  </div>
									  </div>
									</div>

                  <div class="row">
                  <div class="col-sm-6">
									  <div class="form-group">
										<label for="exampleInputEmail1">Department</label>
															<!-- <input type="number"  name="department" class="form-control" id="exampleInputEmail1" placeholder="Enter ..."> -->
                        <select class="form-control"  name="department">
											  <option value="">Select Option</option>
											  <option value=1>Management</option>
											  <option value=2>Admin</option>
											  <option value=3>Tech</option>
											</select>
									  </div>
									</div>

                  <div  class="col-sm-6"> 
                    <div class="form-group">
                    <label for="exampleInputEmail1">Role</label>
                    <select class="form-control"  name="role">
											  <option value="">Select Option</option>
											  <option value="Performing Authority 1">Performing Authority 1</option>
											  <option value="Performing Authority 2">Performing Authority 2</option>
											  <option value="Verifying Authority">Verifying Authority</option>
											  <option value="Authorizing Authority 1">Authorizing Authority 1</option>
											  <option value="Authorizing Authority 2">Authorizing Authority 2</option>
											</select>
                    </div>
                  </div>

                  </div>


                  <?php
                                  require('../db/config.php');
                                if (isset($_POST['btnAdd']))
                                {
                                    if ( $_POST["role"] !="Select Option" && !empty($_POST["username"]) 
                                    && !empty($_POST["password"]) && !empty($_POST["serialnumber"]) 
                                    && !empty($_POST["fullname"])&& !empty($_POST["phonenumber"]) 
                                    && !empty($_POST["email"])&& $_POST["department"] !="Select Option")
                                    {                                       
                                        $role = $_POST["role"];
                                        $username = $_POST["username"];
                                        $password = $_POST["password"];
                                        $serialnumber = $_POST["serialnumber"];
                                        $fullname = $_POST["fullname"];
                                        $phonenumber = $_POST["phonenumber"];
                                        $email = $_POST["email"];
                                        $department = $_POST["department"];

                                        $dSql = " INSERT INTO `userTable`(`userserialnumber`, `username`, `password`,`fullname`, `phonenumber`, `email`,`userrole`, `departmentid`) 
                                        VALUES ('$serialnumber', '$username', '$password','$fullname', '$phonenumber', '$email', '$role', '$department') ";
                                        
                                        echo $dSql;

                                        $dResult = mysqli_query($conn, $dSql); 

                                        if (!$dResult) {
                                        printf("Errormessage: %s\n", mysqli_error($conn));
                                        }
                                        
                                    
                                        $conn->close();
                                        echo "<h1 style='color:green;'>Added</h1>";
                                        header("Refresh:0; url=usermanagement.php");
                                    }
                                    else{
                                        echo "<h5 style='color:RED;'>Can't be Empty!</h5>";
                                    }
                                }
                            ?>



          <div class="modal-footer justify-content-between">
                      <!-- <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button> -->
                      <button type="submit" class="btn btn-primary" name="btnAdd">Save</button>
                    </div>

                                </div>
                                <!-- card body -->

                              </div>
                                </form>

      </div>

      </div>
      </div>
      </div>
    </div>
   </section>

 
   
                              <!-- Main content -->
    <section class="content">
		<div class="container-fluid">
			<!-- Small boxes (Stat box) -->
			<div class="row">
			<div class="col-12">
			  <div class="card">
				<div class="card-header">
				  <!-- //the green add button is here -->
				  <h3 class="card-title">Users Table</h3> 
				<!--   <button class="btn btn-success btn-sm" style="margin-left:1%" 
				  data-toggle="modal" data-target="#add"><i class="fa fa-plus"> Add</i></button> -->
			
				</div>
				<!-- /.card-header -->

			   
	


				<div class="card-body">




			  <?php
							   require('../db/config.php');
								function getTableDataFromDB($s)
								{
								  require('../db/config.php');
									$res1 = mysqli_query($conn, $s)or die(mysqli_error());
									$ar=array();
									while($r = mysqli_fetch_assoc($res1)) {
										$ar[]=$r;
									}
									return json_encode($ar);
								}

								// $s1=" SELECT t2.req_order_id,  t1.* FROM req_offer AS t1 INNER JOIN req_offer_items AS t2 WHERE t1.r_id = t2.req_order_id ";
								$s1=" SELECT * FROM usertable";
								// echo $s1;
								$jn1=getTableDataFromDB($s1);
								//echo $jsn;
								$jr1=json_decode($jn1);

						  
								echo '<table id="example1" class="table table-bordered table-striped">';
								echo "   <thead>
								<tr>
								<th>Serial Number</th>
								<th>Username</th>
								<th>Password</th>
								<th>Full Name</th>
								<th>Role</th>
								<th>Email Address</th>
							  
							
								  <th></th>
								</tr>
								</thead>";
								foreach($jr1 as $table)
								{
									echo '   <tbody><tr>';
								 /*    if( $table->r_status == '0')
									{
										$status = 'Pending';
									}
									else{
										$status = 'Cleared';
									} */
									echo 
									'<td>'.$table->prefix.$table->userID.$table->userSerialNumber.'</td><td>'.$table->username.'</td>'.'<td>'.$table->password.'</td>'.'</td>
									<td>'.$table->fullname.'</td><td>'.$table->userRole.'</td>'.'</td><td>'.$table->email.'</td><td>'.'<button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#edit"><i class="fa fa-edit"></i></button> <button class="btn btn-danger btn-sm"><i class="fa fa-times"></i></button>'.'</td>';
									echo '</tr>';
								}
								echo ' </tbody>
								<tfoot>
								<tr>
								<th>Serial Number</th>
								<th>Username</th>
								<th>Password</th>
								<th>Full Name</th>
								<th>Role</th>
								<th>Email Address</th>
							  
								  <th></th>
								</tr>
								</tfoot>
							  </table>';                    
				?>




		
				</div>
				<!-- /.card-body -->
			  </div>
			  <!-- /.card -->
			</div>
		  </div>
			<!-- /.row -->
			<!-- Main row -->
        
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
<script src="../jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="../plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="../plugins/moment/moment.min.js"></script>
<script src="../plugins/daterangepicker/daterangepicker.js"></script>
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
<script src="../plugins/datatables/jquery.dataTables.js"></script>
<script src="../plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>

<script>
  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
    });
  });
</script>
</body>
</html>

<?php

    }
}

?>