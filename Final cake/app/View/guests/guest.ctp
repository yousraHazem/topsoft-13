<h2>My Guest Books</h2>

<table>
<tr>
<th> Name</th>
<th>Action</th>
</tr>
<?php foreach ($guests as $guest): ?> 
<tr>
<td><?php echo $guest['Guest']['name']?> </td>
<td><?php echo $this->Html->link('View Comments', array('controller'=>'comments', 'action'=>'gview' ,$guest['Guest']['id'] )); ?></td>

</tr>
<?php endforeach; ?>

</table>