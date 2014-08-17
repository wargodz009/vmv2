<?php if($this->session->flashdata('success') != '' || $this->session->userdata('success') != ''): ?>
<div class="alert alert-success alert-dismissible" role="alert">
	<button type="button" class="close" data-dismiss="alert">X</button>
	<?php echo $this->session->flashdata('success'); ?>
	<?php echo $this->session->userdata('success'); ?>
</div>
<?php endif; ?>
<?php if($this->session->flashdata('info') != '' || $this->session->userdata('info') != ''): ?>
<div class="alert alert-info alert-dismissible" role="alert">
	<button type="button" class="close" data-dismiss="alert">X</button>
	<?php echo $this->session->flashdata('info'); ?>
	<?php echo $this->session->userdata('info'); ?>
</div>
<?php endif; ?>
<?php if($this->session->flashdata('warning') != '' || $this->session->userdata('warning') != ''): ?>
<div class="alert alert-warning alert-dismissible" role="alert">
	<button type="button" class="close" data-dismiss="alert">X</button>
	<?php echo $this->session->flashdata('warning'); ?>
	<?php echo $this->session->userdata('warning'); ?>
</div>
<?php endif; ?>
<?php if($this->session->flashdata('danger') != '' || $this->session->userdata('danger') != ''): ?>
<div class="alert alert-danger alert-dismissible" role="alert">
	<button type="button" class="close" data-dismiss="alert">X</button>
	<?php echo $this->session->flashdata('danger'); ?>
	<?php echo $this->session->userdata('danger'); ?>
</div>
<?php endif; ?>
<?php $this->session->unset_userdata('success'); ?>
<?php $this->session->unset_userdata('info'); ?>
<?php $this->session->unset_userdata('warning'); ?>
<?php $this->session->unset_userdata('danger'); ?>