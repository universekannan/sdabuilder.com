<?php
session_start();
include "timeout.php";
include "config.php";
if (($_SESSION['user_type'] != "admin")&&($_SESSION['user_type'] != "Staff")) header("location: index.php");
$msg = "";
$msg_color = "";

$project_id = $_GET['id'];


$photo ="";
if (isset($_POST['submit'])) {

    
    $stmt = $conn->prepare("INSERT INTO sda_image(project_id) VALUES (?)");
        $stmt->bind_param("s", $project_id);
        $stmt->execute() or die($stmt->error);
        $id=$stmt->insert_id;

        
        $file_name = $_FILES['photo']['name'];
        if (trim($file_name) != "") {
        $ext = pathinfo($file_name, PATHINFO_EXTENSION);
        $file_name = $id . "." . $ext;
        $query = "update sda_image set photo = '" . $file_name . "' where id=$id";
        mysqli_query($conn, $query);
        $target_path = "photo/image/";
        $target_path = $target_path . $file_name;
        move_uploaded_file($_FILES['photo']['tmp_name'], $target_path);
}
               header("location: project.php");
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
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           <center>Photos</center>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                            <th>Id</th>
                            <th>Photo</th>
                            <th>Delete</th>
                            
                            
                                    </tr>
                                </thead>
                                <tbody>
                        <?php
                        if($_SESSION['user_type']=="admin"){
                            $sql = "select * from sda_image where project_id=$project_id";
                        }
                        else if($_SESSION['user_type']=="Staff"){
                            $sql = "select * from sda_image where project_id=$project_id";
                        }
                        $result = mysqli_query($conn, $sql);
                        while ($row = mysqli_fetch_assoc($result)) {
                            ?>
                            <tr>
                                <td><?php echo $row['id']; ?></td>
                                <td>
 <img width="20" height="25" src="photo/image/<?php echo $row['photo']; ?>?<?php echo rand(); ?>"/>
</td>
                                       <td><a class="btn btn-info fa fa-delete" href="delete-image.php?id=<?php echo $row['id']; ?>">Delete</a></td>
                         
                            </tr>
                        <?php

                        }
                        ?>
                        </tbody>
                            </table>
                            <!-- /.table-responsive -->
                           
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row"><br>
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <center><h4><b>Add Image</h4></center>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                               
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-12">
                                   <form method="post" action="" name="submit" enctype="multipart/form-data">
                                    
                                            
                                            
                                                                                                              <div class="form-group">
                                           <label for="photo" class="control-label">Photo</label>
                                                 <input name="photo" class="form-control" type="file">
                                            </div>
                                </div>
                                
                                <div class="col-md-12 text-center">
                                    <input required="required" class="btn btn-info"
                                           type="submit"
                                           name="submit" value="Save"/>
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
