<?php
include "config.php";
$id=$_GET['id'];
$sql="select * from sda_image where id=$id";
$result = mysqli_query($conn,$sql);
while($row=mysqli_fetch_array($result)){
unlink("photo/image/".$id.".php");
}
$sql = "delete from sda_image where id=$id";
mysqli_query($conn, $sql);
header("location: ");
        header("location: project.php");
