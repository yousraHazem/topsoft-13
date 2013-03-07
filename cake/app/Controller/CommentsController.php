<?php
class CommentsController extends AppController {

	    public function post($ggid = null) {
      $this->set('blog_title', 'comments page!');
      $this->set('ggid', $ggid);
      
        
        if ($this->request->is('post')) {
           $this->Comment->create();
            if ($this->Comment->save($this->request->data)) {
                $this->Session->setFlash('Your post has been saved.');
                $this->redirect(array('controller'=>'guests','action' => 'index'));
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