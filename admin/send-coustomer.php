 <?php
session_start();
$page = "ec";
include "timeout.php";
include "config.php";
if (($_SESSION['user_type'] != "admin") && ($_SESSION['user_type'] != "staff")) header("location: index.php");
$id = $_GET['id'];
$user_id = $_SESSION['user_id'];
$msg = "";
$msg_color = "";
$project_id="";
$date = "";
$date_time = "";
$description = "";
$pro_old_balance = "";
$old_balance = "";
$amount = "";
$payed = "";
$balance = "";

if (isset($_POST['submit'])) {

         $date =date("y/m/d");
         $description = $_POST['description'];
         $pro_old_balance = trim($_POST['pro_old_balance']);
         $payed= trim($_POST['payed']);
         $balance = trim($_POST['balance']);	
	
         $stmt = $conn->prepare("update project set pro_old_balance=? where id=?");
         $stmt->bind_param("ss", $pro_old_balance=$balance, $id);
         $stmt->execute();
		
		 $stmt1 = $conn->prepare("INSERT INTO payment(date,description,payed,balance,old_balance,user_id,project_id) VALUES (?,?,?,?,?,?,?)");
        $stmt1->bind_param("sssssss",$date,$description,$payed,$balance,$old_balance=$pro_old_balance+$payed,$user_id,$project_id=$id);
        $stmt1->execute()or die($stmt1->error);
        $id=$stmt1->insert_id;


        header("location: project.php");
    }


$sql = "select * from project where id='$id'";
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
                            <center><h4><b>Add Project Amount</h4></center>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-12">
                                   <form method="post" action="" name="submit" enctype="multipart/form-data">
                                       
											
				<div class="form-group">
                                            <label for="pro_old_balance" class="control-label">Username</label>
                                            <input value="<?php echo $row['project_email'];?>" maxlength="20"  type ="text"
                                                   name="pro_old_balance" id="pro_old_balance" class="form-control">
                                        </div>
										
				    <div class="form-group">
                                            <label for="payed" class="control-label">Password</label>
                                            <input  value="<?php echo $row['password'];?>" maxlength="20"  type ="text"
                                                   name="payed" id="payed" class="form-control">
                                        </div>
										
				 <div class="form-group">
                                            <label for="payed" class="control-label">Login Url</label>
                                            <input value="http://www.lalconstruction.in/admin/login.php" maxlength="20"  type ="text"
                                                   name="payed" id="payed" class="form-control">
                                        </div>					
											
                                            <div class="form-group text-center">
                                                <input required="required" class="btn btn-info"
                                                       type="submit"
                                                       name="submit" value="Update"/>
                                                <a href="" class="btn btn-info">Back</a>                                           </div>
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
	<script>
      function runScript(e) {
    if (e.keyCode == 13) {
        $("input[name='payed']").focus();
    }
    }

    function runScript2(e) {
    if (e.keyCode == 13) {
        var payed = ~~parseInt($('#payed').val());
        var amount= ~~parseInt($('#amount').val());
		var pro_old_balance= ~~parseInt($('#pro_old_balance').val());
        var balance=pro_old_balance+amount-payed;
        if(amount>0){
            add_row();
        }
    }
    }



     function  calculate_amount() {
        var payed = ~~parseInt($('#payed').val());
        var amount= ~~parseInt($('#amount').val());
		var pro_old_balance= ~~parseInt($('#pro_old_balance').val());
        var balance=pro_old_balance+amount-payed;
        $('#balance').val(balance);
    }

    function  calculate_balance() {
        var balance = ~~parseInt($('#balance').val());
        var balance=0;
        var amount = $('input[name="amount[]"]');
		var pro_old_balance = $('input[name="pro_old_balance[]"]');
        for(var j=0;j<i;j++){
            balance=balance+parseInt(amount.eq(j)+ pro_old_balance.eq(j).val());
        }
        balance=pro_old_balance+amount-payed;
        $('#balance').val(balance);
    }


</script>
</body>
</body>

</html>
