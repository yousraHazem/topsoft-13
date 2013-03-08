<?php
class PostsController extends AppController {

	public $helpers = array('Html', 'Form');

	function index(){

		$this ->set ('posts', $this -> Post -> find('all'));
	}

	function view ($id = null){

		$this -> Post -> read(Null, $id);
		$this -> set ('post', $this -> Post -> read(Null, $id));
	}

	function add (){

		if ($this -> request -> is('post')){

			if ($this->Post-> save(($this -> request -> data))) {

				$this->Session-> setFlash('the post was sucessfully added');

				$this->redirect(array('action' => 'index'));
			}

			else{

				$this -> Session -> setFlash(' the post was not saved');

			}
		}
	}

	function edit ($id = NULL){

		if (empty ($this-> request->data)){

			$this-> request -> data = $this ->Post-> read(NULL, $id);

			
}
		else{
    
		if($this->Post-> save($this->request->data)){

				$this-> Session -> setFlash('Data updated');
				$this-> redirect(array('action'=>'view', $id));

			}
			}
		}

		function delete($id = NULL){

			$this ->Post -> delete($id);
			$this -> Session -> setFlash('the post deleted');
			$this -> redirect (array('action'=> 'index'));

		}
			
		}

?>