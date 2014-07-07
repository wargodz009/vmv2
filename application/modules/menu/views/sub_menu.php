<?php if(!empty($items)) : ?>
<div class="sub_menu">
	<ul class="nav nav-tabs">
		<?php foreach($items as $item): ?>
		<?php $item->url = $item->module.'/'.$item->function; ?>
		<li class="<?php echo ($current == $item->url)? 'active':''; ?>">
			<a href="<?php echo base_url($item->url); ?>"><?php echo ucfirst($item->name); ?></a>
		</li>
		<?php endforeach; ?>
	</ul>
</div>
<?php endif; ?>