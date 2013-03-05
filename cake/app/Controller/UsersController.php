<?php
class UsersController extends AppController {

public $helpers = array('Html', 'Form');

	public function beforeFilter(){
		parent:: beforeFilter();
		$this->Auth->allow('add');

			}

	function add(){

		if($this->request-> is('post')){

			if($this->User->save($this->request->data)){

				$this->Session->setFlash('Registration successfull!!');
				/*$this->redirect('/guests/guest') ;*/
			}
	else{

		$this->Session->setFlash('Registration was not successfull');
	}
	}
}



}

?>



