<?php

class CustomerException extends Exception
{
}
class Customer{
    private $id;
    private $isActive;
    private $name;
    private $phone_number;
    private $email;
    private $password;
    private $gender;
    private $role;
    private $address;
    private $birthday;

    public function __construct( $name, $phone_number, $password, $address){
        // $this->isActive=$isActive;
        $this->name=$name;
        $this->phone_number=$phone_number;
        // $this->email=$email;
        $this->password=$password;
        $this->address=$address;
        // $this->gender=$gender;
        // $this->role=$role;
        // $this->birthday=$birthday;
    }

    public function getID(){
        return $this->id;
    }
    public function getIsActive(){
        return $this->isActive;
    }
    public function getName(){
        return $this->name;
    }
    public function getPhoneNumber(){
        return $this->phone_number;
    }
    public function getEmail(){
        return $this->email;
    }
    public function getPassword(){
        return $this->password;
    }
    public function getGender(){
        return $this->gender;
    }
    public function getRole(){
        return $this->role;
    }
    public function getAddress(){
        return $this->address;
    }
    public function getBirthday(){
        return $this->birthday;
    }

    public function returnCustomerArray(){
        $customer = array();
        // $customer['id'] = $this->id;
        // $customer['is_active'] = $this->isActive;
        $customer['name'] = $this->name;
        $customer['phone_number'] = $this->phone_number;
        // $customer['email'] = $this->email;
        $customer['password'] = $this->password;
        // $customer['gender'] = $this->gender;
        // $customer['role'] = $this->role;
        $customer['address'] = $this->address;
        // $customer['birthday'] = $this->birthday;
        return $customer;
    }
}
?>