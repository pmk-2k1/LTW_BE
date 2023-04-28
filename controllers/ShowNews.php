<?php
require_once '..\config\database.php';

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: Content-Type');

class NewsAPI {
    function Show() {
        $db = new Database();
        $sql = "SELECT * FROM news";
        $data = $db->query($sql);
        return json_encode($data->fetchall(PDO::FETCH_ASSOC));
    }
}
$news = new NewsAPI();
header('Content-Type: application/json');
$temp = $news->Show();
echo $temp;
?>