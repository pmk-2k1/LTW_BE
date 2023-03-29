<?php
class BillDetail{
    private $bill_detail_id;
    private $bill_detail_count;
    private $price_item;


    public function __construct($bill_detail_id, $bill_detail_count,$price_item){
        $this->bill_detail_id = $bill_detail_id;
        $this->bill_detail_count = $bill_detail_count;
        $this->price_item = $price_item;
    }
    public function getBillDetailID(){
        return $this->bill_detail_id;
    }
    public function getBillDetailCount(){
        return $this->bill_detail_count;
    }
    public function getPriceItem(){
        return $this->price_item;
    }
    public function returnBillArray(){
        $bill_detail = array();
        $bill_detail['bill_detail_id'] = $this->bill_detail_id;
        $bill_detail['bill_detail_count'] = $this->bill_detail_count;
        $bill_detail['price_item'] = $this->price_item;
        return $bill_detail;
    }
}
?>