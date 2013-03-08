<h2> Add a Post</h2>

<?php 

echo $this -> Form -> create('Post', array('action'=>'add'));
echo $this -> Form -> input('id');
echo $this -> Form -> input('posts');
echo $this -> Form -> end('Create a post');

?>