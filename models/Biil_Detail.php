<?php
class BillDetail
{
    private $id;
    private $billID;
    private $productID;
    private $count;
    private $priceItem;
    private $size;
    private $color;
    private $rate;

    public function __construct($id, $billID, $productID, $count, $priceItem, $size, $color, $rate)
    {
        $this->id = $id;
        $this->billID = $billID;
        $this->productID = $productID;
        $this->count = $count;
        $this->priceItem = $priceItem;
        $this->size = $size;
        $this->color = $color;
        $this->rate = $rate;
    }

    public function returnBillArray()
    {
        $bill_detail = array();
        $bill_detail['id'] = $this->id;
        $bill_detail['billID'] = $this->billID;
        $bill_detail['productID'] = $this->productID;
        $bill_detail['count'] = $this->count;
        $bill_detail['priceItem'] = $this->priceItem;
        $bill_detail['size'] = $this->size;
        $bill_detail['color'] = $this->color;
        $bill_detail['rate'] = $this->rate;
        return $bill_detail;
    }
}
?>