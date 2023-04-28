<?php
class Database extends PDO
{
    private $host = 'localhost';
    private $user = 'root';
    private $password = '';
    private $database = 'clothing_store';

    public function __construct()
    {
        try {
            $dsn = "mysql:host=$this->host;dbname=$this->database;charset=UTF8";
            parent::__construct($dsn, $this->user, $this->password,
            array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));

            $this->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
        } catch (PDOException $e) {
            echo "Fail connect to db: " . $e->getMessage();
        }
    }
}

