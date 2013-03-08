

<table>
    <tr>
        <th>name</th>
        <th>email</th>
        <th>comment</th>
    </tr>

    <!-- Here is where we loop through our $posts array, printing out post info -->

    <?php foreach ($comments as $comment): ?>
    <tr>
        <td><?php echo $comment['Comment']['name']; ?></td>
        <td><?php echo $comment['Comment']['email']; ?></td>
        <td><?php echo $comment['Comment']['comment']; ?></td>
    </tr>
    <?php endforeach; ?>
    <?php unset($comment); ?>
</table>