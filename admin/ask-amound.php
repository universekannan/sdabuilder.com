<?php
session_start();
$page = "ec";
include "timeout.php";
include "config.php";
if (($_SESSION['user_type'] != "admin")) header("location: index.php");
$id=$_GET['id'];	
$date=date("Y-m-d");
$from_date = date('m-d-Y', strtotime('-5 day', strtotime($date)));
$to_date=date("Y-m-d");
if (isset($_POST['submit'])) {
    $from_date=$_POST['from_date'];
    $to_date=$_POST['to_date'];
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
			<div class="panel-body">
                    <form class="form-inline" role="form" method="post">
                        <div class="form-group">
                            <label></label>
                            <input class="form-control" value="<?php echo $from_date; ?>" required type="date" name="from_date"  >
                            <label></label>
                            <input class="form-control" value="<?php echo $to_date; ?>" required type="date" name="to_date"  >
                            <input required="required" class="btn btn-info" type="submit" name="submit" value="Show"/>
                        </div>
                    </form>
                </div>
			    <div class="col-md-12" style="padding-bottom: 5px" >
			   				<?php
						$sql2 = "select * from users where id=$id";
                        $result2 = mysqli_query($conn, $sql2);
                        while ($row2 = mysqli_fetch_assoc($result2)) {
                            ?>
                    <a href="add-salary.php?id=<?php echo $row2['id']; ?>" class="btn btn-info fa fa-plus pull-right">&nbsp;Add Salary</a>
                    <br>
                </div>                </div>
                <!-- /.col-lg-12 -->
				 
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                         <center> <?php echo $row2['full_name']; ?></center> 
                        </div>
													<?php } ?>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                           <th>Date</th>
						    <th>Projects</th>
							<th>Salary</th>
						    <th>Give Amount</th>
   						    <th>Balance</th>
                            <th>User Name</th>
                            <th width="50px" style="text-align:right">Edit</th>
                            <th width="50px" style="text-align:right">Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                 <?php
                        function can_delete($id)
                        {
                            $flag = true;
                            $sql = "select * from payment where id=$id";
                            $result = mysqli_query($GLOBALS['conn'], $sql);
                            while ($row = mysqli_fetch_assoc($result)) {
                                $flag = false;
                            }
                            return $flag;
                        }
					$sql = "select a.*,b.full_name,c.project_name from salary a,users b,project c where a.user_id=b.id and a.states='Salary' and a.project_id=c.id and a.project_id=$id and a.date>='$from_date' and a.date<='$to_date' ORDER BY a.date DESC";
                        $result = mysqli_query($conn, $sql);
                        while ($row = mysqli_fetch_assoc($result)) {
                            ?>
                            <tr>
                            <td><?php echo $row['date']; ?></td>
							<td><?php echo $row['project_name']; ?></td>
							<td><?php echo $row['amount']; ?></td>
							<td><?php echo $row['payed']; ?></td>
							<td><?php echo $row['balance']; ?></td>
							<td><?php echo $row['full_name']; ?></td>
                            <td style="text-align:right"><a class="btn btn-danger fa fa-edit" href="edit-salary.php?id=<?php echo $row['id']; ?>">&nbsp;Edit</a>
                                    </td>
                           <td style="text-align:right"><a class="btn btn-danger fa fa-trash-o" href="delete-salary.php?id=<?php echo $row['id']; ?>">&nbsp;Delete</a>
                                    </td>

                            </tr>
                        <?php

                        }
                        ?>
						
                        </tbody>
                            <td>Total</td>
                             <td>
							
							</td>                               <td>
							<?php
		                 $sql2 = "select sum(amount) as amount from salary where project_id=$id and date>='$from_date' and date<='$to_date' GROUP BY project_id ";
                        //$sql2 = "SELECT SUM(balance) FROM payment";
                        $result2 = mysqli_query($conn, $sql2);
                        while ($row2 = mysqli_fetch_assoc($result2)) {
                            ?><?php echo $row2['amount']; ?>
							<?php } ?>
							</td>                             <td>
							<?php
		                 $sql2 = "select sum(payed) as payed from salary where project_id=$id and date>='$from_date' and date<='$to_date' GROUP BY project_id ";
                        //$sql2 = "SELECT SUM(balance) FROM payment";
                        $result2 = mysqli_query($conn, $sql2);
                        while ($row2 = mysqli_fetch_assoc($result2)) {
                            ?><?php echo $row2['payed']; ?>
							<?php } ?>
							</td>
							<td>
							<?php
		                 $sql2 = "select sum(balance) as balance from salary where project_id=$id and date>='$from_date' and date<='$to_date' GROUP BY project_id ";
                        //$sql2 = "SELECT SUM(balance) FROM payment";
                        $result2 = mysqli_query($conn, $sql2);
                        while ($row2 = mysqli_fetch_assoc($result2)) {
                            ?><?php echo $row2['balance']; ?>
							<?php } ?>
							</td>
							<td></td>
                           
                                 
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
