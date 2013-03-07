<?php
class GuestsController extends AppController {

	public $helpers = array('Html', 'Form');

	public function index() {
	    $this->set('blog_title', 'index page!');
       $this->set('guests', $this->Guest->find('all'));
       
    }

       public function add() {

         if ($this->request->is('post')) {
            $this->Guest->create();
            if ($this->Guest->save($this->request->data)) {
                $this->Session->setFlash('Your GuestBook has been Successfully added!');
                $this->redirect(array('controller'=>'guests','action' => 'index'));
            } 
            else {
                $this->Session->setFlash('Unable to add your GuestBook.');
            }
        }
       
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