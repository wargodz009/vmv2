<div class="well">
	<div class="container-fluid">
		<form action="" role="form" method="post">
			<div class="form-group">
				<label for="">Quantity: </label>
				<input type="hidden" name="order_id" value="<?=$order_details[0]->order_id;?>">
				<input type="text" name="quantity" class="form-control :number">
			</div>
			<div class="form-group">
				<label for="">Reason: </label>
				<textarea name="reason" id="reason" cols="30" rows="10" class="form-control :required"></textarea>
			</div>
			<div class="form-group">
				<input type="submit" name="submit" class="btn btn-primary" value="SAVE">
			</div>
		</form>
	</div>
</div>