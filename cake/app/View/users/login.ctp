<h2>LOG IN </h2>

<?php
echo $this->Form->create('User', array('controller'=>'users','action'=>'login'));
echo $this->Form->input('username');
echo $this->Form->input('password');
echo $this->Form->end('Login');
?>
