<nav class="navbar navbar-default" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="<?php echo base_url(); ?>"><?=$this->session->userdata('role_name');?></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <?php foreach($items as $item): ?>
		<?php $item->url = $item->module.'/'.$item->function; ?>
		<li class="<?php echo ($current == $item->url)? 'active':''; ?>">
			<a href="<?php echo base_url($item->url); ?>"><?php echo ucfirst($item->name); ?></a>
		</li>
		<?php endforeach; ?>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <?php if($currentuser): ?>
		<li><a class="confirm" href="<?php echo base_url('signout'); ?>">Sign out</a></li>
		<?php else: ?>
		<li><a href="<?php echo base_url('signin'); ?>">Sign in</a></li>
		<?php endif; ?>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>