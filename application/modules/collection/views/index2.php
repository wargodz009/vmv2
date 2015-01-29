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
	if(isset($collection) && !empty($collection)) {
		foreach ($collection as $payment) {
			$order_ids = get_payment_info($payment->payment_id,true);
			$info = $this->crud_model->read('orders',array(array('where_in','order_id',$order_ids)));
			$user = $this->crud_model->read('user',array(array('where','user_id',get_msr_client($info[0]->msr_client_id))));
			//items
			$total = 0;
			$order_item = array();
			if(is_array($order_ids)) {
				foreach($order_ids as $order_id) {
					$order_item = $this->sales_model->get_items($order_id);
				}
			} else {
				$order_item = $this->sales_model->get_items($payment->order_id);
			}
			
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
			<!-- Area -->
			<td><?=get_district_name($user[0]->district_id);?></td>
			<!-- MSR name -->
			<td><a href='<?=base_url();?>collection/per_msr/<?=$info[0]->msr_client_id;?>'><?=get_name(get_msr_client($info[0]->msr_client_id));?></a></td>
			<!-- Total Collection -->
			<td><?=number_format($payment->amount); $st_collection = $st_collection + $payment->amount;?></td>
			<!-- Aging of A/R -->
			<td><?=number_format($balance); $st_aging = $st_aging + $balance;?></td>
			<!-- Collection -->
			<td><?php
			echo number_format((($payment->amount * 100) / $balance),2) . '%'; $st_col_percent = $st_col_percent + number_format((($payment->amount * 100) / $balance),2);
			?></td>		
			<!-- shortage -->
			<td><?=($balance - $payment->amount); $st_shortage = $st_shortage + ($balance - $payment->amount); ?></td>
			<?php if($payment->payment_type == 'check') { ?> 
			<!-- total pdc collected -->
			<td><?php 
				$paid_items = $this->crud_model->read('payment_item',array(array('where','payment_id',$payment->payment_id)));
				$total_paid_pdc = 0;
				$total_unpaid_pdc = 0;
				if(!empty($paid_items)) {
					foreach($paid_items as $pi ){
						if($payment->status == 1) {
							$total_paid_pdc = $total_paid_pdc + $pi->amount;
						} else {
							$total_unpaid_pdc = $total_unpaid_pdc + $pi->amount;
						}
					}
				}
				echo number_format($total_paid_pdc);
				$st_pdc = $st_pdc + number_format($total_paid_pdc);
				$total_pdc = $total_paid_pdc + $total_unpaid_pdc;
			?></td>
			<!-- coll pdc -->
			<td><?= number_format((($total_paid_pdc * 100) / $total_pdc),2) . '%'; $st_col_pdc = $st_col_pdc + (($total_paid_pdc * 100) / $total_pdc); ?></td>
			<?php } else { ?> 
			<!-- total pdc collected -->
			<td></td>
			<!-- coll pdc -->
			<td></td>
			<?php } ?>
		</tr>
		<?php
		}
		echo '<thead><tr>
		<td></td>
		<td>Sub Total - </td>
		<td>'.$st_collection.'</td>
		<td>'.$st_aging.'</td>
		<td>'.$st_col_percent.'%</td>		
		<td>'.$st_shortage.'</td>		
		<td>'.$st_pdc.'</td>		
		<td>'.$st_col_pdc.'%</td>		
	</tr></thead>';
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
			window.location = "<?=base_url();?>collection/index/"+$('#month :selected').val() + "/" + $('#year :selected').val() +'/' + $('#district :selected').val();
		});
	});
</script>
<style>
thead tr >td {
	font-weight: bold;
}
</style>