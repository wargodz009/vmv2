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
<?php
//$this->load->library('table');
//$this->table->set_heading('order','date','client_name','form_number','total','product','qty','free','discount','total_discount','total');
//$tmpl = array ( 'table_open'  => '<table id="tblExport" class="table table-hover table-striped">' );
//$this->table->set_template($tmpl);
//echo $this->table->generate($order);
echo '<table id="tblExport" class="table table-hover table-striped">';
echo '<thead>';
echo '<tr>
	<td colspan=6><strong>MSR: '.$msr_name.'</strong></td>
	<td colspan=3></td>
</tr>';
echo '<tr>';
echo '<td>Collected DATE</td>';
echo '<td>CLIENTS NAME</td>';
echo '<td>PR/OR #</td>';
echo '<td>Bank Name</td>';
echo '<td>Check no.</td>';
echo '<td>Date of Checks</td>';
echo '<td>Dated Cash</td>';
echo '<td>PDC Amt</td>';
echo '<td>DR/SI applied</td>';
echo '</tr></thead><tbody>';
if(!empty($all_orders)) {
	foreach($all_orders as $order) {
		$info = $this->crud_model->read('orders',array(array('where','order_id',$order)));
		$all_payment_ids = $this->crud_model->read('payment_orders',array(array('where_in','orderid',$order)));
		//all payments for each orders
		if(!empty($all_payment_ids)) {
			foreach($all_payment_ids as $pids) {
				$payments = $this->crud_model->read('payment',array(array('where','payment_id',$pids->paymentid)));
				if(!empty($payments)) {
					foreach($payments as $payment) {
						$all = array();
						echo '<tr>
							<td>'.pretty_date($info[0]->order_date).'</td>
							<td>'.get_name(get_msr_client($info[0]->msr_client_id,'client_id')).'</td>
							<td>'.$info[0]->form_number.'</td>
							<td>'.$payment->bank.'</td>
							<td>'.$payment->check_number.'</td>
							<td>'.pretty_date($payment->datetime).'</td>
							<td>'.pretty_date($payment->datetime_collected).'</td>
							<td>'.($payment->status == 'Not Collected yet'?$payment->check_full_amount:'').'</td>
							<td>';
						$payment_applied = get_payment_info($pids->paymentid,true);
						if(!empty($payment_applied)) {
							foreach($payment_applied as $pa) {
								$all[] = get_order_info($pa,'form_number');
							}
						}
						echo implode(', ',$all).'</td>
						</tr>';
					}
				}
			}
		}
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
echo '</tbody></table>';
?>
<script>
	$(document).ready(function(){
		$('.reload_button').change(function(){
			window.location = "<?=base_url();?>collection/per_msr/<?=$msr_client_id;?>/"+$('#month :selected').val() + "/" + $('#year :selected').val() +'/' + $('#district :selected').val()+'/' + $('#day_from :selected').val()+'/' + $('#day_to :selected').val();
		});
	});
</script>
<style>
thead tr >td {
	font-weight: bold;
}
</style>