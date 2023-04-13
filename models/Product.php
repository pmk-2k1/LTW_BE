<?php
class Product{
    private $productId;
    private $productIsActive;
    private $productName;
    private $productType;
    private $productPrice;
    private $productQuantity;
    private $productDescription;


    public function __construct( $productIsActive,$productName,$productType, $productPrice, $productQuantity, $productDescription){
        $this->productIsActive = $productIsActive;
        $this->productName = $productName;
        $this->productType = $productType;
        $this->productPrice = $productPrice;
        $this->productQuantity = $productQuantity;
        $this->productDescription = $productDescription;

    }
    public function getProductID(){
        return $this->productId;
    }
    public function getProductIsActive(){
        return $this->productIsActive;
    }
    public function getProductName(){
        return $this->productName;
    }
    public function getProductType(){
        return $this->productType;
    }
    public function getProductPrice(){
        return $this->productPrice;
    }
    public function getProductQuantity(){
        return $this->productQuantity;
    }
    public function getProductDescription(){
        return $this->productDescription;
    }

    public function returnProductArray(){
        $product = array();
        $product['productId'] = $this->productId;
        $product['productIsActive'] = $this->productIsActive;
        $product['productName'] = $this->productName;
        $product['productType'] = $this->productType;
        $product['productPrice'] = $this->productPrice;
        $product['productQuantity'] = $this->productQuantity;
        $product['productDescription'] = $this->productDescription;
        return $product;
    }
}
?>