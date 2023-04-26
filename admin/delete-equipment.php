<?php
session_start();
include "timeout.php";
include "config.php";

$id=$_GET['id'];

$sql = "SELECT * FROM equipment where id=$id";
$result = mysqli_query($conn, $sql);
while($row = mysqli_fetch_assoc($result)){
    $company_id2=$row['company_id'];
}

if($company_id!=$company_id2){
    header("location: index.php");
} else{
    $sql = "delete from equipment where id=$id";
    mysqli_query($conn, $sql);
    header("location: equipment.php");
}




