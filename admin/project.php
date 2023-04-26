<?php
session_start();
$page = "project";
include "timeout.php";
include "config.php";
if (($_SESSION['user_type'] != "admin") && ($_SESSION['user_type'] != "Staff") && ($_SESSION['user_type'] != "Store") && ($_SESSION['user_type'] != "Supervisor")) header("location: index.php");
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
                <!-- /.col-lg-12 -->
				 
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           All Project
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                           <th>Project Name</th>
                            <th>Owner Name</th>
                            <th>Mobile</th>
                            <th>Ask $</th>
                            <th>Amound</th>
                            <th  style="text-align:right">View Tool</th>
                            <?php if(($_SESSION['user_type']=="admin") || ($_SESSION['user_type']=="Staff")){ ?>
                            <th  style="text-align:right">Edit</th>
                            <th  style="text-align:right">Delete</th>
							<th  style="text-align:right">Image</th>
							<?php } ?>  
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
						if(($_SESSION['user_type']=="admin") || ($_SESSION['user_type']=="Staff")){
                            $sql = "select * from project";
                        }else {
							$user_id=$_SESSION['user_id'];
						$sql = "select * from project where id in(select assign_project_id from assign_project where assign_project_user_id=$user_id)";
                         
                        }
						//$sql = "select a.*,b.description from galaxy_project a,galaxy_category b where a.category_id=b.id and a.id in(select project_id from galaxy_rights where user_id=$user_id) order by category_id";
                        
						 $result = mysqli_query($conn, $sql);
                        while ($row = mysqli_fetch_assoc($result)) {
                            ?>
                            <tr>
                                <td><?php echo $row['project_name']; ?></td>
								 <td><?php echo $row['project_owner']; ?></td>
								 <td><?php echo $row['project_mobile']; ?></td>
								 <?php if($_SESSION['user_type']=="Supervisor"){ ?>
								<td><a class="btn btn-info fa fa-view" href="project-equipment.php?id=<?php echo $row['id']; ?>">&nbsp;View Tool</a></td>
								 <?php
                        }
                        ?>
                            <?php if($_SESSION['user_type']=="admin"){ ?>
								<td><a class="btn btn-info fa fa-view" href="ask-amound.php?id=<?php echo $row['id']; ?>">&nbsp;Ask $</a></td>
								<td><a class="btn btn-info fa fa-view" href="amount.php?id=<?php echo $row['id']; ?>">&nbsp;Amound</a></td>
								<td><a class="btn btn-info fa fa-view" href="view-equipments.php?id=<?php echo $row['id']; ?>">&nbsp;View Tool</a></td>
                                <td><a class="btn btn-info fa fa-edit" href="edit-project.php?id=<?php echo $row['id']; ?>">&nbsp;Edit</a></td>
                                <td><a class="btn btn-info fa fa-delete"href="delete-project.php?id=<?php echo $row['id']; ?>">Delete</a></td>
								<td><a class="btn btn-info fa fa-view" href="add-image.php?id=<?php echo $row['id']; ?>">&nbsp;Image</a></td>
							<?php } ?>  
							<?php if($_SESSION['user_type']=="Staff"){ ?>
							<td><a class="btn btn-info fa fa-edit" href="edit-project.php?id=<?php echo $row['id']; ?>">&nbsp;Edit</a></td>
                                <td><a class="btn btn-info fa fa-delete"href="delete-project.php?id=<?php echo $row['id']; ?>">Delete</a></td>
								<td><a class="btn btn-info fa fa-delete"href="add-image.php?id=<?php echo $row['id']; ?>">Image</a></td>
							<?php } ?>  

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
         
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
<?php include"footer.php"?>
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
