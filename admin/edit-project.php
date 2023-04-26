<?php

session_start();

include "timeout.php";

include "config.php";

if (($_SESSION['user_type'] != "admin") && ($_SESSION['user_type'] != "Staff"))header("location: index.php");

$id = $_GET['id'];

$msg = "";

$msg_color = "";

$project_name = "";

$project_owner = "";

$project_mobile = "";

$project_email = "";

$project_address = "";



if (isset($_POST['update'])) {

	

    $project_name = trim($_POST['project_name']);

    $project_owner = trim($_POST['project_owner']);

    $project_mobile = $_POST['project_mobile'];

    $project_email = trim($_POST['project_email']);

    $project_address = trim($_POST['project_address']);
    

	

	    $stmt = $conn->prepare("Update project set project_name=?,project_owner=?,project_mobile=?,project_email=?,project_address=? where id=?");

       $stmt->bind_param("ssssss", $project_name,$project_owner,$project_mobile,$project_email,$project_address,$id);

        $stmt->execute() or die($stmt->error);

$file_name = $_FILES['photo']['name'];
        if (trim($file_name) != "") {
        $ext = pathinfo($file_name, PATHINFO_EXTENSION);
        $file_name = $id . "." . $ext;
        $query = "update project set photo = '" . $file_name . "' where id=$id";
        mysqli_query($conn, $query);
        $target_path = "photo/project/";
        $target_path = $target_path . $file_name;
        move_uploaded_file($_FILES['photo']['tmp_name'], $target_path);

		}
        header("location: project.php");

    }





$sql = "select * from project where id=$id";

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

                            <center><h4><b>Edit Project</h4></center>

                        </div>

                        <div class="panel-body">

                            <div class="row">

                               

                                <!-- /.col-lg-6 (nested) -->

                                <div class="col-lg-12">

                                      <form method="post" action="" enctype="multipart/form-data">

                            <div class="panel-body">

                                <div class="row">

                                    <div class="col-md-12">

                                        

											<div class="col-md-12">

                                                <div class="form-group">

                                                    <label for="project_name required"

                                                           class="control-label required">project Name</label>

                                                    <input value="<?php echo $row['project_name']; ?>" required="required" type="text"

                                                           maxlength="50"

                                                           name="project_name" class="form-control"

                                                           placeholder="project Name">

                                                </div>

                                        

                                            <div class="form-group">

                                                <label for="project_owner" class="control-label">project Owner</label>

                                                <input value="<?php echo $row['project_owner']; ?>" maxlength="50" type="text"

                                                       name="project_owner" class="form-control" placeholder="project Owner">

                                            </div>

                                            <div class="form-group">

                                                <label for="project_mobile" class="control-label required">project Mobile</label>

                                                <input value="<?php echo $row['project_mobile']; ?>" type="text"

                                                       maxlength="20"

                                                       name="project_mobile" class="form-control"

                                                       placeholder="project Mobile">

                                            </div>

                                            <div class="form-group">

                                                <label for="project_email" class="control-label">project Email</label>

                                                <input value="<?php echo $row['project_email']; ?>" maxlength="20"

                                                       name="project_email" class="form-control" placeholder="project Email">

                                            </div>



                                            <div class="form-group">

                                                <label for="project_address" class="control-label">project Address</label>

                                                <textarea maxlength="200" name="project_address" class="form-control"

                                                          placeholder="project Address"><?php echo $row['project_address']; ?></textarea>

                                            </div>
											<div class="form-group">
                                                 <label for="photo" class="control-label">Photo</label>
                                                 <input name="photo" class="form-control" type="file">
                                            </div>

                                          

											

                                </div>

                                <div class="col-md-12 text-center">

                                    <input required="required" class="btn btn-info"

                                           type="submit"

                                           name="update" value="Save"/>

                                    <a href="project.php" class="btn btn-info">Back</a>

                                </div>

                            </div>

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

