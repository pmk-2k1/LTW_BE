<?php
class Voucher{
    private $voucherId;
    private $voucherIsActive;
    private $voucherPercent;
    private $voucherStartDate;
    private $voucherEndDate;

    public function __construct($voucherIsActive, $voucherPercent, $voucherStartDate, $voucherEndDate){
        // $this->voucherId = $voucherId;
        $this->voucherIsActive = $voucherIsActive;
        $this->voucherPercent = $voucherPercent;
        $this->voucherStartDate = $voucherStartDate;
        $this->voucherEndDate = $voucherEndDate;
    }

    public function getVoucherID(){
        return $this->voucherId;
    }
    public function getVoucherIsActive(){
        return $this->voucherIsActive;
    }
    public function getVoucherPercent(){
        return $this->voucherPercent;
    }
    public function getVoucherStartDate(){
        return $this->voucherStartDate;
    }
    public function getVoucherEndDate(){
        return $this->voucherEndDate;
    }

    public function returnVoucherArray(){
        $voucher = array();
        $voucher['voucherId'] = $this->voucherId;
        $voucher['voucherIsActive'] = $this->voucherIsActive;
        $voucher['voucherPercent'] = $this->voucherPercent;
        $voucher['voucherStartDate'] = $this->voucherStartDate;
        $voucher['voucherEndDate'] = $this->voucherEndDate;
        return $voucher;
    }
}
?>