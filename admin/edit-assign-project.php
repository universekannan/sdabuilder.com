<?php
session_start();
include "timeout.php";
include "config.php";
if ($_SESSION['user_type'] != "admin") header("location: index.php");
$msg = "";
$msg_color = "";
$id = $_GET['id'];
$assign_project_id = "";
$assign_project_user_id = "";
$assign_project_description = "";

if (isset($_POST['submit1'])) {

    $assign_project_id = trim($_POST['assign_project_id']);
    $assign_project_user_id = trim($_POST['assign_project_user_id']);
    $assign_project_description = $_POST['assign_project_description'];
    
    $stmt = $conn->prepare("UPDATE  assign_project SET assign_project_id=?,assign_project_user_id=?,assign_project_description=? where id=?");
    $stmt->bind_param("sssi", $assign_project_id, $assign_project_user_id, $assign_project_description,$id);
    $stmt->execute();

    header("location: assign_project.php");

}
$sql = "select * from assign_project where id=$id";
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
                            <center><h4><b>Edit Assign Project</h4></center>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                               
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-12">
                               <form method="post" action="" enctype="multipart/form-data">
                                       <div class="form-group">
                                            <label for="assign_project_id required"
                                                   class="control-label required">Project name</label>
                                            <select name="assign_project_id" class="form-control" required="required" >
                                                 <?php
                                                $sql2 = "select * from project where project_type='Project'";
                                                $result2 = mysqli_query($conn, $sql2);
                                                while ($row2 = mysqli_fetch_assoc($result2)) {
                                                    ?>
                                                    <option value="<?php echo $row2['id']; ?>"
                                                    <?php if($row['assign_project_id']==$row2['id']) echo " selected "; ?>
                                                    ><?php echo $row2['project_name']; ?></option>
                                                <?php
                                                }
                                                ?>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="assign_project_user_id required"
                                                   class="control-label required">Supervisor Name</label>
                                            <select name="assign_project_user_id" class="form-control" required="required" >
                                                 <?php
                                                $sql2 = "select * from users where project_type='Supervisor'";
                                                $result2 = mysqli_query($conn, $sql2);
                                                while ($row2 = mysqli_fetch_assoc($result2)) {
                                                    ?>
                                                    <option value="<?php echo $row2['id']; ?>"
                                                    <?php if($row['assign_project_user_id']==$row2['id']) echo " selected "; ?>
                                                    ><?php echo $row2['full_name']; ?></option>
                                                <?php
                                                }
                                                ?>
                                            </select>
                                        </div>
											<div class="form-group">
                                                <label>Description</label>
                                            <input value="<?php echo $row['assign_project_description']; ?>" type="text" maxlength="50"
                                                   name="assign_project_description" id="assign_project_description" class="form-control"
                                                   placeholder="Description">
                                        </div>
											
                                </div>
                                <div class="col-md-12 text-center">
                                    <input required="required" class="btn btn-info"
                                           type="submit"
                                           name="submit1" value="Save"/>
                                    <a href="project.php" class="btn btn-info">Back</a>
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
