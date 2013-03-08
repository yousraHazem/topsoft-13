<h2>Search</h2>

<?php 

echo $this->Form-> create('Guest' ,array('action'=>'search','type'=>'get'));
echo $this->Form-> input('name');
echo $this->form->end('search');

?>
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


