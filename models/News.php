<?php
class News{
    private $newsId;
    private $newsStatus;
    private $newsStartDate;
    private $newsEndDate;
    private $newsContent;

    public function __construct($newsStatus,$newsStartDate, $newsEndDate, $newsContent){
        $this->newsStatus = $newsStatus;
        $this->newsStartDate = $newsStartDate;
        $this->newsEndDate = $newsEndDate;
        $this->newsContent = $newsContent;
    }

    public function getNewsID(){
        return $this->newsId;
    }
    public function getNewsStatus(){
        return $this->newsStatus;
    }
    public function getNewsStartDate(){
        return $this->newsStartDate;
    }
    public function getNewsEndDate(){
        return $this->newsEndDate;
    }
    public function getNewsContent(){
        return $this->newsContent;
    }

    public function returnNewsArray(){
        $news = array();
        $news['newsId'] = $this->newsId;
        $news['newsStatus'] = $this->newsStatus;
        $news['newsStartDate'] = $this->newsStartDate;
        $news['newsEndDate'] = $this->newsEndDate;
        $news['newsContent'] = $this->newsContent;
        return $news;
    }
}
?>