<?php if($this->session->flashdata('error') != ''): ?>
<div class="alert alert-warning alert-dismissible" role="alert">
	<button type="button" class="close" data-dismiss="alert">X</button>
	<?php echo $this->session->flashdata('error'); ?>
</div>
<?php endif; ?>