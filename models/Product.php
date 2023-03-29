<?php
class Product{
    private $product_id;
    private $product_name;
    private $product_type;
    private $product_price;
    private $product_quantity;
    private $product_description;
    private $feedback_id;
    private $cart_id;
    private $bill_detail_id;

    public function __construct($product_id, $product_name,$product_type, $product_quantity, $product_price, $product_description,$feedback_id,$cart_id, $bill_detail_id){
        $this->product_id = $product_id;
        $this->product_name = $product_name;
        $this->product_type = $product_type;
        $this->product_quantity = $product_quantity;
        $this->product_price = $product_price;
        $this->product_description = $product_description;
        $this->feedback_id = $feedback_id;
        $this->cart_id = $cart_id;
        $this->bill_detail_id = $bill_detail_id;
    }
    public function getProductID(){
        return $this->product_id;
    }
    public function getProductName(){
        return $this->product_name;
    }
    public function getProductType(){
        return $this->product_type;
    }
    public function getProductQuantity(){
        return $this->product_quantity;
    }
    public function getProductPrice(){
        return $this->product_price;
    }
    public function getProductDescription(){
        return $this->product_description;
    }
    public function getFeedbackID(){
        return $this->feedback_id;
    }
    public function getCartID(){
        return $this->cart_id;
    }
    public function getBillDetailID(){
        return $this->bill_detail_id;
    }
    public function returnBillArray(){
        $product = array();
        $product['product_id'] = $this->product_id;
        $product['product_name'] = $this->product_name;
        $product['product_type'] = $this->product_type;
        $product['product_quantity'] = $this->product_quantity;
        $product['product_price'] = $this->product_price;
        $product['product_description'] = $this->product_description;
        $product['feedback_id'] = $this->feedback_id;
        $product['cart_id'] = $this->cart_id;
        $product['bill_detail_id'] = $this->bill_detail_id;
        return $product;
    }
}
?>