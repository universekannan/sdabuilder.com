<?php
session_start();
include "timeout.php";
include "config.php";
if ($_SESSION['user_type'] != "Supervisor")  header("location: index.php");
$user_id=$_SESSION['user_id'];
$id = $_GET['id'];
$msg = "";
$msg_color = "";
$equ_id = "";
$qty = "";
$status = 'Approved';
$status1 = 'Done';
$date =date('y/m/d');

if (isset($_POST['update'])) {
	
    $equ_id = trim($_POST['equ_id']);
    $qty = $_POST['qty'];
	$date =date('y/m/d'); 
	
	        $stmt1 = $conn->prepare("Update staff set status=?,date=? where id=?");
        $stmt1->bind_param("sss",$status=$status1,$date,$id);
        $stmt1->execute() or die($stmt1->error);
        
	
	    $stmt = $conn->prepare("Update supervisor set status=?,date=?,user_id=? where id=?");
        $stmt->bind_param("ssss",$status,$date,$user_id,$id);
        $stmt->execute() or die($stmt->error);

      //	$stmt1 = $conn->prepare("UPDATE  equipment SET stock=stock-$qty where id=$equ_id");

	


        header("location: project.php");
    }


$sql = "select * from supervisor where id=$id ";
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
                            <center><h4><b> Approve</h4></center>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                               
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-12">
                               <form method="post" action="" enctype="multipart/form-data">
                                                       <div class="form-group">
                                            <label for="category required"
                                                   class="control-label required">Project or Store</label>
                                            <select disabled  name="project_id" class="form-control" required="required" >
                                                <?php
                                                $sql2 = "select * from project  where project_type='Project' order by id";
                                                $result2 = mysqli_query($conn, $sql2);
                                                while ($row2 = mysqli_fetch_assoc($result2)) {
                                                    ?>
                                                    <option value="<?php echo $row2['id']; ?>"
                                                    <?php if($row['project_id']==$row2['id']) echo " selected "; ?>
                                                    ><?php echo $row2['project_name']; ?></option>
                                                <?php
                                                }
                                                ?>
                                            </select>
                                        </div>
				        <div class="form-group">
                                            <label for="category required"
                                                   class="control-label required">Equipments Name</label>
                                            <select name="equ_id" class="form-control" required="required" >
                                                <?php
                                                $sql3 = "select a.*,b.equipment_name from supervisor a, equipment b where a.equ_id=b.id and a.id=$id";
                                                //$sql3 = "select * from equipment  order by id";
                                                $result3 = mysqli_query($conn, $sql3);
                                                while ($row3 = mysqli_fetch_assoc($result3)) {
                                                    ?>
                                                    <option value="<?php echo $row3['id']; ?>"
                                                    <?php if($row['equ_id']==$row3['id']) echo " selected "; ?>
                                                    ><?php echo $row3['equipment_name']; ?></option>
                                                <?php
                                                }
                                                ?>
                                            </select>
                                        </div>

                                            <div class="form-group">
                                                <label for="qty" class="control-label required">Quantity</label>
                                                <input readonly value="<?php echo $row['qty']; ?>" type="text"
                                                       maxlength="20"
                                                       name="qty" class="form-control"
                                                       placeholder="Qty">
                                            </div>
                                            

                                           
                                </div>
                                <div class="col-md-12 text-center">
                                    <input required="required" class="btn btn-info"
                                           type="submit"
                                           name="update" value="Save"/>
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
