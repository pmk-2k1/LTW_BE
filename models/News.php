<?php
class News{
    private $news_id;
    private $news_content;
    private $news_status;
    private $news_start_date;
    private $news_end_date;

    public function __construct($news_id, $news_content,$news_status, $news_start_date, $news_end_date){
        $this->news_id = $news_id;
        $this->news_content = $news_content;
        $this->news_status = $news_status;
        $this->news_start_date = $news_start_date;
        $this->news_end_date = $news_end_date;
    }

    public function getNewsID(){
        return $this->news_id;
    }
    public function getNewsContent(){
        return $this->news_content;
    }
    public function getNewsStatus(){
        return $this->news_status;
    }
    public function getNewsStartDate(){
        return $this->news_start_date;
    }
    public function getNewsEndDate(){
        return $this->news_end_date;
    }

    public function returnNewsArray(){
        $news = array();
        $news['news_id'] = $this->news_id;
        $news['news_content'] = $this->news_content;
        $news['news_status'] = $this->news_status;
        $news['news_start_date'] = $this->news_start_date;
        $news['news_end_date'] = $this->news_end_date;
        return $news;
    }
}
?>