<h2>Collection per MSR</h2>
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
		$payments = $this->crud_model->read('payment',array(array('where_in','order_id',$order->order_id)));
		if(!empty($payments)) {
			foreach($payments as $payment) {
				echo '<tr>
					<td>'.pretty_date($order->order_date).'</td>
					<td>'.get_name(get_msr_client($order->msr_client_id,'client_id')).'</td>
					<td>'.$order->form_number.'</td>
					<td>'.$payment->bank.'</td>
					<td>'.$payment->check_number.'</td>
					<td>'.pretty_date($payment->datetime).'</td>
					<td>'.pretty_date($payment->datetime_collected).'</td>
					<td>'.($payment->status == 1?$payment->check_full_amount:'').'</td>
					<td>a</td>
				</tr>';
			}
		}
	}
}
echo '</tbody></table>';