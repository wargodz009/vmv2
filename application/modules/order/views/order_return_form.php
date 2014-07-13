<div class="row">
	<?php 
	if(isset($items)) {
		$x = 0;
		echo '<form action="" method="post" class="form-horizontal">';
		echo '<input type="hidden" name="order_id" value="$order_details[0]->order_id">';
		foreach($items as $item) {
			echo 'Return '.get_item_name(get_item_id_from_batch($item->batch_id)).'<br />';
			echo '<div class="control-group"> <label for="">Quantity</label> ';
			echo "<input type='hidden' class='form-control :number :required' name='items[$x][order_item_id]' value='".$item->order_item_id."'>";
			echo "<input type='hidden' class='form-control :number :required' name='items[$x][batch_id]' value='".$item->batch_id."'>";
			echo "<input type='text' class='form-control :number :required' name='items[$x][quantity]' value='".$item->quantity."'>";
			echo '</div>';
			echo '<div class="control-group"> <label for="">Reason</label> ';
			echo "<input type='text' class='form-control :required' name='items[$x][reason]' value=''>";
			echo '</div> <br />';
			$x++;
		}
		echo '<input type="submit" name="submit" value="submit" class="btn btn-primary">';
		echo '</form>';
	}
	?>
</div>