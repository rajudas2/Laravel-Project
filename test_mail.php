<?php
//include phpmailer
require_once('class.phpmailer.php');

//SMTP Settings
$mail = new PHPMailer();
$mail->IsSMTP();
$mail->SMTPAuth   = true; 
$mail->SMTPSecure = "tls"; 
$mail->Host       = "smtp.gmail.com";
$mail->Username   = "ppnavkiran@gmail.com";
$mail->Password   = "wktgmnzohigxjjdz";
//

$mail->SetFrom('ppnavkiran@gmail.com', 'Tunepipe'); //from (verified email address)
$mail->Subject = "Test Email Service"; //subject

//message
$body = "This is a test message from AWS.";

$mail->MsgHTML($body);
//

//recipient
$mail->AddAddress("ppnavkiran@gmail.com", "Test Recipient"); 

//Success
if ($mail->Send()) { 
    echo "Message sent!"; die; 
}

//Error
if(!$mail->Send()) { 
    echo "Mailer Error: " . $mail->ErrorInfo; 
} 

?>

