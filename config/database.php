<?php
class Database extends PDO
{
    private $host = 'bnqnkt6zizg4yarlnt9r-mysql.services.clever-cloud.com';
    private $user = 'uyvga3n9ho45vzhj';
    private $password = 'sXepIYJUpIVyMROi02Yo';
    private $database = 'bnqnkt6zizg4yarlnt9r';

    public function __construct()
    {
        try {
            $dsn = "mysql:host=$this->host;port=3306;dbname=$this->database;charset=UTF8";
            parent::__construct($dsn, $this->user, $this->password,
            array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));

            $this->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
        } catch (PDOException $e) {
            echo "Fail connect to db: " . $e->getMessage();
        }
    }
}

