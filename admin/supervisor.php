<?php
session_start();
$page = "users";
include "timeout.php";
include "config.php";
if ($_SESSION['user_type'] != "Supervisor") header("location: index.php");
$user_id=$_SESSION['user_id'];

 ?>
 
 
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SDA Builder <?php echo $_SESSION['full_name']; ?></title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <?php include"menu.php"?>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header">Welcome to <?php echo $_SESSION['full_name']; ?></h3>
                </div>

                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
	  	  				 <?php
    $notification_count=0;
	if($_SESSION['user_type']=="Staff"){ 
    $notification_sql = "select * from assign_project WHERE assign_project_user_id=$user_id";
	
	
	}else 
	{
		$user_id=$_SESSION['user_id'];
		$notification_sql = "select * from assign_project WHERE assign_project_user_id=$user_id";
	
	}
 $notification_result = mysqli_query($conn, $notification_sql);
    while ($notification_row = mysqli_fetch_assoc($notification_result)) {
      
            $notification_count++;
        }
    
	?>
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                  <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><?php echo $notification_count; ?></div>
                                    <div>Project</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                 <a href="project.php" ><span class="pull-left">View Details</span></a>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
               <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
					 <?php
    $notification_count=0;
	$user_id=$_SESSION['user_id'];
    $notification_sql = "select  a.*,b.assign_project_id from supervisor a, assign_project b where a.project_id=b.assign_project_id and b.assign_project_user_id=$user_id and a.status='Supervisor'";
    $notification_result = mysqli_query($conn, $notification_sql);
    while ($notification_row = mysqli_fetch_assoc($notification_result)) {
        {
            $notification_count++;
        }
    }
	?>
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><?php echo $notification_count; ?></div>
                                    <div>Pending</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <a href="supervisor-pending.php" ><span class="pull-left">View Pending</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span></a>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
				
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
					<?php
    $notification_count=0;
	
		$user_id=$_SESSION['user_id'];
		$notification_sql = "select * from staff WHERE status='Supervisor' and user_id=$user_id";
	
    $notification_result = mysqli_query($conn, $notification_sql);
    while ($notification_row = mysqli_fetch_assoc($notification_result)) {
      
            $notification_count++;
        }
    
	?>
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><?php echo $notification_count; ?></div>
                                    <div>Transfering</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                 <a href="supervisor-transfer.php" ><span class="pull-left">View Details</span></a>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
 
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                     <?php
    $notification_count=0;
	if($_SESSION['user_type']=="admin"){ 
    $notification_sql = "select * from project WHERE project_type='Project'";
	
	}
    $notification_result = mysqli_query($conn, $notification_sql);
    while ($notification_row = mysqli_fetch_assoc($notification_result)) {
      
            $notification_count++;
        }
    
	?>
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-support fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><?php echo $notification_count; ?></div>
                                    <div>Projects</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <a href="project.php" ><span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
               				<?php include "chat-map.php"; ?>

                <!-- /.col-lg-4 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
<?php include"footer.php"?>
    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="vendor/raphael/raphael.min.js"></script>
    <script src="vendor/morrisjs/morris.min.js"></script>
    <script src="data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>

</body>

</html>
