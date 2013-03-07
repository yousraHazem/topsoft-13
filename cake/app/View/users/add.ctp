<h2> Registration</h2>

<?php

echo $this->Form-> create('User',array('action'=>'add'));
echo $this ->Form-> input('id');
echo $this ->Form-> input('username');
echo $this ->Form-> input('password');
echo $this ->Form-> input('password_confirmation', array('type'=>'password'));
echo $this->Form-> end('Register');

?>