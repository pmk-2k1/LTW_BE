<?php

require_once '..\config\database.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: PUT");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type:application/json");


$data = json_decode(file_get_contents("php://input"));
if($data == null){
    echo "{'Error':'Can not get data from UI'}";
    exit;
}

$db = new Database();

$check_id = $db->query("SELECT * FROM news WHERE Id = '$data->newsId'");
$data_id = $check_id->fetch(PDO::FETCH_ASSOC);
if($data_id == false) {
    echo '{"isSuccess": "false", "error": "Can not find user with id: "' .$data->Id. '}';
    exit;
}
try {
    $sql = "UPDATE news SET Status = '$data->newsStatus',  Start_date= '$data->newsStartDate', End_date = '$data->newsEndDate', Content = '$data->newsContent'
        WHERE Id = '$data->newsId'";

    $db->query($sql);
    echo '{"isSuccess": "true", "error": "null"}';
} catch (Exception $e) {
    echo '{"isSuccess": "false", "error": "Can not find user with id: ' .$e->getMessage(). '"}';
}
?>