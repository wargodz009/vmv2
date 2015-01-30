<?php
$this->load->model('sales/sales_model');
$this->load->model('collection/collection_model');
?>
<nav class="navbar navbar-right">
	<div class="btn-group form-inline">
		<select id="district"  name="district" class="form-control reload_button">
			<option value="00">District</option>
			<?php 
			foreach($area_list as $x) {
				echo '<option value="'.$x->district_id.'" '.($district == $x->district_id?"selected":'').'>'.$x->name.'</option>';
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
	</div>	
</nav>
<table class="table table-hover">
<thead>
	<td>Area</td>
	<td>MSR Name</td>
	<td>Total Collection</td>
	<td>Aging of A/R</td>
	<td>Collection %</td>
	<td>Shortage</td>
	<td>Total PDC Collected</td>
	<td>Coll PDC %</td>
</thead>
<tbody>
	<?php 
	if(!empty($all_msr)) {
		foreach($all_msr as $msr) {
			$mid = array();
			$oid = array();
			$fids = array();
			$total = 0;
			$pdc_total = 0;
			$total_all = 0;
			$balance = 0;
			$filtered_order_ids = array();
			
			$all_msr_client_id = get_all_msr_client_id($msr->user_id);
			foreach($all_msr_client_id as $mid) {
				$mids[] = $mid->msr_client_id;
			}
			//all order ids
			$all_order_ids = get_order_id($mids);
			foreach($all_order_ids as $id) {
				$oid[] = $id->order_id;
			}
			//all payment ids
			$all_payment_ids = get_payment_id_from_payment_orders($oid);
			foreach($all_payment_ids as $ids) {
				$aid[] = $ids->paymentid;
			}
			//filtered payment ids
			$filtered_collections = $this->collection_model->get_all($month,$year,$day_from,$day_to,$aid);
			//filtered order ids
			foreach($filtered_collections as $fc) {
				$fids[] = $fc->payment_id;
			}
			
			//sum all post dated checks collected
			if(!empty($fids)) {
				$pdc = $this->crud_model->read('payment',array(array('where_in','payment_id',$fids),array('where','status','Not Collected yet')));
				if(!empty($pdc)) {
					foreach($pdc as $all_pdc) {
						$pdc_total += $all_pdc->check_full_amount;
					}
				}
			}
			
			if(!empty($fids)) {
				$filtered_order_ids = get_order_id_from_payment_orders($fids);
			}
			
			
			//get all paid
			if(!empty($filtered_order_ids)){
				foreach($filtered_order_ids as $foid) {
					if(!empty($foid)) {
						$order = $this->crud_model->read('order_item',array(array('where','order_id',$foid->orderid)));
						foreach($order as $o) {
							$total += ($o->quantity * $o->custom_price);
						}
					}
				}
			}
			//get all paid and unpaid
			if(!empty($all_order_ids)){
				foreach($all_order_ids as $foid) {
					if(!empty($foid)) {
						$order = $this->crud_model->read('order_item',array(array('where','order_id',$foid->order_id)));
						foreach($order as $o) {
							$total_all += ($o->quantity * $o->custom_price);
						}
					}
				}
			}
			$total_collections = 0;
			
			$balance = $total_all - $total;
			echo '<tr>
				<td>'.get_district_name($msr->district_id).'</td>
				<td><a href="'.base_url()."collection/per_msr/".$msr->user_id.'">'.get_name($msr->user_id).'</a></td>
				<td>'.$total.'</td>
				<td>'.$total_all.'</td>
				<td>'.@number_format((($total * 100) / $balance),2) . '%</td>		
				<td>'.($balance - $total).'</td>		
				<td>'.$pdc_total.'</td>		
				<td>'.@number_format((($total * 100) / ($pdc_total + $total_all)),2) . '%</td>		
			</tr>';
		}
	} else {
	?>
	<tr>
		<td>No Items Yet!</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>		
		<td></td>		
		<td></td>		
		<td></td>		
	</tr>
	<?php 
	} ?>
</tbody>
</table>
<script>
	$(document).ready(function(){
		$('.reload_button').change(function(){
			window.location = "<?=base_url();?>collection/index/"+$('#month :selected').val() + "/" + $('#year :selected').val() +'/' + $('#district :selected').val()+'/' + $('#day_from :selected').val()+'/' + $('#day_to :selected').val();
		});
	});
</script>
<style>
thead tr >td {
	font-weight: bold;
}
</style>