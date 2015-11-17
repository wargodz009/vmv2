<div class="row">
	<div class="col-md-8 col-md-offset-2">
		<br/>
		<div class="well">
			<form action="<?=base_url();?>sales/save" class="form" method="post">
			<div class="form-group">
				<label for="">Order Type</label>
				<select name="sales_type" id="sales_type" class="form-control">
					<option value="1">Client Orders</option>
					<option value="2">Samples</option>
					<option value="3">Personal Use</option>
					<option value="4">Donation</option>
					<option value="5">Buffer stocks</option>
					<option value="6">replacement</option>
				</select>
			</div>
			<div class="form-group">
				<label for="">DR/SI</label>
				<select name="transaction_type" id="transaction_type" class="form-control">
					<option value="DR">DR</option>
					<option value="SI">SI</option>
				</select>
			</div>
			<!--div class="form-group">
				<label for="">MSR CODE</label>
				<select id="msr_client_id" name="msr_client_id" class="form-control :required">
					<option value="0">OFFICE ACCOUNT</option>
					<?php
					if(!empty($msr_client)) {
						foreach($msr_client as $msr) {
							echo '<option value="'.$msr->msr_client_id.'">'.get_name($msr->msr_id).' -> '.get_name($msr->client_id).'</option>';
						}
					}
					?>
				</select>
			</div-->
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
			<div class="form-group so">
				<label for="">S.O. #</label>
				<input type="text" class="form-control" name="form_number"/>
			</div>
			<div class="form-group">
				<label for="">DR/SI #</label>
				<input type="text" class="form-control" name="si_no"/>
			</div>
			<div class="form-group">
				<label for="">DR date</label>
				<input type="text" class="form-control datepicker" name="dr_date" />
			</div>
			<div class="form-group">
				<label for="">Clients Name</label>
				<select id="client_name" name="msr_client_id" class="form-control :required">
				</select>
			</div>
			<div class="form-group">
				<label for="">Product</label>
				<select name="product_id" id="product_id" class="form-control :required">
					<option value="">--Select --</option>
					<?php
					if(!empty($items)) {
						foreach($items as $item) {
							echo '<option value="'.$item->item_id.'">'.get_item_name($item->item_id).'</option>';
						}
					}
					?>
				</select>
			</div>
			<div class="form-group">
				<label for="">Generic Name</label>
				<input type="text" class="form-control :required" name="generic_name" id="generic_name"/>
			</div>
			<div class="form-group">
				<label for="">Batch ID</label>
				<select name="product_batch" id="product_batch" class="form-control :required">
					<option value="">--Select --</option>
				</select>
			</div>
			<div class="form-group">
				<label for="">EXPIRE DATE</label>
				<input type="text" class="form-control :required" name="expire_date" id="expire_date"/>
			</div>
			<div class="form-group">
				<label for="">QTY</label>
				<input type="text" class="form-control :required :number" name="quantity" id="quantity"/>
			</div>
			<div class="form-group">
				<label for="">FREE GOODS (count)</label>
				<input type="text" class="form-control :required :number" name="free_goods" id="free_goods"/>
			</div>
			<div class="form-group price">
				<label for="">PRICE</label>
				<input type="text" class="form-control :required :number" name="price" id="price"/>
			</div>
			<div class="form-group price">
				<label for="">Sub-Total</label>
				<input type="text" class="form-control :required" name="subtotal" id="subtotal" readonly />
			</div>
			<div class="form-group price">
				<label for="">Discount</label>
				<input type="text" class="form-control :number" name="discount" id="discount"/>
			</div>
			<div class="form-group price">
				<label for="">Discount Type</label>
				<select class="form-control" name="discount_type" id="discount_type">
					<option value="percentage">percentage</option>
					<option value="php">fix amount</option>
				</select>
			</div>
			<div class="form-group price">
				<label for="">Discount Amount</label>
				<input type="text" class="form-control" name="discount_amount" id="discount_amount"/>
			</div>
			<div class="form-group si">
				<label for="">Vat Sales</label>
				<input type="text" class="form-control" name="vat_sales" id="vat_sales" readonly />
			</div>
			<div class="form-group si">
				<label for="">12% Vat</label>
				<input type="text" class="form-control" name="vat_12" id="vat" readonly />
			</div>
			<div class="form-group">
				<label for="">Total Amount</label>
				<input type="text" class="form-control :required" name="total_amount" id="total_amount" readonly />
			</div>
			<div class="form-group">
				<label class="" for="">&nbsp;</label>
				<input type="submit" class="btn btn-info pull-right" value="SAVE ORDER"/>
				<div class="pull-right">&nbsp;</div>
				<a href="<?=base_url();?>sales"><input type="button" class="btn btn-warning pull-right" value="CANCEL"/></a>
			</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	/*$('#msr_client_id').change(function(){
		if($('#msr_client_id :selected').val() != '') {
			$.getJSON('create/client_info/' + $('#msr_client_id :selected').val(),function(data) {
				$('#client_name').val(data.first_name);
				$('#client_address').val(data.address);
			});
		} else {
			$('#client_name').val('');
			$('#client_address').val('');
		}
	});*/
	$('#area').change(function(){
		if($('#area :selected').val() != '0') {
			$('#client_name').empty();
			$.getJSON('create/area_clients/' + encodeURIComponent($('#area :selected').val()),function(data) {
				$.each(data, function(){
					$('<option/>', {
						'value': this.id,
						'text': this.msr_client_id + ' -> ' + this.client_id
					}).appendTo('#client_name');
				});
			});
		} else {
			$('#client_name').empty();
		}
	});
	$('#product_id').change(function(){
		if($('#product_id :selected').val() != '') {
			$.getJSON('create/product_info/' + $('#product_id :selected').val(),function(data) {
				$('#generic_name').val(data.items[0].generic_name); 
				$('#product_batch').empty();
				$.each(data.batches, function(){
					var o = new Option(this.batch_readable_id,this.batch_id);
					$(o).html(this.batch_readable_id);
					$('#product_batch').append(o);
					$('#price').val(this.sell);
					$('#expire_date').val(this.expire_date);
				});
			});
		} else {
			$('#generic_name').val('');
			$('#product_batch').empty();
			$('#price').val('');
		}
	});
	$('#quantity, #price').change(function(){
		var sub_total = '';
		if($('#quantity').val() != '' && $('#price').val() != '') {
			sub_total = calculate_subtotal($('#quantity').val(),$('#price').val());
		}
		$('#subtotal').val(sub_total);
		var total = 0;
		if($('#subtotal').val() != '' && $('#discount').val() != '') {
			total = calculate_total($('#subtotal').val(),$('#discount').val(),$('#discount_type :selected').val());
		}
		$('#total_amount').val($('#subtotal').val() - total);
		$('#discount_amount').val(calculate_total_amount($('#subtotal').val(),$('#discount').val(),$('#discount_type :selected').val()));
		calculate_vat();
	});
	$('#discount, #discount_type').change(function(){
		var total = 0;
		if($('#subtotal').val() != '' && $('#discount').val() != '') {
			total = calculate_total($('#subtotal').val(),$('#discount').val(),$('#discount_type :selected').val());
		}
		if($('#discount_type :selected').val() == 'percentage') {
			$('#total_amount').val($('#subtotal').val() - total);
		} else {
			$('#total_amount').val(total);
		}
		$('#discount_amount').val(calculate_total_amount($('#subtotal').val(),$('#discount').val(),$('#discount_type :selected').val()));
	});
	function calculate_subtotal(qty,price) {
		calculate_vat();
		return qty * price;
	}
	function calculate_total(total,discount,type) {
		if(type == 'percentage') {
			return  total * (discount / 100);
		} else {
			return total - discount;
		}
	}
	function calculate_total_amount(total,discount,type) {
		if(type == 'percentage') {
			return  (total * (discount / 100));
		} else {
			return discount;
		}
	}
	function calculate_vat() {
		if($('#subtotal').val() != '') {
			/*var total = $('#subtotal').val();
			var vat = total * 0.12;
			var new_total = total - vat;
			$('#vat_sales').val(new_total);
			$('#vat').val(vat);*/
			var total = $('#subtotal').val();
			var answer1 = total / 1.12;
			var answer2 = answer1 * 0.12;
			var vat_sales = answer1 - total;
			$('#vat_sales').val(answer1.toFixed(2));
			$('#vat').val(answer2.toFixed(2));
		} else {
			$('#vat_sales').val('');
			$('#vat').val('');
		}
	}
	$('#transaction_type').change(function(){
		$('.si').toggle();
	});
	$('#sales_type').change(function(){
		if($('#sales_type').val() > 1) {
			$('.so').hide();
		} else {
			$('.so').show();
		}
		if($('#sales_type').val() == 2 || $('#sales_type').val() == 4 || $('#sales_type').val() == 5 || $('#sales_type').val() == 6) {
			$('.price').hide();
		} else {
			$('.price').show();
		}
	});
});
</script>
<style type="text/css">
.si {
	display:none;
}
</style>