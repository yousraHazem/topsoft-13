<h1>Add GuestBook </h1>
<?php
echo $this->Form->create();
echo $this->Form->input('name');
echo $this->Form->hidden('user_id', array('value'=>$current_user['id']));
echo $this->Form->end('Save Post');
?>