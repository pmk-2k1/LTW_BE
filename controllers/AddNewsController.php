<?php
require_once '..\config\database.php';
require_once '..\models\News.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type:application/json");

$data = json_decode(file_get_contents("php://input"));
if($data == null){
    echo "{'Error':'Can not get data from UI'}";
    exit;
}

$news = new News($data->newsStatus, $data->newsStartDate, $data->newsEndDate, $data->newsContent);
$newsData = $news->returnNewsArray();
$db = new Database();
function getGUID(){
    if (function_exists('com_create_guid')){
        return trim(com_create_guid(), '{}');
    }else{
        mt_srand((double)microtime()*10000);
        $charid = strtoupper(md5(uniqid(rand(), true)));
        $hyphen = chr(45);
        $uuid = substr($charid, 0, 8).$hyphen
            .substr($charid, 8, 4).$hyphen
            .substr($charid,12, 4).$hyphen
            .substr($charid,16, 4).$hyphen
            .substr($charid,20,12);
        return $uuid;
    }
}

while (true)
{
    $GUID = getGUID();
    $query = "SELECT * FROM news WHERE Id = '$GUID'";
    $newsCheck = $db->query($query);
    if ($newsCheck != false)
        break;
}

$newsData['newsId'] = $GUID;

try {
    $db->query("INSERT INTO news(Id, Status, Start_date, End_date, Content)
    VALUES ('".$newsData['newsId']."','".$newsData['newsStatus']."','".$newsData['newsStartDate']."','".$newsData['newsEndDate']."','".$newsData['newsContent']."')");
    echo json_encode($newsData);
} catch (Exception $e) {
    echo 'Error with: ' .$e->getMessage();
}

?>