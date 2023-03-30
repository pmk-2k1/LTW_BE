<?php

class CustomerException extends Exception
{
}
class Customer{
    private $id;
    private $name;
    private $email;
    private $password;
    private $address;
    private $phone_number;
    private $gender;
    private $role;
    private $feedback_id;
    private $bill_id;
    private $cart_id;

    public function __construct($id, $name, $email, $password, $address, $phone_number,$gender, $role, $feedback_id, $bill_id, $cart_id){
        $this->id=$id;
        $this->name=$name;
        $this->email=$email;
        $this->password=$password;
        $this->address=$address;
        $this->phone_number=$phone_number;
        $this->gender=$gender;
        $this->role=$role;
        $this->feedback_id=$feedback_id;
        $this->bill_id=$bill_id;
        $this->cart_id=$cart_id;
    }

    public function getID(){
        return $this->id;
    }
    public function getName(){
        return $this->name;
    }
    public function getEmail(){
        return $this->email;
    }
    public function getPassword(){
        return $this->password;
    }
    public function getAddress(){
        return $this->address;
    }
    public function getPhoneNumber(){
        return $this->phone_number;
    }
    public function getGender(){
        return $this->gender;
    }
    public function getRole(){
        return $this->role;
    }
    public function getFeedbackID(){
        return $this->feedback_id;
    }
    public function getBillID(){
        return $this->bill_id;
    }
    public function getCartID(){
        return $this->cart_id;
    }

    public function returnCustomerArray(){
        $customer = array();
        $customer['id'] = $this->id;
        $customer['name'] = $this->name;
        $customer['email'] = $this->email;
        $customer['password'] = $this->password;
        $customer['address'] = $this->address;
        $customer['phone_number'] = $this->phone_number;
        $customer['gender'] = $this->gender;
        $customer['role'] = $this->role;
        $customer['feedback_id'] = $this->feedback_id;
        $customer['bill_id'] = $this->bill_id;
        $customer['cart_id'] = $this->cart_id;
        return $customer;
    }
}
?>