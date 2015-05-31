<div class="container-fluid">

	<div class="row">
		<div class="col-md-12"><?php echo modules::run('batch/dashboard',1); ?></div>
	</div>
	<div class="row">
		<div class="col-md-12"><?php echo modules::run('batch/dashboard',2,'grocery_crud_no_script'); ?></div>
	</div>
	<div class="row">
		<div class="col-md-6"><?php echo modules::run('sales/dashboard','grocery_crud_no_script'); ?></div>
		<div class="col-md-6"><?php echo modules::run('collection/dashboard','grocery_crud_no_script'); ?></div>
	</div>
</div>