<?php
class Cart{
    private $cart_id;
    private $cart_count;
    

    public function __construct($cart_id, $cart_count){
        $this->cart_id = $cart_id;
        $this->cart_count = $cart_count;
    }
    public function getCartID(){
        return $this->cart_id;
    }
    public function getCartCount(){
        return $this->cart_count;
    }
    public function returnCartArray(){
        $cart = array();
        $cart['cart_id'] = $this->cart_id;
        $cart['cart_count'] = $this->cart_count;
        return $cart;
    }
}
?>