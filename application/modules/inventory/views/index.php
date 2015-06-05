<div class="container-fluid">
	<nav class="navbar navbar-right">
		<div class="btn-group form-inline">
			<select name="" id="item_type_id" class="form-control reload_button col-md-2">
				<option value="all">All</option>
				<?php 
					foreach($item_type as $type) {
						echo '<option value="'.$type->item_type_id.'" '.($type->item_type_id == $item_type_id?'selected':'').'>'.$type->name.'</option>';
					}
				?>
			</select>
			<select id="month"  name="month" class="form-control reload_button">
				<option value="00" <?=($month == '00'?'selected':'');?>>Month</option>
				<option value="1" <?=($month == '1'?'selected':'');?>>Jan</option>
				<option value="2" <?=($month == '2'?'selected':'');?>>Feb</option>
				<option value="3" <?=($month == '3'?'selected':'');?>>Mar</option>
				<option value="4" <?=($month == '4'?'selected':'');?>>Apr</option>
				<option value="5" <?=($month == '5'?'selected':'');?>>May</option>
				<option value="6" <?=($month == '6'?'selected':'');?>>Jun</option>
				<option value="7" <?=($month == '7'?'selected':'');?>>Jul</option>
				<option value="8" <?=($month == '8'?'selected':'');?>>Aug</option>
				<option value="9" <?=($month == '9'?'selected':'');?>>Sep</option>
				<option value="10" <?=($month == '10'?'selected':'');?>>Oct</option>
				<option value="11" <?=($month == '11'?'selected':'');?>>Nov</option>
				<option value="12" <?=($month == '12'?'selected':'');?>>Dec</option>
			</select>
			<select id="day_from"  name="day_from" class="form-control reload_button">
			<option value="1" <?=($day_from == '1'?'selected':'');?>>Day From</option>
			<?php for($x = 2;$x <=31;$x++) { ?>
				<option value="<?=$x;?>" <?=($day_from == $x?'selected':'');?>><?=$x;?></option>
			<?php } ?>
			</select> - 
			<select id="day_to"  name="day_to" class="form-control reload_button">
			<?php for($y = $day_from;$y <=30;$y++) { ?>
				<option value="<?=$y;?>" <?=($day_to == $y?'selected':'');?>><?=$y;?></option>
			<?php } ?>
			<option value="31" <?=($day_to == '31'?'selected':'');?>>Day To</option>
			</select>
			<select id="year" name="year" class="form-control reload_button">
				<option value="00">Year</option>
				<?php $x = date('Y'); while($x >= date('Y') - 5)  : ?>
					<option value="<?=$x;?>"  <?=($year == $x?'selected':'');?>><?=$x;?></option>
				<?php $x--; endwhile; ?>
			</select>
			<a href="<?=base_url();?>inventory/"><button class='btn btn-info'>RESET</button></a>
		</div>	
	</nav>
	<div class="clearfix"></div>
	<div class="content">
		<table class='table table-hover'>
			<thead>
				<tr>
					<td>Product Name</td>
					<td>Generic Name</td>
					<td>Desccription</td>
					<td>Batch NO.</td>
					<td>Expiry date</td>
					<td>Quantity</td>
					<td>Supplier delivery</td>
					<td>Other delivery</td>
					<td>Sales CLIENT</td>
					<td>Sales OTHER</td>
					<td>Ending Quantity</td>
					<td>Status</td>
				</tr>
			</thead>
			<tbody>
			<?php
				if(!empty($all_batches)) {
					foreach($all_batches as $batch) {
						echo '<tr>
							<td><a href="'.base_url().'item/history/'.$batch->item_id.'">'.get_item_info($batch->item_id).'</a></td>
							<td>'.get_item_info($batch->item_id,'generic_name').'</td>
							<td>'.get_item_info($batch->item_id,'description').'</td>
							<td>'.$batch->batch_readable_id.'</td>
							<td>'.pretty_date($batch->expire_date).'</td>
							<td>'.$batch->count.'</td>
							<td>'.$batch->count.'</td>
							<td></td>
							<td>'.$batch->sold_count.'</td>
							<td></td>
							<td>'.($batch->count - $batch->sold_count).'</td>
							<td>'.modules::run('batch/_callback_to_status',1,$batch).'</td>
						</tr>';
					}
				}
			?>
			</tbody>
		</table>
	</div>
</div>
<script>
	$(document).ready(function(){
		$('.reload_button').change(function(){
			window.location = "<?=base_url();?>inventory/index/"+$('#item_type_id :selected').val() + "/" + $('#year :selected').val() +'/' + $('#month :selected').val()+'/' + $('#day_from :selected').val()+'/' + $('#day_to :selected').val();
		});
	});
</script>
<style>
thead tr >td {
	font-weight: bold;
}
</style>