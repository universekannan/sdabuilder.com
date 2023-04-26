
<?php
session_start();
include "timeout.php";
include "config.php";
$page="attendance";
if (($_SESSION['user_type'] != "superadmin") && ($_SESSION['user_type'] != "admin")) header("location: index.php");
$from_date=date("Y-m-d");
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
            <!-- /.row -->
                <div class="col-lg-12">
                        <div class="panel-body">
                    <form class="form-inline" role="form" method="post">
                        <div class="form-group">
                            <label>From Date</label>
                            <input class="form-control" value="<?php echo $from_date; ?>" required type="date" name="from_date"  >
                            <label>To Date</label>
                            <input class="form-control" value="<?php echo $to_date; ?>" required type="date" name="to_date"  >
                            <input required="required" class="btn btn-info" type="submit" name="submit" value="Show"/>
                        </div>
                    </form>
                </div>
        </div>
            <div class="row">
			  <div class="col-md-12" style="padding-bottom: 5px" >
					<a href="out_attendance.php" class="btn btn-info fa fa-plus pull-right">&nbsp;Out Time Attendance</a>
                    <a href="in_attendance.php" class="btn btn-info fa fa-plus pull-right">&nbsp;In Time Attendance</a>
                </div>
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                            <th>Name</th>
                        <th>Time In</th>
                        <th>Time Out</th>
                        <th>States</th>
                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                        <?php

                    $sql = "select a.*,b.full_name from attendance a,users b where
                            a.user_id=b.id and a.date>='$from_date' and a.date<='$to_date'
                            order by date,user_id";
                    $result = mysqli_query($conn, $sql);
                    $old_date=0;
                    while ($row = mysqli_fetch_assoc($result)) {
                        if($old_date!=$row['date']){
                            echo "<tr><td colspan='4' align='center'>".fromsqldatedmy($row['date'])."</td></tr>";
                        }
                        ?>
                        <tr>
                            <td>
                                <?php echo $row['full_name']; ?>
                            </td>
                            <td>
                                <?php echo $row['time_in']; ?>
                            </td>
                            <td>
                                <?php echo $row['time_out']; ?>
                            </td>
							<td>
                                <?php echo $row['states']; ?>
                            </td>
                            <td>
                                <a class="btn btn-danger fa fa-trash-o"
                                        href="delete-attendance.php?id=<?php echo $row['id']; ?>">&nbsp;Delete</a>
                            </td>
                        </tr>
                        <?php
                        $old_date=$row['date'];
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
