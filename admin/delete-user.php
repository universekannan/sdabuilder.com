<?php
session_start();
include "timeout.php";
include "config.php";

$id=$_GET['id'];

$sql = "SELECT * FROM users where id=$id";
$result = mysqli_query($conn, $sql);
while($row = mysqli_fetch_assoc($result)){
}

if($company_id!=$company_id2){
    header("location: index.php");
} else{
    $sql = "delete from users where id=$id";
    mysqli_query($conn, $sql);
    header("location: users.php");
}




