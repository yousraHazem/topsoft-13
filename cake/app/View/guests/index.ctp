       

<?php echo $this->Html->link('Search', array('controller'=>'guests', 'action'=>'search')); ?> </br>
	 <p style="text-align:left;">
   	<?php if($logged_in): ?>

          <?php echo $this->Html->link('Add new GuestBook', array('controller'=>'guests', 'action'=>'add')); ?> </br>
         
         <?php echo $this->Html->link('View my GuestBook', array('controller'=>'guests', 'action'=>'guest', $current_user['id'])); ?>
   <?php else: ?>
          <?php echo $this->Html->link('Register', array('controller'=>'users', 'action'=>'add')); ?>
         
                 
<?php  endif; ?>
   </p> 


<table>
    <tr>
        <th>Name</th>
        <th>Action</th>
    </tr>
    <?php foreach ($guests as $guest): ?>
    <tr>
    	<td><?php echo $this->Html->link($guest['Guest']['name'], array('controller'=>'comments', 'action'=>'view' ,$guest['Guest']['id'] )); ?></td>
    	<td><?php echo $this->Html->link('comment', array('controller'=>'comments', 'action'=>'post' ,  $guest['Guest']['id'])); ?></td>
    </tr>
      <?php endforeach; ?>
    <?php unset($guest); ?>
</table>