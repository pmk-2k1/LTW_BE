<?php
class Bill
{
    private $id;
    private $status;
    private $total;
    private $time;
    private $pay_method;
    private $note;
    private $customerID;

    public function __construct($id, $status, $total, $time, $pay_method, $note, $customerID)
    {
        $this->id = $id;
        $this->status = $status;
        $this->total = $total;
        $this->time = $time;
        $this->pay_method = $pay_method;
        $this->note = $note;
        $this->customerID = $customerID;
    }
    public function getBillID()
    {
        return $this->id;
    }
    public function getBillSatus()
    {
        return $this->status;
    }
    public function getNote()
    {
        return $this->note;
    }
    public function getDate()
    {
        return $this->time;
    }
    public function getPayMethod()
    {
        return $this->pay_method;
    }
    public function getTotal()
    {
        return $this->total;
    }
    public function getBillDetailID()
    {
        return $this->customerID;
    }
    public function returnBillArray()
    {
        $bill = array();
        $bill['id'] = $this->id;
        $bill['status'] = $this->status;
        $bill['total'] = $this->total;
        $bill['time'] = $this->time;
        $bill['pay_method'] = $this->pay_method;
        $bill['note'] = $this->note;
        $bill['customerID'] = $this->customerID;
        return $bill;
    }
}
?>