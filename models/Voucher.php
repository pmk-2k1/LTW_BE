<?php
class Voucher{
    private $voucher_id;
    private $voucher_endow;
    private $voucher_active;
    private $voucher_start_date;
    private $voucher_end_date;

    public function __construct($voucher_id, $voucher_endow, $voucher_active, $voucher_start_date, $voucher_end_date){
        $this->voucher_id = $voucher_id;
        $this->voucher_endow = $voucher_endow;
        $this->voucher_active = $voucher_active;
        $this->voucher_start_date = $voucher_start_date;
        $this->voucher_end_date = $voucher_end_date;
    }

    public function getVoucherID(){
        return $this->voucher_id;
    }
    public function getVoucherEndow(){
        return $this->voucher_endow;
    }
    public function getVoucherActive(){
        return $this->voucher_active;
    }
    public function getVoucherStartDate(){
        return $this->voucher_start_date;
    }
    public function getVoucherEndDate(){
        return $this->voucher_end_date;
    }

    public function returnVoucherArray(){
        $voucher = array();
        $voucher['voucher_id'] = $this->voucher_id;
        $voucher['voucher_endow'] = $this->voucher_endow;
        $voucher['voucher_active'] = $this->voucher_active;
        $voucher['voucher_start_date'] = $this->voucher_start_date;
        $voucher['voucher_end_date'] = $this->voucher_end_date;
        return $voucher;
    }
}
?>