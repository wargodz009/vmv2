<div class="row">
	<div class="col-md-8 col-md-offset-2">
		<br/>
		<div class="well">
			<form action="<?=base_url();?>sales/save" class="form" method="post">
			<div class="form-group">
				<label for="">Order Type</label>
				<select name="" id="sales_type" class="form-control">
					<option value="1">Client Orders</option>
					<option value="2">Samples/Donation/Buffer stocks</option>
					<option value="3">Personal Use</option>
				</select>
			</div>
			<div class="form-group">
				<label for="">MSR CODE</label>
				<select name="" id="msr_client_id" class="form-control">
					<option value="">--Select --</option>
					<?php
					if(!empty($msr_client)) {
						foreach($msr_client as $msr) {
							echo '<option value="'.$msr->msr_client_id.'">'.get_name($msr->msr_id).' -> '.get_name($msr->client_id).'</option>';
						}
					}
					?>
				</select>
			</div>
			<div class="form-group">
				<label for="">S.O. #</label>
				<input type="text" class="form-control" name="form_number"/>
			</div>
			<div class="form-group">
				<label for="">DR/SI #</label>
				<input type="text" class="form-control" name="si_no"/>
			</div>
			<div class="form-group">
				<label for="">Client's Name</label>
				<input type="text" class="form-control" name="client_name" id="client_name" />
			</div>
			<div class="form-group">
				<label for="">Address</label>
				<input type="text" class="form-control" name="client_address" id="client_address" />
			</div>
			<div class="form-group">
				<label for="">Product</label>
				<select name="product_id" id="product_id" class="form-control">
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
				<input type="text" class="form-control" name="generic_name" id="generic_name"/>
			</div>
			<div class="form-group">
				<label for="">Batch ID</label>
				<select name="product_batch" id="product_batch" class="form-control">
					<option value="">--Select --</option>
				</select>
			</div>
			<div class="form-group">
				<label for="">QTY</label>
				<input type="text" class="form-control" name="quantity" id="quantity"/>
			</div>
			<div class="form-group">
				<label for="">PRICE</label>
				<input type="text" class="form-control" name="price" id="price"/>
			</div>
			<div class="form-group">
				<label for="">Sub-Total</label>
				<input type="text" class="form-control" name="subtotal" id="subtotal" readonly />
			</div>
			<div class="form-group">
				<label for="">Discount</label>
				<input type="text" class="form-control" name="discount" id="discount"/>
			</div>
			<div class="form-group">
				<label for="">Discount Type</label>
				<select class="form-control" name="discount_type" id="discount_type">
					<option value="percentage">percentage</option>
					<option value="fix amount">fix amount</option>
				</select>
			</div>
			<div class="form-group">
				<label for="">Vat Sales</label>
				<input type="text" class="form-control" name="vat_sales" id="vat_sales" readonly />
			</div>
			<div class="form-group">
				<label for="">12% Vat</label>
				<input type="text" class="form-control" name="12_vat" id="vat" readonly />
			</div>
			<div class="form-group">
				<label for="">Total Amount</label>
				<input type="text" class="form-control" name="total_amount" id="total_amount" readonly />
			</div>
			<div class="form-group">
				<label for=""></label>
				<input type="submit" class="btn btn-info pull-right" value="SAVE ORDER"/>
			</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$('#msr_client_id').change(function(){
		if($('#msr_client_id :selected').val() != '') {
			$.getJSON('create/client_info/' + $('#msr_client_id :selected').val(),function(data) {
				$('#client_name').val(data.first_name);
				$('#client_address').val(data.address);
			});
		} else {
			$('#client_name').val('');
			$('#client_address').val('');
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
	function calculate_vat() {
		if($('#subtotal').val() != '') {
			var total = $('#subtotal').val();
			var vat = total * 0.12;
			var new_total = total - vat;
			$('#vat_sales').val(new_total);
			$('#vat').val(vat);
		} else {
			$('#vat_sales').val('');
			$('#vat').val('');
		}
	}
});
</script>