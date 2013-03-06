<h2>Hello</h2>




	 <p style="text-align:left;">
   	<?php if($logged_in): ?>
         <?php echo $this->Html->link('Add new GuestBook', array('controller'=>'guests', 'action'=>'add')); ?>
   <?php else: ?>
         
                 
<?php  endif; ?>
   </p> 


<table>
    <tr>
        <th>Name</th>
        <th>Action</th>
    </tr>
    <?php foreach ($guests as $guest): ?>
    <tr>
    	<td><?php echo $this->Html->link($guest['Guest']['name'], array('controller'=>'comments', 'action'=>'view' , $guest['Guest']['id'])); ?></td>
    	<td><?php echo $this->Html->link('comment', array('controller'=>'comments', 'action'=>'post' ,  $guest['Guest']['id'])); ?></td>
    </tr>
      <?php endforeach; ?>
    <?php unset($guest); ?>
</table>