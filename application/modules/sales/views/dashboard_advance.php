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
		<a href="<?=base_url();?>sales/"><button class='btn btn-info'>RESET</button></a>
	</div>	
</nav>
<table class="table table-hover">
<thead>
	<td>Area</td>
	<td>Msr Name</td>
	<td>Sales</td>
	<td>Quota</td>
	<td>Sales %</td>
	<td>RGS</td>
	<!--td>End Month</td-->
</thead>
<tbody>
<?php 
	$total = 0;
	if(isset($sales) && !empty($sales)) {
		foreach ($sales->result() as $msr) {
			if($district == '00' || $district == $msr->district_id) {
?>
		<tr>
			<?php $quota = ($msr->quota > 0)?$msr->quota:1000000; ?>
			<td><a href="<?=base_url();?>sales/area/<?=$msr->district_id;?>"><?=$this->crud_model->read('district',array(array('where','district_id',$msr->district_id)),'name');?></a></td>
			<td><a href="<?=base_url();?>sales/all_sales/<?=$msr->user_id;?>"><?=strtoupper($msr->area) .' '. $msr->last_name.', '.$msr->first_name;?></a></td>
			<td>P <?php $amount = modules::run('sales/get_sales',$msr->user_id,$month,$year); echo number_format($amount); $total = $total + $amount; ?></td>
			<td>P <?=number_format($quota);?></td>
			<td><?=number_format(($amount / $quota) * 100,2);?></td>
			<td>P <?php $rgs_amount = modules::run('rgs/get_rgs',$msr->user_id,$month,$year); echo number_format($rgs_amount); ?></td>
			<!--td><?php //echo modules::run('sales/get_sales',get_msr_client_id($msr->user_id),$month,$year); ?></td-->
		</tr>
<?php 			}
		}
	} else {
?>
	<tr>
		<td>No Items Yet!</td>
		<td></td>
		<td></td>
		<td></td>
		<!--td></td-->		
	</tr>
<?php
	}
?>
	<thead><tr>
		<td></td>
		<td></td>
		<td>Total: P <?=number_format($total);?></td>
		<td></td>
	</tr></thead>
</tbody>
</table>
<script>
	$(document).ready(function(){
		$('.reload_button').change(function(){
			window.location = "<?=base_url();?>sales/index/"+$('#month :selected').val() + "/" + $('#year :selected').val() +'/' + $('#district :selected').val();
		});
	});
</script>