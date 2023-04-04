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
    private $address;
    private $gender;
    private $role;
    private $birthday;

    public function __construct($id, $isActive, $name, $email, $password, $address, $phone_number,$gender, $role, $birthday){
        $this->id=$id;
        $this->isActive=$isActive;
        $this->name=$name;
        $this->email=$email;
        $this->password=$password;
        $this->address=$address;
        $this->phone_number=$phone_number;
        $this->gender=$gender;
        $this->role=$role;
        $this->birthday=$birthday;
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

    // public function returnCustomerArray(){
    //     $customer = array();
    //     $customer['id'] = $this->id;
    //     $customer['name'] = $this->name;
    //     $customer['email'] = $this->email;
    //     $customer['password'] = $this->password;
    //     $customer['address'] = $this->address;
    //     $customer['phone_number'] = $this->phone_number;
    //     $customer['gender'] = $this->gender;
    //     $customer['role'] = $this->role;
    //     $customer['feedback_id'] = $this->feedback_id;
    //     return $customer;
    // }
}
?>