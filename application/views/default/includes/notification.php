<?php if($this->session->flashdata('success') != ''): ?>
<div class="alert alert-success alert-dismissible" role="alert">
	<button type="button" class="close" data-dismiss="alert">X</button>
	<?php echo $this->session->flashdata('success'); ?>
</div>
<?php endif; ?>
<?php if($this->session->flashdata('info') != ''): ?>
<div class="alert alert-info alert-dismissible" role="alert">
	<button type="button" class="close" data-dismiss="alert">X</button>
	<?php echo $this->session->flashdata('info'); ?>
</div>
<?php endif; ?>
<?php if($this->session->flashdata('warning') != ''): ?>
<div class="alert alert-warning alert-dismissible" role="alert">
	<button type="button" class="close" data-dismiss="alert">X</button>
	<?php echo $this->session->flashdata('warning'); ?>
</div>
<?php endif; ?>
<?php if($this->session->flashdata('danger') != ''): ?>
<div class="alert alert-danger alert-dismissible" role="alert">
	<button type="button" class="close" data-dismiss="alert">X</button>
	<?php echo $this->session->flashdata('danger'); ?>
</div>
<?php endif; ?>