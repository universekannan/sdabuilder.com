<?php
session_start();
$page = "equipment";
include "timeout.php";
include "config.php";
if (($_SESSION['user_type'] != "admin") && ($_SESSION['user_type'] != "Staff")) header("location: index.php");

$msg = "";
$msg_color = "";
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

    <!-- DataTables CSS -->
    <link href="vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

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
                <div class="col-lg-12">
<br  />
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           <center><h4>All Equipment</center></h4>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                           <th>Equipment Name</th>
                            <th>Total</th>
                            <th>Stock</th>
                            <th>Date</th>
							 <?php if($_SESSION['user_type']=="admin"){ ?>
                            <th width="50px" style="text-align:right">View Meterial</th>
							<th width="50px" style="text-align:right">Transfer</th>
							 <th width="50px" style="text-align:right">Edit</th>
							 <?php } ?>
							 <?php if($_SESSION['user_type']=="Staff"){ ?>
							 <th width="50px" style="text-align:right">Edit</th>
                            <th width="50px" style="text-align:right">Additional</th>
							<th width="50px" style="text-align:right">Transfer</th>
                            <th width="50px" style="text-align:right">Delete</th>
							 <?php } ?>

							 <?php if($_SESSION['user_type']=="Supervisor"){ ?>
                            <th width="50px" style="text-align:right">View</th>
							 <?php } ?>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php
                        function can_delete($id)
                        {
                            $flag = true;
                            $sql = "select * from equipment where user_id=$id";
                            $result = mysqli_query($GLOBALS['conn'], $sql);
                            while ($row = mysqli_fetch_assoc($result)) {
                                $flag = false;
                            }
                            return $flag;
                        }
                        $sql = "select * from equipment";
                        $result = mysqli_query($conn, $sql);
                        while ($row = mysqli_fetch_assoc($result)) {
                            ?>
                            <tr>
                                
                                <td><?php echo $row['equipment_name']; ?></td>
                                <td><?php echo $row['total']; ?></td>
                                <td><?php echo $row['stock']; ?></td>
                                <td><?php echo $row['date']; ?></td>
								 <?php if($_SESSION['user_type']=="admin"){ ?>
                                <td><a class="btn btn-info fa fa-edit" href="view-meterial.php?id=<?php echo $row['id']; ?>">View Meterial</a></td>
								<td><a class="btn btn-info fa fa-edit" href="store-transfer-tool.php?id=<?php echo $row['id']; ?>"class="btn btn-info fa fa-plus pull-right">Transfer</a></td>
								 <td><a class="btn btn-info fa fa-edit" href="edit-equipment.php?id=<?php echo $row['id']; ?>">Edit</a></td>
								 <?php } ?>
								 <?php if($_SESSION['user_type']=="Staff"){ ?>
								 <td><a class="btn btn-info fa fa-edit" href="edit-equipment.php?id=<?php echo $row['id']; ?>">Edit</a></td>
                                <td><a class="btn btn-info fa fa-edit" href="add-additional-equipment.php?id=<?php echo $row['id']; ?>">Additional</a></td>
                                <td><a class="btn btn-info fa fa-edit" href="staff-store-transfer.php?id=<?php echo $row['id']; ?>"class="btn btn-info fa fa-plus pull-right">Transfer</a></td>
                                <?php if (can_delete($row['id'])) { ?>
                                <td style="text-align:right"><a class="btn btn-danger fa fa-trash-o" href="delete-equipment.php?id=<?php echo $row['id']; ?>">&nbsp;Delete</a>
                           
                       <?php } else { ?>
                                    <td>&nbsp;</td>
                                <?php } ?>
 </tr><?php } ?>
								 <?php } ?>
								 <?php if($_SESSION['user_type']=="Supervisor"){ ?>
                                <td><a class="btn btn-info fa fa-edit"  href="view.php?id=<?php echo $row['id']; ?>">View</a></td>
								 <?php } ?>

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

    <!-- DataTables JavaScript -->
    <script src="vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>

</body>

</html>
