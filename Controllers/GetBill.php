<?php
require_once '..\config\database.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type: application/json");

$data = json_decode(file_get_contents("php://input"));

if ($data == null) {
    echo '{"isSuccess": false, "message": "Can not get data from UI"}';
    exit;
}

$db = new Database();
try {
    $query = "SELECT * FROM customer WHERE Id = '" . $data->customerID . "'";
    $customerCheck = $db->query($query);

    if (count($customerCheck->fetchAll(PDO::FETCH_ASSOC)) == 0) {
        echo '{"isSuccess": false, "message": "Người dùng không tồn tại"}';
        exit;
    }

    $database = $db->query("SELECT Id, Status, Total, Time, Pay_method, Note FROM bill WHERE CustomerID = '" . $data->customerID . "' ORDER BY Time DESC");
    $bills = $database->fetchAll(PDO::FETCH_ASSOC);

    if ($bills == true) {
        for ($i = 0; $i < count($bills); $i++) {
            $detail = $db->query("SELECT p.Name, p.Type, b.Count, b.Price_item, b.Size, b.Color, b.Rate
                                FROM bill_detail AS b, product AS p
                                WHERE b.ProductID = p.Id AND b.BillID = '" . $bills[$i]['Id'] . "'");
            $bills[$i]['details'] = $detail->fetchAll(PDO::FETCH_ASSOC);
        }
        echo '{"isSuccess": true, "message": "Thành công", "data": ' . json_encode($bills) . '}';
    } else {
        echo '{"isSuccess": false, "message": "Chưa có đơn hàng"}';
    }
} catch (Exception $e) {
    echo '{"isSuccess": false, "message": "Error SQL: ' . $e->getMessage() . '"}';
}
?>