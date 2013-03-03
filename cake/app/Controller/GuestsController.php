<?php
class GuestsController extends AppController {

	public $helpers = array('Html', 'Form');

function index($id = NULL){

		$user = $this->Guest->read(Null, $id);
		$this->set('users',$user);
	}

}
