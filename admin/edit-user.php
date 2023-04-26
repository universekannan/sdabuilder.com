<?php

session_start();

$page = "users";

include "timeout.php";

include "config.php";

if (($_SESSION['user_type'] != "admin")&&($_SESSION['user_type'] != "Store")&&($_SESSION['user_type'] != "Supervisor")&&($_SESSION['user_type'] != "Staff"))header("location: index.php");

$id = $_GET['id'];

$msg = "";

$msg_color = "";

$full_name = "";

$email = "";

$status = "Active";

$user_type = "";
$designation = "";

$password = "";

$mobile = "";
$salary = "";

$address = "";

if (isset($_POST['submit'])) {

    $full_name = trim($_POST['full_name']);

    $email = trim($_POST['email']);

    $status = $_POST['status'];

	$user_type = "staff";

    $password = trim($_POST['password']);

    $mobile = trim($_POST['mobile']);
    $salary = trim($_POST['salary']);

    $address = trim($_POST['address']);

    $designation = trim($_POST['designation']);
    $user_type = trim($_POST['user_type']);





   

        $stmt = $conn->prepare("update users set full_name=?,email=?,status=?,password=?,designation=?,mobile=?,salary=?,address=? where id=?");

        $stmt->bind_param("sssssssss", $full_name, $email, $status, $password,$designation, $mobile,$salary,$address,$id);

        $stmt->execute();

         $file_name = $_FILES['photo']['name'];



        if (trim($file_name) != "") {



            $ext = pathinfo($file_name, PATHINFO_EXTENSION);



            $file_name = $id . "." . $ext;



            $query = "update users set photo = '" . $file_name . "' where id =$id";



            mysqli_query($conn, $query);



            $target_path = "photo/condect/";



            $target_path = $target_path . $file_name;



            move_uploaded_file($_FILES['photo']['tmp_name'], $target_path);



        }



        header("location: users.php");

    }





$sql = "select * from users where id=$id";

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

                            <center><h4><b>Edit User</h4></center>

                        </div>

                        <div class="panel-body">

                            <div class="row">

                               

                                <!-- /.col-lg-6 (nested) -->

                                <div class="col-lg-12">

                                   <form method="post" action="" name="submit" enctype="multipart/form-data">

                                           

												  <div class="form-group">

                                                    <label for="full_name required"

                                                           class="control-label required">Full Name</label>

                                                    <input value="<?php echo $row['full_name']; ?>" type="text"

                                                           

                                                           name="full_name" id="full_name" class="form-control"

                                                           placeholder="Full Name">

                                                </div>

										





                                        <div class="form-group">

                                            <label for="email" class="control-label required">Email</label>

                                            <input value="<?php echo $row['email']; ?>" type="email"

                                                   name="email" class="form-control" placeholder="Email">

                                        </div>



                                        <div class="form-group">

                                            <label for="password" class="control-label required">Password</label>

                                            <input value="<?php echo $row['password']; ?>" type="text" 

                                                   name="password" id="password" class="form-control"

                                                   placeholder="Password">

                                        </div>



                                        

                                        <div class="form-group">

                                            <label for="mobile" class="control-label">Mobile</label>

                                            <input value="<?php echo $row['mobile']; ?>" 

                                                   name="mobile" class="form-control" placeholder="Mobile">

                                        </div>
                                         <div class="form-group">

                                            <label for="mobile" class="control-label">Salary</label>

                                            <input value="<?php echo $row['salary']; ?>" 

                                                   name="salary" class="form-control" placeholder="Salary">

                                        </div>



                                        <div class="form-group">

                                            <label for="mobile" class="control-label">Address</label>

                                            <textarea maxlength="200" name="address" class="form-control"

                                                      placeholder="Address"><?php echo $row['address']; ?></textarea>

                                        </div>
                                        
                                       <div class="form-group">

                                            <label for="designation" class="control-label required">Designation</label>

                                            <input value="<?php echo $row['designation']; ?>" type="text"

                                                   name="designation" class="form-control" placeholder="Designation">

                                        </div>
									

                                         <div class="form-group">

                                                <label for="status" class="control-label required">Status</label>

                                                <select name="status" id="status" class="form-control">

                                                    <option <?php if ($row['status'] == "Active") echo " selected='selected'"; ?>

                                                        value="Active">Active

                                                    </option>

                                                    <option <?php if ($row['status'] == "Inactive") echo " selected='selected'"; ?>

                                                        value="Inactive">Inactive

                                                    </option>

                                                </select>

                                            </div>

                                         <div class="form-group">



                                                <label for="photo" class="control-label">Photo</label>



                                                <input name="photo" class="form-control" type="file">



                                            </div>

										

                                        <div class="form-group text-center">

                                            <input required="required" class="btn btn-info"

                                                   type="submit"

                                                   name="submit" value="Update"/>

                                            <a href="users.php" class="btn btn-info">Back</a>

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

