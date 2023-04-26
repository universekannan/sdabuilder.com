<?php
session_start();
error_reporting(0);
include "timeout.php";
include "config.php";
if (($_SESSION['user_type'] != "admin") && ($_SESSION['user_type'] != "Staff") && ($_SESSION['user_type'] != "Supervisor")) header("location: index.php");
$msg = "";
$msg_color = "";
$equ_id = $_GET['id'];
$user_id = $_SESSION['user_id'];
$date = date('y/m/d');
$qty = "";
$project_id = "";
$status = 'Supervisor';
$status1 = 'Approved';
                                            
if (isset($_POST['submit1'])) {

    $date = date('y/m/d');
    $project_id = $_POST['project_id'];
    $qty = $_POST['stock'];

        $stmt = $conn->prepare("INSERT INTO supervisor (project_id,equ_id,qty,status,user_id,date) VALUES (?,?,?,?,?,?)");
        $stmt->bind_param("ssssss", $project_id,$equ_id,$qty,$status,$user_id,$date);
        $stmt->execute() or die($stmt->error);
        $id=$stmt->insert_id;

        $stmt1 = $conn->prepare("INSERT INTO staff(project_id,equ_id,qty,status1,user_id,date) VALUES (?,?,?,?,?,?)");
        $stmt1->bind_param("ssssss", $project_id,$equ_id,$qty,$status1,$user_id,$date);
        $stmt1->execute() or die($stmt1->error);
        $id=$stmt->insert_id;

		$stmt1 = $conn->prepare("UPDATE  equipment SET stock=stock-$qty where id=$equ_id");
    
		$stmt1->execute()or die($stmt1->error);
       header("location: equipment.php");
   
}
$sql = "select * from equipment where id=$equ_id";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);

?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SDA Builder</title>

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

                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row"><br>
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <center><h4><b>Transfer Equipments</h4></center>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                               
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-12">
                               <form method="post" action="" enctype="multipart/form-data">
							   <div class="form-group">
                                            <label for="project_id required"
                                                   class="control-label required">Store</label>
                                            <select name="project_id" class="form-control" required="required" >
                                                 <?php
                                                $sql2 = "select * from project where project_type='Store'";
                                                $result2 = mysqli_query($conn, $sql2);
                                                while ($row2 = mysqli_fetch_assoc($result2)) {
                                                    ?>
                                                    <option value="<?php echo $row2['id']; ?>"
                                                    ><?php echo $row2['project_name']; ?></option>
                                                <?php
                                                }
                                                ?>
                                            </select>
                                        </div>
                                           
									<div class="form-group">
                                                <label for="stock" class="control-label required">Quantity</label>
                                                <input  value="<?php echo $row['stock']; ?>" type="text"
                                                       maxlength="20"
                                                       name="stock" class="form-control"
                                                       placeholder="Quantity">
                                            </div>
                                </div>
                                <div class="col-md-12 text-center">
                                    <input required="required" class="btn btn-info"
                                           type="submit"
                                           name="submit1" value="Transfer"/>
                                    <a href="equipment.php" class="btn btn-info">Back</a>
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
