<?php
session_start();
include "timeout.php";
include "config.php";
if (($_SESSION['user_type'] != "admin")&&($_SESSION['user_type'] != "Staff")) header("location: index.php");
$msg = "";
$msg_color = "";
$user_id=$_SESSION['user_id'];
$project_name = "";
$project_owner = "";
$project_mobile = "";
$project_email = "";
$project_amount = "";
$project_address = "";

$project_amount = "";$category_id ="";
$photo ="";
if (isset($_POST['submit'])) {

    $project_name = trim($_POST['project_name']);
    $project_owner = trim($_POST['project_owner']);
    $project_mobile = $_POST['project_mobile'];
    $project_email = trim($_POST['project_email']);
    $project_amount = trim($_POST['project_amount']);
    $project_address = trim($_POST['project_address']);
     $category_id = trim($_POST['category_id']);

        $stmt = $conn->prepare("INSERT INTO project (project_name,project_owner,project_mobile,project_email,project_amount,project_address,category_id,user_id) VALUES (?,?,?,?,?,?,?,?)");
        $stmt->bind_param("ssssssss", $project_name,$project_owner,$project_mobile,$project_email,$project_amount,$project_address,$category_id,$user_id);
        $stmt->execute() or die($stmt->error);
        $id=$stmt->insert_id;
		
        $file_name = $_FILES['photo']['name'];
        if (trim($file_name) != "") {
        $ext = pathinfo($file_name, PATHINFO_EXTENSION);
        $file_name = $id . "." . $ext;
        $query = "update project set photo = '" . $file_name . "' where id=$id";
        mysqli_query($conn, $query);
        $target_path = "photo/project/";
        $target_path = $target_path . $file_name;
        move_uploaded_file($_FILES['photo']['tmp_name'], $target_path);

        header("location: project.php");
}
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
                            <center><h4><b>Add Project</h4></center>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                               
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-12">
                                   <form method="post" action="" name="submit" enctype="multipart/form-data">
								    <div class="form-group">
                                            <label for="category_id required"
                                                   class="control-label required">Category Name</label>
                                            <select name="category_id" class="form-control" required="required" >
                                                <option value=""> Select Category</option>
                                                <?php
                                                $sql2 = "select * from category";
                                                $result2 = mysqli_query($conn, $sql2);
                                                while ($row2 = mysqli_fetch_assoc($result2)) {
                                                ?>
                                                    <option value="<?php echo $row2['id']; ?>" ><?php echo $row2['name']; ?></option>
                                                <?php
                                                }
                                                ?>
                                            </select>
                                        </div>
                                             <div class="form-group">
                                                <label>Project Name</label>
                                                <input value="<?php echo $project_name; ?>" class="form-control" name="project_name" type="text" id="project_name"  class="validate[required,length[0,100]] text-input"  required aria-required="true" pattern="[A-Za-z]+\[A-Za-z]+">
                                            </div>
                                            <div class="form-group">
                                                <label>Owner Name</label>
                                                <input value="<?php echo $project_owner; ?>" class="form-control" name="project_owner" type="text" id="project_owner">
                                            </div>
											
											<div class="form-group">
                                                <label>Mobile</label>
                                                <input value="<?php echo $project_mobile; ?>" class="form-control" name="project_mobile" type="text" id="project_mobile"  class="validate[required,length[0,200]] text-input"  required aria-required="true" pattern="[0-9]+\[0-9]+">
                                            </div>
											<div class="form-group">
                                                <label>Email</label>
                                                <input value="<?php echo $project_email; ?>" class="form-control" name="project_email" type="email" id="project_email"  class="validate[required,length[0,200]] text-input"  required aria-required="true" pattern="[A-Za-z]+\[A-Za-z]+">
                                            </div>
											<div class="form-group">
                                                <label>Project Amount</label>
                                                <input value="<?php echo $project_amount; ?>" class="form-control" name="project_amount" type="text" id="project_amount"  class="validate[required,length[0,200]] text-input"  required aria-required="true" pattern="[A-Za-z]+\[A-Za-z]+">

                                            </div>
											<div class="form-group">
                                                <label>Address</label>
                                                <textarea value="<?php echo $project_address; ?>" class="form-control" name="project_address" type="text" id="project_address"  class="validate[required,length[0,200]] text-input"  required aria-required="true" pattern="[A-Za-z]+\[A-Za-z]+"></textarea>
                                            </div>
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
