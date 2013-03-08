<h1>Edit Guestbook Name</h1>
<?php
echo $this->Form->create('Guest');
echo $this->Form->input('name');
echo $this->Form->input('id', array('type' => 'hidden'));
echo $this->Form->input('user_id', array('type' => 'hidden'));
echo $this->Form->end('Save Name');
