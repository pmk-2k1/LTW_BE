<?php

class CustomerException extends Exception
{
}
class Customer
{
    private $id;
    private $isActive;
    private $name;
    private $phoneNumber;
    private $email;
    private $password;
    private $gender;
    private $role;
    private $address;
    private $birthday;

    public function __construct($name, $phoneNumber, $password, $address)
    {
        $this->isActive = 1;
        $this->name = $name;
        $this->phoneNumber = $phoneNumber;
        $this->email = "";
        $this->password = $password;
        $this->address = $address;
        $this->gender = "male";
        $this->role = "customer";
        $this->birthday = null;
    }

    public function getID()
    {
        return $this->id;
    }
    public function getIsActive()
    {
        return $this->isActive;
    }
    public function getName()
    {
        return $this->name;
    }
    public function getPhoneNumber()
    {
        return $this->phoneNumber;
    }
    public function getEmail()
    {
        return $this->email;
    }
    public function getPassword()
    {
        return $this->password;
    }
    public function getGender()
    {
        return $this->gender;
    }
    public function getRole()
    {
        return $this->role;
    }
    public function getAddress()
    {
        return $this->address;
    }
    public function getBirthday()
    {
        return $this->birthday;
    }

    public function returnCustomerArray()
    {
        $customer = array();
        $customer['id'] = $this->id;
        $customer['isActive'] = $this->isActive;
        $customer['name'] = $this->name;
        $customer['phoneNumber'] = $this->phoneNumber;
        $customer['email'] = $this->email;
        $customer['password'] = $this->password;
        $customer['gender'] = $this->gender;
        $customer['role'] = $this->role;
        $customer['address'] = $this->address;
        $customer['birthday'] = $this->birthday;
        return $customer;
    }
}
?>