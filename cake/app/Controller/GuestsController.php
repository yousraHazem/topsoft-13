<?php
class GuestsController extends AppController {

	public $helpers = array('Html', 'Form');



function index(){
	

	$name =$this-> params['url'];

	$this-> set('guests',$this ->Guest-> find('all', array('conditions'=> array('Guest.name'=>$name))));

	}

function guest($id = NULL){

	
	$this-> set('guests',$this ->Guest-> find('all', array('conditions'=> array('Guest.user_id'=>$id))));
}

}
?>