<?php
class Feedback{
    private $feedback_id;
    private $feedback_content;
    private $feedback_start_date;

    public function __construct($feedback_id, $feedback_content,$feedback_start_date){
        $this->feedback_id = $feedback_id;
        $this->feedback_content = $feedback_content;
        $this->feedback_start_date = $feedback_start_date;
    }
    public function getFeedbackID(){
        return $this->feedback_id;
    }
    public function getFeedbackContent(){
        return $this->feedback_content;
    }
    public function getFeedbackStartDate(){
        return $this->feedback_start_date;
    }
    public function returnFeedbackArray(){
        $feedback = array();
        $feedback['feedback_id'] = $this->feedback_id;
        $feedback['feedback_content'] = $this->feedback_content;
        $feedback['feedback_start_date'] = $this->feedback_start_date;
        return $feedback;
    }
}
?>