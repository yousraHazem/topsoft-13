<?php
class CommentsController extends AppController {

	    public function post($gid = null) {
      $this->set('blog_title', 'comments page!');
      $this->set('name', $gid);
      
        
        if ($this->request->is('post')) {
           // $this->Post->create();
            if ($this->Comment->save($this->request->data)) {
                $this->Session->setFlash('Your post has been saved.');
                $this->redirect(array('controller'=>'Guest','action' => 'index'));
            } 
            else {
                $this->Session->setFlash('Unable to add your post.');
            }
        }
       
    }

    public function view($gid = null) { 

      $comment = $this->Comment->find('all', array('conditions'=>array('Comment.guest_id'=>$gid)));
      $this->set('comments', $comment);
    }


    
}