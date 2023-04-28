<?php
require_once '..\config\database.php';
require_once '..\Common\Utils\helper.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type: application/json");

$data = json_decode(file_get_contents("php://input"));
if ($data == null) {
    echo '{"isSuccess": false, "message": "Can not get data from UI"}';
    exit;
}

$db = new Database();

try {
    $datetime = new DateTime('now', new DateTimeZone('UTC'));

    $query = "SELECT * FROM customer WHERE Id = '" . $data->customerID . "'";
    $customerCheck = $db->query($query);

    if (count($customerCheck->fetchAll(PDO::FETCH_ASSOC)) == 0) {
        echo '{"isSuccess": false, "message": "Người dùng không tồn tại"}';
        exit;
    }

    $billID = generate_uuid();
    while (true) {
        $queryCheckBill = $db->query("SELECT * FROM bill WHERE Id = '" . $billID . "'");
        if ($queryCheckBill->fetchAll(PDO::FETCH_ASSOC) == false)
            break;
        $billID = generate_uuid();
    }

    $total = 0;
    if (count($data->product) == 0) {
        $queryBillDetail = $db->query("INSERT INTO bill(Id, Status, Total, Time, Pay_method, Note, CustomerID)
        VALUES ('" . $billID . "', 1,'" . $total . "','" . $datetime->format('Y-m-d H:i:s') . "','" . $data->method . "','" . $data->note . "','" . $data->customerID . "')");
    } else {
        $queryBillDetail = "INSERT INTO bill_detail(Id, BillID, ProductID, Count, Price_item, Size, Color, Rate) VALUES";
        $values = array();
        foreach ($data->product as $item) {
            $queryPrice = $db->query("SELECT Price FROM product WHERE Id = '" . $item->id . "'");
            $price = $queryPrice->fetch(PDO::FETCH_ASSOC);
            $total += $item->count * $price['Price'];
            $values[] = "(?, ?, ?, ?, ?, ?, ?, ?)";
        }
        $queryBillDetail .= implode(", ", $values);

        $stmt = $db->prepare($queryBillDetail);
        
        $i = 1;
        foreach ($data->product as $item) {
            $queryPrice = $db->query("SELECT Price FROM product WHERE Id = '" . $item->id . "'");
            $price = $queryPrice->fetch(PDO::FETCH_ASSOC);
            $stmt->bindValue($i++, generate_uuid());
            $stmt->bindValue($i++, $billID);
            $stmt->bindValue($i++, $item->id);
            $stmt->bindValue($i++, $item->count);
            $stmt->bindValue($i++, $price['Price']);
            $stmt->bindValue($i++, $item->size);
            $stmt->bindValue($i++, $item->color);
            $stmt->bindValue($i++, $item->rate);
        }

        $query = $db->query("INSERT INTO bill(Id, Status, Total, Time, Pay_method, Note, CustomerID)
        VALUES ('" . $billID . "', 1,'" . $total . "','" . $datetime->format('Y-m-d H:i:s') . "','" . $data->method . "','" . $data->note . "','" . $data->customerID . "')");

        $stmt->execute();
    }

    echo '{"isSuccess": true, "message": "Tạo hóa đơn thành công"}';
} catch (Exception $e) {
    echo '{"isSuccess": false , "message": "Error SQL: ' . $e->getMessage() . '"}';
}