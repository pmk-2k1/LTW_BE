<?php
class Bill{
    private $bill_id;
    private $bill_status;
    private $note;
    private $date;
    private $pay_method;
    private $total;
    private $bill_detail_id;

    public function __construct($bill_id, $bill_status,$note, $date, $pay_method, $total, $bill_detail_id){
        $this->bill_id = $bill_id;
        $this->bill_status = $bill_status;
        $this->note = $note;
        $this->date = $date;
        $this->pay_method = $pay_method;
        $this->total = $total;
        $this->bill_detail_id = $bill_detail_id;
    }
    public function getBillID(){
        return $this->bill_id;
    }
    public function getBillSatus(){
        return $this->bill_status;
    }
    public function getNote(){
        return $this->note;
    }
    public function getDate(){
        return $this->date;
    }
    public function getPayMethod(){
        return $this->pay_method;
    }
    public function getTotal(){
        return $this->total;
    }
    public function getBillDetailID(){
        return $this->bill_detail_id;
    }
    public function returnBillArray(){
        $bill = array();
        $bill['bill_id'] = $this->bill_id;
        $bill['bill_status'] = $this->bill_status;
        $bill['note'] = $this->note;
        $bill['date'] = $this->date;
        $bill['pay_method'] = $this->pay_method;
        $bill['total'] = $this->total;
        $bill['bill_detail_id'] = $this->bill_detail_id;
        return $bill;
    }
}
?>