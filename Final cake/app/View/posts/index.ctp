<h2> View all Posts </h2>

<table>
<tr>
<th> title</th>
<th> body</th>
<th> Actions </th>
</tr>

<?php foreach ($posts as $post): ?> 
<tr>
<td>
<?php echo $this-> HTML-> link($post ['Post'] ['id'], array('action'=>'view', $post ['Post'] ['id'])); ?>
</td>
<td>
<?php echo $post ['Post'] ['posts']; ?>
</td>
<td> <?php echo $this-> HTML-> link('edit', array('action'=>'edit', $post ['Post'] ['id'])); ?>  <?php echo $this->HTML-> link('delete',array('action'=>'delete', $post ['Post']['id']), NULL,'Are you sure you want to delete?');?>
</td>

</tr>

<?php endforeach; ?>

</table>