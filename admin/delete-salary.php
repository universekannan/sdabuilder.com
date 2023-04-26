<?php
session_start();
include "timeout.php";
include "config.php";

$id=$_GET['id'];

$sql = "SELECT * FROM salary where id=$id";
$result = mysqli_query($conn, $sql);
while($row = mysqli_fetch_assoc($result)){
}
$sql = "delete from salary where id=$id";
    mysqli_query($conn, $sql);
    header("location: users.php");





