<div class="container-fluid">
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