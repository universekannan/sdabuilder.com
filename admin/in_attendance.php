<?php
session_start();
$page = "attendance";
include "timeout.php";
include "config.php";
if ($_SESSION['user_type'] != "admin") header("location: index.php");
$date=date("Y-m-d");
$time=date('h:iA');

if (isset($_POST['time_in'])) {
    $date=date("Y-m-d");
    $user_id = $_POST['user_id'];
    $time_in=date('h:iA');
    $stmt = $conn->prepare("INSERT INTO attendance (user_id,date,time_in) VALUES (?,?,?)");
    $stmt->bind_param("sss",$user_id,$date,$time);
    $stmt->execute();
}

?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SDA Builder In Attendance</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

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
			<br />
<div class="col-md-12" style="padding-bottom: 5px" >
                    <a href="out_attendance.php" class="btn btn-info fa fa-plus pull-right">&nbsp;
                        <?php if($_SESSION['user_type']=="admin"){ ?>
                            Attendance Time Out
                        <?php } ?>
                    </a>
                    <br>
                </div>
            </div>
            <!-- /.row -->
            <div class="row"><br>
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <center><h4><b>Attendance</h4></center>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                               
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-12">
                                   <form method="post">
				            <div class="form-group">
                                    <label for="user_id required"
                                           class="control-label">User</label>
                                    <select name="user_id" required="required" class="form-control" >
                                        <option value="">Select</option>
										
                                        <?php
										if($_SESSION['user_type']=="admin"){
                                        $sql = "select * from users order by full_name";
										
                                         }else if($_SESSION['user_type']=="mm"){
                                        $sql = "select * from users where user_type='pm' order by full_name";
										}
                                        $result = mysqli_query($conn, $sql);
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            ?>
											
                                            <option value="<?php echo $row['id']; ?>"
                                            ><?php echo $row['full_name']; ?></option>
                                            <?php
                                        }
                                        ?>
                                    </select>
                                </div>
                                        <div class="form-group text-center">
                                            <input class='btn btn-danger' type='submit' name='time_in' value='Attendance Time In'/>
                                        </div>	

										

            </form>

                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>

</body>

</html>
