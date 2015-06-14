<div class="container-fluid">

	<div class="row">
		<div class="col-md-12"><a href="<?=base_url();?>batch/index"><?php echo modules::run('batch/dashboard',1); ?></a></div>
	</div>
	<div class="row">
		<div class="col-md-12"><a href="<?=base_url();?>batch/index"><?php echo modules::run('batch/dashboard',2,'grocery_crud_no_script'); ?></a></div>
	</div>
	<div class="row">
		<div class="col-md-6"><a href="<?=base_url();?>sales/all"><?php echo modules::run('sales/dashboard','grocery_crud_no_script'); ?></a></div>
		<div class="col-md-6"><a href="<?=base_url();?>collection/all"><?php echo modules::run('collection/dashboard','grocery_crud_no_script'); ?></a></div>
	</div>
</div>