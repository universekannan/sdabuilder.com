<?php
session_start();
$page = "users";
include "timeout.php";
include "config.php";
if (($_SESSION['user_type'] != "superadmin") && ($_SESSION['user_type'] != "admin") && ($_SESSION['user_type'] != "Staff") && ($_SESSION['user_type'] != "Store")) header("location: index.php");
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

    <title>SDA Builder <?php echo $from_date; ?> to <?php echo $to_date; ?></title>

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
                </div>                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           <center> Users</center>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="example1">
                                <thead>
                                    <tr>
                            <th>Date</th>
                            <th>Full Name</th>
                            <th>Totel Hours</th>
                            <th>Payed</th>
                            <th>Balance</th>
                            <th width="70px" style="text-align:right"> </th>
                                    </tr>
                                </thead>
                                <tbody>
                        <?php
                        if($_SESSION['user_type']=="admin"){
					$sql = "select a.*,b.full_name,sum(hours) as hours,sum(payed) as payed, sum(balance) as balance from salary a,users b where a.hours<>'a' and a.staff_id=b.id and date>='$from_date' and date<='$to_date' GROUP BY staff_id";
                        }
                       
                        $result = mysqli_query($conn, $sql);
                        while ($row = mysqli_fetch_assoc($result)) {
                            ?>
                            <tr>
                                <td><?php echo $row['date']; ?></td>
                                <td><?php echo $row['full_name']; ?></td>
                                <td><?php echo $row['hours']; ?></td>
                                <td><?php echo $row['payed']; ?></td>
                                <td><?php echo $row['balance']; ?></td>
                                <td><a class="btn btn-info fa fa-eye" href="salary.php?id=<?php echo $row['staff_id']; ?>"></a></td>
								

                            </tr>
                        <?php

                        }
                        ?>
						<td>Total</td>
								<td><?php echo $from_date; ?> </td>
								<td> <?php echo $to_date; ?></td>
								 <td>
							<?php
		                 $sql2 = "select SUM(payed) as payed from salary where date>='$from_date' and date<='$to_date'";
                        $result2 = mysqli_query($conn, $sql2);
                        while ($row2 = mysqli_fetch_assoc($result2)) {
                            ?><?php echo $row2['payed']; ?>
							<?php } ?>
							</td>   
							 <td>
							<?php
		                 $sql3 = "select SUM(balance) as balance from salary where date>='$from_date' and date<='$to_date'";
                        $result3 = mysqli_query($conn, $sql3);
                        while ($row3 = mysqli_fetch_assoc($result3)) {
                            ?><?php echo $row3['balance']; ?>
							<?php } ?>
							</td>   
								<td></td>
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

   <script type="text/javascript" src="datatable/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="datatable/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="datatable/buttons.flash.min.js"></script>
<script type="text/javascript" src="datatable/jszip.min.js"></script>
<script type="text/javascript" src="datatable/pdfmake.min.js"></script>
<script type="text/javascript" src="datatable/vfs_fonts.js"></script>
<script type="text/javascript" src="datatable/buttons.html5.min.js"></script>

<link type="text/css" href="datatable/jquery.dataTables.min.css" rel="stylesheet">
<link type="text/css" href="datatable/buttons.dataTables.min.css" rel="stylesheet">
<script>
  $(document).ready(function() {
    $('#example1').DataTable( {
        dom: 'Bfrtip',
        buttons: [
             'excel'
        ]
    } );
} );
  
</script>

</body>

</html>
