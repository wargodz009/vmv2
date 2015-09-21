<div class="row">
	<div class="col-md-8 col-md-offset-2">
		<br/>
		<div class="well">
			<form id='add_collection' action="<?=base_url();?>collection/add_new" class="form" method="post">
			<div class="form-group">
				<label for="">Payment Type</label>
				<select name="payment_type" id="payment_type" class="form-control">
					<option value="1">Cash</option>
					<option value="2">Cheque</option>
				</select>
			</div>
			<div class="form-group">
				<label for="">Area</label>
				<select id="area" class="form-control :required">
					<option value="0">--SELECT AREA--</option>
					<?php
					if(!empty($all_area)) {
						foreach($all_area as $area) {
							echo '<option value="'.$area->area.'">'.$area->area.'</option>';
						}
					}
					?>
				</select>
			</div>
			<div class="form-group">
				<label for="">Client</label>
				<select id="msr_client_id" class="form-control :required"><option value="0">--SELECT ONE--</option></select>
			</div>
			<div class="form-group">
				<label for="">PR/OR #</label>
				<input type="text" name="pr_or_number" id="pr_or_number" class="form-control :required" />
			</div>
			<div class="form-group">
				<label for="">Date of PR/OR</label>
				<input type="text" name="date_of_pr_or" id="date_of_pr_or" class="datepicker form-control :required" />
			</div>
			<div class="form-group">
				<label for="">Amount</label>
				<input type="text" name="amount" id="amount" class="form-control :required :number" />
			</div>
			<div class="form-group container">
				<label for="" class="pull-left col-xs-12 col-sm-12 col-md-12">DR Applied</label>
				<div class="col-md-3 col-xs-4">
					<select multiple id="select1" class="multiselect col-md-12"> 
					</select>  
					<a href="#" id="add" class="add">add &gt;&gt;</a>  
				</div>				
				<div class="col-md-3 col-xs-4">
					<select multiple id="select2" class="multiselect col-md-12" name="dr_applied[]"></select>  
					<a href="#" id="remove" class="add">&lt;&lt; remove</a>  
				</div>
			</div>
			<div class="form-group cheque">
				<label for="">Bank Name</label>
				<input type="text" name="bank" id="bank" class="form-control" />
			</div>
			<div class="form-group cheque">
				<label for="">Cheque Number</label>
				<input type="text" name="check_number" id="check_number" class="form-control" />
			</div>
			<div class="form-group cheque">
				<label for="">Date of Cheque</label>
				<input type="text" name="date_of_cheque" id="date_of_cheque" class="datepicker form-control" />
			</div>
			<div class="form-group">
				<label for=""></label>
				<input id='add_collection' type="submit" class="btn btn-info pull-right" value="SAVE COLLECTION"/>
			</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$('#payment_type').change(function(){
		$('.cheque').toggle();
	});
	$('#area').change(function(){
		if($('#area :selected').val() != '0') {
			$('#select1').empty();
			$('#select2').empty();
			$('#msr_id').empty();
			$('#msr_client_id').empty();
			$.getJSON('<?=base_url()?>sales/create/area_clients/' + encodeURIComponent($('#area :selected').val()),function(data) {
				$.each(data, function(){
					$('<option/>', {
						'value': this.id,
						'text': this.msr_client_id + ' -> ' + this.client_id
					}).appendTo('#msr_client_id');
				});
			});
		} else {
			$('#msr_client_id').empty();
		}
	});
	$('#add').click(function() {  
		return !$('#select1 option:selected').remove().appendTo('#select2');  
	});  
	$('#remove').click(function() {  
		return !$('#select2 option:selected').remove().appendTo('#select1');  
	});
	$('#msr_client_id').change(function(){
		$.getJSON('<?=base_url()?>collection/get_dr/' + $('#msr_client_id').val(),function(data) {
			$('#select1').empty();
			$('#select2').empty();
			$.each(data, function(index) {
				$('<option>').val(data[index].form_number).text(data[index].form_number).appendTo('#select1');
			})
		});
	});
});
</script>