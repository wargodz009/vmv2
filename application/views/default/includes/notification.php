<?php if($this->session->flashdata('error') != ''): ?>
<div class="alert">
	<button type="button" class="close" data-dismiss="alert">X</button>
	<?php echo $this->session->flashdata('error'); ?>
</div>
<?php endif; ?>