<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/animations.css">  
    <link rel="stylesheet" href="css/main.css">  
    <link rel="stylesheet" href="css/signup.css">
        
    <title>Create Account</title>
    <style>
        .container{
            animation: transitionIn-X 0.5s;
        }
    </style>
</head>
<body>
<?php

//learn from w3schools.com
//Unset all the server side variables

session_start();

$_SESSION["user"]="";
$_SESSION["usertype"]="";

// Set the new timezone
date_default_timezone_set('Africa/Johannesburg');
$date = date('Y-m-d');

$_SESSION["date"]=$date;


//import database
include("connection.php");





if($_POST){

    $result= $database->query("select * from user_form");

    $fname=$_SESSION['personal']['fname'];
    $lname=$_SESSION['personal']['lname'];
    $name=$fname." ".$lname;
    //$address=$_SESSION['personal']['address'];
    //$nic=$_SESSION['personal']['nic'];
    $dob=$_SESSION['personal']['dob'];
    $email=$_POST['newemail'];
    $tele=$_POST['tele'];
    $newpassword=$_POST['newpassword'];
    $cpassword=$_POST['cpassword'];
    
    if ($newpassword==$cpassword){
        $result= $database->query("select * from user_form where email='$email';");
        if($result->num_rows==1){
            $error='<label for="promter" class="form-label" style="color:rgb(255, 62, 62);text-align:center;">Already have an account for this Email address.</label>';
        }else{
            
            $database->query("insert into patient(cemail,cname,cpassword,cptel) values('$email','$name','$newpassword','$address','$dob','$tele');");
            $database->query("insert into webuser values('$email','c')");

            //print_r("insert into patient values($pid,'$email','$fname','$lname','$newpassword','$address','$nic','$dob','$tele');");
            $_SESSION["user"]=$email;
            $_SESSION["usertype"]="c";
            $_SESSION["username"]=$fname;

            header('Location: member/index.php');
            $error='<label for="promter" class="form-label" style="color:rgb(255, 62, 62);text-align:center;"></label>';
        }
        
    }else{
        $error='<label for="promter" class="form-label" style="color:rgb(255, 62, 62);text-align:center;">Password Conformation Error! Reconform Password</label>';
    }



    
}else{
    //header('location: signup.php');
    $error='<label for="promter" class="form-label"></label>';
}

?>


    <center>
    <div class="container">
        <table border="0" style="width: 69%;">
            <tr>
                <td colspan="2">
                    <p class="header-text">Let's Get Started</p>
                    <p class="sub-text"> Create User Account.</p>
                </td>
            </tr>
            <tr>
                <form action="" method="POST" >
                <td class="label-td" colspan="2">
                    <label for="newemail" class="form-label">Email: </label>
                </td>
            </tr>
            <tr>
                <td class="label-td" colspan="2">
                    <input type="email" name="newemail" class="input-text" placeholder="Email Address" required>
                </td>
                
            </tr>
            <tr>
                <td class="label-td" colspan="2">
                    <label for="tele" class="form-label">Phone Number: </label>
                </td>
            </tr>
            <tr>
                <td class="label-td" colspan="2">
                    <input type="tel" name="tele" class="input-text"  placeholder="" pattern="[0]{1}[0-9]{9}" >
                </td>
            </tr>
            <td class="label-td" colspan="2">
                    <label for="address" class="form-label">certified copy of address</label>
                </td>
            </tr>
            <tr>
                <td class="label-td" colspan="2">
                    <input type="file" name="filename" required>
                    <button type="submit">upload</button> <br><br><br>  
                </td>
            </tr>
            <tr>
                <td class="label-td" colspan="2">
                    <label for="address" class="form-label">COPY OF CERTIFICATE (A clear copy of your certificate of the service you are
                        providing or an affidavit from a police station will need to be submitted if you do not
                        have a copy of your certificate. The affidavit needs to state that you have been providing
                        this service to the public, include the number of years that you have been practicing.
                        Reference letters from clients will be beneficial in the approval process, although not
                        compulsory.)</label><br><br><br>
                </td>
            </tr>
            <tr>
                <td class="label-td" colspan="2">
                    <input type="file" name="filename" required>
                    <button type="submit" name="SubmitSignup">upload</button> <br><br><br>  
                </td>
            </tr>
            <tr>
                <td class="label-td" colspan="2">
                    <label for="address" class="form-label">2 x ID PHOTOS (A clear photo showing you holding your ID Card with pic of back and
                        front of the card. Passport pics can be submitted if you are not a South African citizen.) </label>
                </td>
            </tr>
            <tr>
                <td class="label-td" colspan="2">
                    
                    <input type="file" name="filename" required>
                    <button type="submit">upload</button>
                    <input type="file" name="filename" required>
                    <button type="submit">upload</button>
                </td>
            </tr>
            <tr>
                <td class="label-td" colspan="2">
                    <label for="newpassword" class="form-label">Create New Password: </label>
                </td>
            </tr>
            <tr>
                <td class="label-td" colspan="2">
                    <input type="password" name="newpassword" class="input-text" placeholder="New Password" required>
                </td>
            </tr>
            <tr>
                <td class="label-td" colspan="2">
                    <label for="cpassword" class="form-label">Confirm Password: </label>
                </td>
            </tr>
            <tr>
                <td class="label-td" colspan="2">
                    <input type="password" name="cpassword" class="input-text" placeholder="Confirm Password" required>
                </td>
            </tr>
     
            <tr>
                
                <td colspan="2">
                    <?php echo $error ?>

                </td>
            </tr>
            
            <tr>
                <td>
                    <input type="reset" value="Reset" class="login-btn btn-primary-soft btn" >
                </td>
                <td>
                    <input type="submit" value="Sign Up" class="login-btn btn-primary btn">
                </td>

            </tr>
            <tr>
                <!--<td colspan="2">
                    <br>
                    <label for="" class="sub-text" style="font-weight: 280;">Already have an account&#63; </label>
                    <a href="login.php" class="hover-link1 non-style-link">Login</a>
                    <br><br><br>
                </td>-->
            </tr>

                    </form>
            </tr>
        </table>

    </div>
</center>
</body>
</html>