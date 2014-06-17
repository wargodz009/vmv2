<div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<a class="brand" href="<?php echo base_url(); ?>"><?=$this->setting_model->get_setting('site_title');?></a>
			<ul class="nav">
				<?php foreach($items as $item): ?>
				<?php $item->url = $item->module.'/'.$item->function; ?>
				<li<?php echo ($current == $item->url)? ' class="active"':''; ?>>
					<a href="<?php echo base_url($item->url); ?>"><?php echo ucfirst($item->name); ?></a>
				</li>
				<?php endforeach; ?>
			</ul>
			
			<div class="pull-right">
				<?php if($currentuser): ?>
				<div class="dropdown">
					<ul class="nav">
						<li>
							<a class="dropdown-toggle" id="dLabel" role="button" data-toggle="dropdown" data-target="#" href="#">
								Logged as <strong><?php echo $currentuser->email; ?></strong><b class="caret"></b>
							</a>
							<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
								<li><a href="<?php echo base_url('user'); ?>">View Profile</a></li>
								<li><a href="<?php echo base_url('user/account'); ?>">Edit Account</a></li>
								<li class="divider"></li>
								<li><a href="<?php echo base_url('site/signout'); ?>">Logout</a></li>
							</ul>
						</li>
					</ul>
				</div>

				<?php else: ?>
				<ul class="nav">
					<li class="divider-vertical"></li>
					<li><a href="<?php echo base_url('signin'); ?>">Sign in</a></li>
				</ul>
				<?php endif; ?>
			</div>
		</div>
	</div>
</div>
