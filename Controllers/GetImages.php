<?php
require_once '..\config\database.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header('Content-Type: image/jpeg');

function GetImages($productID)
{
    $db = new Database();
    $sql = "SELECT `Content` FROM image WHERE ProductID = '" . $productID . "'";
    
    try {
        $database = $db->query($sql);
        $image = $database->fetchAll(PDO::FETCH_ASSOC);
    
        if ($image == true) {
            echo json_encode($image);
        }
    } catch (Exception $e) {
        return null;
    }
    return null;
}

GetImages("001cd400-b52a-46b2-8993-050639d5f7c4");
?>