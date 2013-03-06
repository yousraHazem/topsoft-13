<?php
class GuestsController extends AppController {

	public $helpers = array('Html', 'Form');

		    public function index() {
	    $this->set('blog_title', 'index page!');
       $this->set('guests', $this->Guest->find('all'));
       
    }

       public function add() {
      //  $this->set('posts', $this->Guest->find('all'));
       // $this->set('blog_title', 'index page!');
       
    }



function search(){
	

	$name =$this-> params['url'];

	$this-> set('guests',$this ->Guest-> find('all', array('conditions'=> array('Guest.name'=>$name))));

	}

function guest($id = NULL){

	
	$this-> set('guests',$this ->Guest-> find('all', array('conditions'=> array('Guest.user_id'=>$id))));
}

}
?>