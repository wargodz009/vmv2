<h2 class="">History per MSR</h2>
<button id="btnExport" class="btn btn-default pull-right">btnExport</button> <br /><br />
<?php
//$this->load->library('table');
//$this->table->set_heading('order','date','client_name','form_number','total','product','qty','free','discount','total_discount','total');
//$tmpl = array ( 'table_open'  => '<table id="tblExport" class="table table-hover table-striped">' );
//$this->table->set_template($tmpl);
//echo $this->table->generate($order);
echo '<table id="tblExport" class="table table-hover table-striped">';

echo '<thead>';
echo '<tr>
	<td colspan=5><strong>MSR NAME: </strong>'.$msr_name.'</td>
	<td colspan=6><strong>AREA: </strong>'.$msr_district.'</td>
</tr>';
echo '<tr>';
echo '<td>DR/SI DATE</td>';
echo '<td>CLIENTS</td>';
echo '<td>DI/SI #</td>';
echo '<td>TOTAL AMOUNT</td>';
echo '<td>PRODUCTS</td>';
echo '<td>Qty.</td>';
echo '<td>Price</td>';
echo '<td>Free Goods</td>';
echo '<td>Disc.</td>';
echo '<td>TOTAL disc.</td>';
echo '<td>TOTAL Amt.</td>';
echo '</tr></thead><tbody>';
if(!empty($orders)) {
	foreach($orders as $order) {
		$items = get_order_items($order->order_id);
		if($items) {
			foreach($items as $item) {
				if($order->discount_type == 'percentage') { 
					$pre = ''; $post = '%'; 
					$total_discount = ($item->quantity * $item->custom_price) * ($order->discount/100);
					$total = ($item->quantity * $item->custom_price) - $total_discount;
				} else {
					$pre = 'P '; $post = ''; 
					$total_discount = $order->discount;
					$total = ($item->quantity * $item->custom_price) - $order->discount;
				}
				
				echo '<tr>';
				echo '<td>'.pretty_date($order->order_date).'</td>';
				echo '<td>'.get_name(get_msr_client($order->msr_client_id,'client_id')).'</td>';
				echo '<td>'.$order->form_number.'</td>';
				echo '<td>'.($item->quantity * $item->custom_price).'</td>';
				echo '<td>'.get_item_name($order->product_id).'</td>';
				echo '<td>'.$item->quantity.'</td>';
				echo '<td>'.$item->custom_price.'</td>';
				echo '<td>'.($item->add_type == 'paid'?'No':'Yes').'</td>';
				echo '<td>'.$pre.$order->discount.' '.$post.'</td>';
				echo '<td>('.$total_discount.')</td>';
				echo '<td>'.$total.'</td>';
				echo '</tr>';
			}
		}
	}
}
echo '</tbody></table>';