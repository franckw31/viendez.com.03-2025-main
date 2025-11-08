<?php
session_start();
echo "coucou";
if (isset($_SESSION['Email_Session'])) {
    header("Location: /index.html");
    die();
}
include('/panel/include/config.php');
//Import PHPMailer classes into the global namespace
//These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
//Load Composer's autoloader
require 'panel/vendor/autoload.php';
echo "coucou";
$msg = "";
$Error_Pass="";
if (isset($_POST['submit'])) {
    $pseudo = mysqli_real_escape_string($conx, $_POST['pseudo']);
    $email = mysqli_real_escape_string($conx, $_POST['Email']);
    $Password = mysqli_real_escape_string($conx, $_POST['Password']);
    $Confirm_Password = mysqli_real_escape_string($conx, $_POST['Conf-Password']);
    $Code = mysqli_real_escape_string($conx, md5(rand()));
    if (mysqli_num_rows(mysqli_query($conx, "SELECT * FROM membres where email='{$email}'")) > 0) {
        $msg = "<div class='alert alert-danger'>This Email:'{$email}' has been alredy existe.</div>";
    } else {
        if ($Password === $Confirm_Password) {
            $query = "INSERT INTO membres (`pseudo`, `email`, `Password`, `CodeV`) values('$pseudo','$email','$Password','$Code')";
            $result = mysqli_query($conx, $query);
            if ($result) {
                //Create an instance; passing `true` enables exceptions
                $mail = new PHPMailer(true);

                try {
                    //Server settings
                $mail->SMTPDebug = 0;                      //Enable verbose debug output
                $mail->isSMTP();                                            //Send using SMTP
                $mail->Host       = 'smtp.ionos.fr';                     //Set the SMTP server to send through
                $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
                $mail->Username   = 'admin@poker31.org';                     //SMTP username
                $mail->Password   = 'Kookies7*p';                               //SMTP password
                $mail->SMTPSecure = 'Tls';            //Enable implicit TLS encryption
                $mail->Port       = 25;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

                //Recipients
                $mail->setFrom('admin@poker31.org', 'Admin Poker31');
                $mail->addAddress($email);
                //Content
                    $mail->isHTML(true);                                  //Set email format to HTML
                    $mail->Subject = 'Message de Poker31';
                    $mail->Body    = '<p> Ceci est le lien de verification<b><a href="http://poker31.org/index.php?Verification='.$Code.'">"http://poker31.org/index.php?Verification='.$Code.'"</a></b></p>';

                    $mail->send();
                    
                } catch (Exception $e) {
                    echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
                }
                $msg = "<div class='alert alert-info'>we've send a verification code on Your email Address</div>";
            } else {
                $msg = "<div class='alert alert-danger'>Something was Wrong</div>";
                
            }
        } else {
            $msg = "<div class='alert alert-danger'>Password and Confirm Password is not match</div>";
            $Error_Pass='style="border:1px Solid red;box-shadow:0px 1px 11px 0px red"';
        }
    }
}
?>






<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="style.css" />
    <title>Sign in & Sign up Form</title>
    <style>
        .alert {
            padding: 1rem;
            border-radius: 5px;
            color: white;
            margin: 1rem 0;
            font-weight: 500;
            width: 65%;
        }

        .alert-success {
            background-color: #42ba96;
        }

        .alert-danger {
            background-color: #fc5555;
        }

        .alert-info {
            background-color: #2E9AFE;
        }

        .alert-warning {
            background-color: #ff9966;
        }
    </style>
</head>

<body>
    <div class="container sign-up-mode">
        <div class="forms-container">
            <div class="signin-signup">
                <form action="" method="POST" class="sign-up-form">
                    <h2 class="title">Nouveau</h2>
                    <?php echo $msg ?>
                    <div class="input-field">
                        <i class="fas fa-user"></i>
                        <input type="text" name="pseudo" placeholder="pseudo" value="<?php if (isset($_POST['pseudo'])) {
                                                                                                echo $pseudo;
                                                                                            } ?>" />
                    </div>
                    <div class="input-field">
                        <i class="fas fa-envelope"></i>
                        <input type="email" name="Email" placeholder="Email" value="<?php if (isset($_POST['Email'])) {
                                                                                        echo $email;
                                                                                    } ?>" />
                    </div>
                    <div class="input-field" <?php echo $Error_Pass?>>
                        <i class="fas fa-lock"></i>
                        <input type="password" name="Password" placeholder="Password" />
                    </div>
                    <div class="input-field" <?php echo $Error_Pass?>>
                        <i class="fas fa-lock"></i>
                        <input type="password" name="Conf-Password" placeholder="Confirm Password" />
                    </div>
                    <input type="submit" name="submit" class="btn" value="Création" />
                    <p class="social-text">Or Sign up with social platforms</p>
                    <div class="social-media">
                        <a href="#" class="social-icon">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a href="#" class="social-icon">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a href="#" class="social-icon">
                            <i class="fab fa-google"></i>
                        </a>
                        <a href="#" class="social-icon">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                    </div>
                </form>
            </div>
        </div>
        <div class="panels-container">
            <div class="panel left-panel">
            </div>
            <div class="panel right-panel">
                <div class="content">
                    <h3>Déja inscrit ?</h3>
                    <p>
                        Si vous avez deja un compte veuillez vous identifier.
                    </p>
                    <a href="index.php" class="btn transparent" id="sign-in-btn" style="padding:10px 20px;text-decoration:none">
                        Re-connexion
                                                                                </a>
                </div>
                <!-- <img src="img/register.svg" class="image" alt="" /> -->
            </div>
        </div>
    </div>
    </div>
</body>
</html>
