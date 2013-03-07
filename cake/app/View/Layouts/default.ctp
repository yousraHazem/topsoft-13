

 
<?php echo $this->Html->docType('xhtml-trans'); ?>
<html>
<head>
    <title><?php echo $blog_title; ?></title>
    <?php echo $this->Html->css('styles'); ?>
</head>
<body>
<div id="header">
    <h1>Our Blog</h1>

</div>

<div id="container">
	 <p style="text-align:right;">
   	<?php if($logged_in): ?>
          Welcome! <?php echo $this->Html->link('logout', array('controller' => 'users', 'action' => 'logout')); ?>
   <?php else: ?>
          <?php echo $this->Html->link('login', array('controller' => 'users', 'action' => 'login')); ?>
                 
<?php  endif; ?>
   </p> 

   <?php echo $this->Session->flash(); ?>
    <?php echo $content_for_layout; ?> 
</div>
</body>
</html>

 <!-- <?php 
/**
 *
 * PHP 5
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright 2005-2012, Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright 2005-2012, Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       Cake.View.Layouts
 * @since         CakePHP(tm) v 0.10.0.1076
 * @license       MIT License (http://www.opensource.org/licenses/mit-license.php)
 */

 /* $cakeDescription = __d('cake_dev', 'CakePHP: the rapid development php framework');
?>
<!DOCTYPE html>
<html>
<head>
<?php echo $this->Html->charset(); ?>
<title>
<?php echo $cakeDescription ?>:
<?php echo $blog_title; ?>
</title>
<?php
echo $this->Html->meta('icon');

echo $this->Html->css('cake.generic');

echo $this->fetch('meta');
echo $this->fetch('css');
echo $this->fetch('script');
?>
</head>
<body>
<div id="container">
<div id="header">
<h1><?php echo $this->Html->link($cakeDescription, 'http://cakephp.org'); ?></h1>
</div>
<div id="content">

<?php echo $this->Session->flash(); ?>

<?php echo $this->fetch('content'); ?>
</div>
<div id="footer">
<?php echo $this->Html->link(
$this->Html->image('cake.power.gif', array('alt' => $cakeDescription, 'border' => '0')),
'http://www.cakephp.org/',
array('target' => '_blank', 'escape' => false)
);
?>
</div>
</div>
<?php echo $this->element('sql_dump'); ?>
</body>
</html>

 */
