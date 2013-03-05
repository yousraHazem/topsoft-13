<h2> View My Guest Books</h2>

<table>
<tr>
<th> Name</th>
</tr>
<?php foreach ($guests as $guest): ?> 
<tr>
<td>
<?php echo $guest ['Guest'] ['name']; ?>
</td>
</tr>
<?php endforeach; ?>

</table>