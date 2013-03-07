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

public function delete($id) {
if ($this->request->is('get')) {
throw new MethodNotAllowedException();
}
if ($this->Guest->delete($id)) {
$this->Session->setFlash('The Guestbook ' . $id . '  has been deleted.');
$this->redirect(array('action' => 'index'));
}
}
public function edit($id = null) {
if (!$id) {
throw new NotFoundException(__('Invalid post'));
}
$guest = $this->Guest->findById($id);
if (!$guest) {
throw new NotFoundException(__('Invalid post'));
}
if ($this->request->is('post') || $this->request->is('put')) {
$this->Guest->id = $id;
if ($this->Guest->save($this->request->data)) {
$this->Session->setFlash('Your Guestbook has been updated.');
$this->redirect(array('action' => 'index'));
} else {
$this->Session->setFlash('Unable to update your post.');
}
}
if (!$this->request->data) {
$this->request->data = $guest;
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