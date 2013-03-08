<table>
    <tr>
        <th>name</th>
        <th>email</th>
        <th>comment</th>
        <?php if($logged_in): ?>
         <th>Action</th>
   <?php else: ?>
         
                 
<?php  endif; ?>

    </tr>

    <!-- Here is where we loop through our $posts array, printing out post info -->

    <?php foreach ($comments as $comment): ?>
    <tr>
        <td><?php echo $comment['Comment']['name']; ?></td>
        <td><?php echo $comment['Comment']['email']; ?></td>
        <td><?php echo $comment['Comment']['comment']; ?></td>
        <td>
            <?php if($logged_in): ?>
            
                <?php echo $this->HTML-> link('delete',array('action'=>'delete', $comment['Comment']['id']), NULL,'Are you sure you want to delete?');?></td>
                            
<?php  endif; ?>
    </tr>
    <?php endforeach; ?>
    <?php unset($comment); ?>
</table>