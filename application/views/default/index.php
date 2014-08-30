<?php $this->load->view('default/includes/header'); ?>

<div class="container">
	<?php echo modules::run("menu"); ?>
	<?php $this->load->view('default/includes/notification'); ?>
	<?php echo modules::run("menu/sub_menu"); ?>
	<?php echo $contents; ?>
</div>
<?php $this->load->view('default/includes/footer'); ?>