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
	<td>Client Name</td>
	<td>Collection</td>
	<td>Balance</td>
	<td>Aging of Balance</td>
</thead>
<tbody>
<?php 
	if(isset($collection) && !empty($collection)) {
		foreach ($collection as $payment) {
			$info = $this->crud_model->read('orders',array(array('where','order_id',$payment->order_id)));
			$user = $this->crud_model->read('user',array(array('where','user_id',get_msr_client($info[0]->msr_client_id))));
			//items
			$total = 0;
			$order_item = $this->sales_model->get_items($payment->order_id);
			if(!empty($order_item)) {
				foreach ($order_item as $item) {
					if($item->add_type == 'paid') {
						$total += $item->quantity * $item->custom_price;
					}
				}
			}
			if($info[0]->discount_type == 'percentage') {
				$total = $total - ($total * ($info[0]->discount / 100));
			} else {
				$total = $total - $info[0]->discount;
			}
			$balance = $total - $collection[0]->amount;
		?>
		<tr>
			<td><?=get_district_name($user[0]->district_id);?></td>
			<td><?=get_name(get_msr_client($info[0]->msr_client_id));?></td>
			<td>P <?=number_format($payment->amount);?></td>
			<td>P <?=number_format($balance);?></td>
			<td><?php
			$date1=date_create($info[0]->order_date);
			$date2=date_create(date("Y-m-d"));
			$diff = date_diff($date1,$date2);
			echo $diff->format("%R%a days");
			?></td>		
		</tr>
		<?php
		}
	} else {
		?>
		<tr>
			<td>No Items Yet!</td>
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
			window.location = "<?=base_url();?>collection/index/"+$('#month :selected').val() + "/" + $('#year :selected').val() +'/' + $('#district :selected').val();
		});
	});
</script>
<style>
thead tr >td {
	font-weight: bold;
}
</style>