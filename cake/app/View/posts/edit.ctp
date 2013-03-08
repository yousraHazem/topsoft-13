<h2> Edit Post</h2>


<?php
echo $this->Form->create('Post', array('action'=>'edit'));
echo $this->Form->input('posts');
echo $this->Form->input('id', array('type'=>'hidden'));
echo $this->Form->end('Edit Post');
?>