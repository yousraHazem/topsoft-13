<?php
class UsersController extends AppController {

public $helpers = array('Html', 'Form');

	public function beforeFilter(){
		parent::beforeFilter();
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

      public function login() {
	    if ($this->request->is('post')) {
	        if ($this->Auth->login()) {    
	            $this->redirect($this->Auth->redirect()); 
	        } else {

	            $this->Session->setFlash('Your username/password combination was incorrect');
	        }
	    }
	

       
    }

    public function logout(){
    	$this->redirect($this->Auth->logout());
    }


    public function view($id = null) {
    	$this->User->id = $id;
    	if (! $this->User->exists()) {
    		echo 'Not found'; die;
    	}
    	print_r($this->User->read(null, $id));
        $this->set('user', $this->User->read(null, $id));
    }


}

?>



