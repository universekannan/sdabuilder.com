<?php
session_start();
include "timeout.php";
include "config.php";
if (($_SESSION['user_type'] != "admin") && ($_SESSION['user_type'] != "Staff")) header("location: index.php");
$page = "add_equipment";
$msg = "";
$msg_color = "";

$user_id = $_SESSION['user_id'];
//$project_id = $_GET['id'];
$equipment_name= "";
$stock= "";
$date = date('y/m/d');

if (isset($_POST['submit'])) {
    $equipment_name = $_POST['equipment_name'];
    $stock = $_POST['stock'];
	$date = date('y/m/d');


    $msg_color = "green";
    $msg = "equipment added successfully";
    $stmt = $conn->prepare("INSERT INTO equipment (equipment_name,total,stock,user_id,date) VALUES (?,?,?,?,?)");
    $stmt->bind_param("sssss",$equipment_name,$total=$stock,$stock,$user_id,$date);
    $stmt->execute()or die($stmt->error);
	
	header("location: equipment.php");

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
                            <center><h4><b>Add Equipment</h4></center>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                               
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-12">
                               <form method="post" action="" enctype="multipart/form-data">
                                            <div class="form-group">
                                                <label>Equipment Name</label>
                                                <input value="<?php echo $equipment_name; ?>" class="form-control" name="equipment_name" type="text" id="equipment_name" class="validate[required,length[0,100]] text-input"  required="required" aria-required="true" pattern="[A-Za-z]+\[A-Za-z]+">
                                            </div>
                                            
											
											<div class="form-group">
                                                <label>Stock</label>
                                                <input value="<?php echo $stock; ?>" class="form-control" name="stock" type="text" id="stock" required ="" class="validate[required,length[0,200]] text-input"  required="required" aria-required="true" pattern="[A-Za-z]+\[A-Za-z]+">
                                            </div>
                                            
                                             <div class="col-md-12 text-center">
                                    <input required="required" class="btn btn-info"
                                           type="submit"
                                           name="submit" value="Save"/>
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
