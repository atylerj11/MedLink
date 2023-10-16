<?php
//PHPMailer stuff
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

// Include PHPMailer autoload.php file
require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';

//create new mail object
$mail = new PHPMailer(true);

//try to fill and send email
try {
    $mail->isSMTP();
    //setting up gmail info
    $mail->Host = 'smtp.gmail.com';
    $mail->SMTPAuth = true;
    $mail->Username = 'MedLinkTeam@gmail.com'; 
    $mail->Password = 'hxaz eqnp mmma secm '; //app password, google wont authenticate using regular password 'SeniorProjectMedLinl' 
    $mail->SMTPSecure = 'tls';
    $mail->Port = 587;

    $mail->setFrom('MedLinkTeam@gmail.com', $_POST['sender']); //adds name of doctor as sender
    $mail->addAddress($_POST["email"]); // patient's email address
    $mail->Subject = $_POST['subject']; // subject
    $mail->Body = $_POST["message"]; //message

    $mail->send();
    echo 'success';
} 
//PHPMailer exception catching
catch (Exception $e) {
    echo 'Email sending failed: ' . $mail->ErrorInfo;
}
?>
