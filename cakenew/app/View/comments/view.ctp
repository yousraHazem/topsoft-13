

<table>
    <tr>
        <th>name</th>
        <th>email</th>
        <th>comment</th>
        <?php if($logged_in): ?>
         <th>Delete</th>
   <?php else: ?>
         
                 
<?php  endif; ?>

    </tr>

    <!-- Here is where we loop through our $posts array, printing out post info -->

    <?php foreach ($comments as $comment): ?>
    <tr>
        <td><?php echo $comment['Comment']['name']; ?></td>
        <td><?php echo $comment['Comment']['email']; ?></td>
        <td><?php echo $comment['Comment']['comment']; ?></td>
        <?php if($logged_in): ?>
      <td>  <?php echo $this->Form->postLink('Delete',array('action' => 'delete', $comment['Comment']['id']),array('confirm' => 'Are you sure?')); ?> </td>>
      <?php else: ?>
                    
<?php  endif; ?>
    </tr>
    <?php endforeach; ?>
    <?php unset($comment); ?>
</table>