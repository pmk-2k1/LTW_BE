<?php
// require_once '..\config\database.php';
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: Content-Type');

$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';

// validate the email and password
// if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
//     echo 'Invalid email address';
//     exit;
// }
// if (strlen($password) < 8) {
//     echo 'Password must be at least 8 characters';
//     exit;
// }

// class Login {
//     function Test() {
//         $db = new Database();
//         $sql = "SELECT * FROM customer";
//         $data = $db->query($sql);
//         // var_dump($data->fetchall(PDO::FETCH_ASSOC));
//         return json_encode($data->fetchall(PDO::FETCH_ASSOC));
//     }
// }

// $api = new Login();
header('Content-Type: application/json');
// $temp = $api->Test();
// var_dump(json_decode($temp));
var_dump($_POST);
echo "Login success";
?>