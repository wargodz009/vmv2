<?php
$this->load->model('sales/sales_model');
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
	$st_collection = 0;
	$st_aging = 0;
	$st_col_percent = 0;
	$st_shortage = 0;
	$st_pdc = 0;
	$st_col_pdc = 0;
	$total = 0;
	if(isset($collection) && !empty($collection)) {
		foreach ($collection as $payment) {
			$order_ids = get_payment_info($payment->payment_id,true);
			$info = $this->crud_model->read('orders',array(array('where_in','order_id',$order_ids)));
			$user = $this->crud_model->read('user',array(array('where','user_id',get_msr_client($info[0]->msr_client_id))));
			
			if(count($order_ids)>1) {
				var_dump($order_ids);
			} else {
				echo 'lessthan 1<br />';
			}
			var_dump(count($order_ids));
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
	}
?>
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