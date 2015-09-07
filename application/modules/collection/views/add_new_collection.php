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
				<?php 
				$district = $this->crud_model->read('district');
				if(!empty($district)) {
					echo '<select id="district_id" class="form-control :required"><option value="0">--SELECT ONE--</option>';
					foreach($district as $d) {
						echo '<option value="'.$d->district_id.'">'.$d->name.'</option>';
					}
					echo '</select>';
				}
				?>
				<input type="hidden" value="" id="msr_client_id" name="msr_client_id" />
			</div>
			<div class="form-group">
				<label for="">Msr</label>
				<?php 
				$user = $this->crud_model->read('user',array(array('where','role_id','6'),array('where','district_id','1')));
				if(!empty($user)) {
					echo '<select id="msr_id" class="form-control :required"><option value="0">--SELECT ONE--</option>';
					foreach($user as $u) {
						echo '<option value="'.$u->user_id.'">'.$u->first_name. ' ' . $u->last_name .'</option>';
					}
					echo '</select>';
				}
				?>
			</div>
			<div class="form-group">
				<label for="">Client</label>
				<select id="client_id" class="form-control :required"><option value="0">--SELECT ONE--</option></select>
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
	$('#district_id').change(function(){
		$.getJSON('<?=base_url()?>collection/get_dr/msr/' + $('#district_id').val(),function(data) {
			$('#select1').empty();
			$('#select2').empty();
			$('#msr_id').empty();
			$('#client_id').empty();
			$('<option>').val(0).text('--SELECT ONE--').appendTo('#msr_id');
			$.each(data, function(index) {
				$('<option>').val(data[index].user_id).text(data[index].first_name + ' ' + data[index].last_name).appendTo('#msr_id');
			})
		});
	});
	$('#msr_id').change(function(){
		$.getJSON('<?=base_url()?>collection/get_dr/client/' + $('#msr_id').val(),function(data) {
			$('#select1').empty();
			$('#select2').empty();
			$('#client_id').empty();
			$('<option>').val(0).text('--SELECT ONE--').appendTo('#client_id');
			$.each(data, function(index) {
				$('<option>').val(data[index].user_id).text(data[index].first_name + ' ' + data[index].last_name).appendTo('#client_id');
			})
		});
	});
	$('#client_id').change(function(){
		$.getJSON('<?=base_url()?>collection/get_dr/msrclient/' + $('#msr_id').val() + '/'+ $('#client_id').val(),function(data) {
			$('#msr_client_id').val(data).trigger('change');
		});
	})
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