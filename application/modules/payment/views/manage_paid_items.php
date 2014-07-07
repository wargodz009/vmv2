<div class="row">
	<?php 
	if(isset($items)) {
		$x = 0;
		echo '<form action="" method="post">';
		echo "<input type='hidden' name='payment_id' value='".$payment_details[0]->payment_id."'>";
		foreach($items as $item) {
			echo '<div class="control-group"> <label for="">Paid Amount:</label> ';
			echo "<input type='hidden' name='items[$x][order_item_id]' value='".$item->order_item_id."'>";
			echo "<input type='text' class='form-control :number :required' name='items[$x][amount]' value='".get_paid_amount($payment_details[0]->payment_id,$item->order_item_id)."'>";
			echo '<span class="help-block">'.get_item_name(get_item_id_from_batch($item->batch_id)).'</span>';
			echo '</div>';
			$x++;
		}
		echo '<input type="submit" value="submit" class="btn btn-primary">';
		echo '</form>';
	}
	?>
</div>