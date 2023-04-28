<?php
class Product
{
    private $productId;
    private $productIsActive;
    private $productName;
    private $productType;
    private $productPrice;
    private $productQuantity;
    private $productDescription;
    private $material;
    private $style;
    private $album;
    private $model;
    private $connect;

    public function __construct(
        $productId,
        $productIsActive,
        $productName,
        $productType,
        $productPrice,
        $productQuantity,
        $productDescription,
        $material,
        $style,
        $album,
        $model,
        $connect
    ) {
        $this->productId = $productId;
        $this->productIsActive = $productIsActive;
        $this->productName = $productName;
        $this->productType = $productType;
        $this->productPrice = $productPrice;
        $this->productQuantity = $productQuantity;
        $this->productDescription = $productDescription;
        $this->material = $material;
        $this->style = $style;
        $this->album = $album;
        $this->model = $model;
        $this->connect = $connect;
    }

    public function getProductID()
    {
        return $this->productId;
    }
    public function getProductIsActive()
    {
        return $this->productIsActive;
    }
    public function getProductName()
    {
        return $this->productName;
    }
    public function getProductType()
    {
        return $this->productType;
    }
    public function getProductPrice()
    {
        return $this->productPrice;
    }
    public function getProductQuantity()
    {
        return $this->productQuantity;
    }
    public function getProductDescription()
    {
        return $this->productDescription;
    }

    public function getMaterial()
    {
        return $this->material;
    }

    public function getStyle()
    {
        return $this->style;
    }

    public function getAlbum()
    {
        return $this->album;
    }

    public function getModel()
    {
        return $this->model;
    }

    public function getConnect()
    {
        return $this->connect;
    }

    public function returnProductArray()
    {
        $product = array();
        $product['productId'] = $this->productId;
        $product['productIsActive'] = $this->productIsActive;
        $product['productName'] = $this->productName;
        $product['productType'] = $this->productType;
        $product['productPrice'] = $this->productPrice;
        $product['productQuantity'] = $this->productQuantity;
        $product['productDescription'] = $this->productDescription;
        $product['material'] = $this->material;
        $product['style'] = $this->style;
        $product['album'] = $this->album;
        $product['model'] = $this->model;
        $product['connect'] = $this->connect;
        return $product;
    }
}
?>