<h2>Comment</h2>

 <?php

echo $this->Form->create('Comment', array('controller'=>'comments','action'=>'post'));
echo $this->Form->input('name');
echo $this->Form->input('email');
echo $this->Form->input('comment');
echo $this->Form->hidden('guest_id', array('value'=>$ggid));
echo $this->Form->end('Save Comment');
?>