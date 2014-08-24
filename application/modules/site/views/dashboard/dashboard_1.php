<div class="container-fluid">

	<div class="row">
		<div class="col-md-12"><?php echo modules::run('batch/dashboard'); ?></div>
	</div>
	<div class="row">
		<div class="col-md-6"><?php echo modules::run('sales/dashboard'); ?></div>
		<div class="col-md-6"><?php echo modules::run('collection/dashboard'); ?></div>
	</div>
</div>