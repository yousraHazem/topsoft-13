<h2>My Guest Books</h2>

<table>
<tr>
<th> Name</th>
</tr>
<?php foreach ($guests as $guest): ?> 
<tr>
<td><?php echo $this->Html->link($guest['Guest']['name'], array('controller'=>'comments', 'action'=>'view' ,$guest['Guest']['id'] )); ?></td>
</tr>
<?php endforeach; ?>

</table>