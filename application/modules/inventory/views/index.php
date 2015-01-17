<div class="container-fluid">

	<div class="row">
		<div class="col-md-12"><?php echo modules::run('batch/dashboard'); ?></div>
	</div>
	<div class="row">
		<div class="col-md-6"><?php echo modules::run('item/dashboard'); ?></div>
		<div class="col-md-6"><?php echo modules::run('supplier/dashboard'); ?></div>
	</div>
</div>