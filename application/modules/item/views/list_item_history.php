<h2>History per Product</h2>
<br>
<?php
//foreach($orders as $order) {
//	echo $order['type'].' - '.$order['ref'].' - '.$order['batch'].' - '.$order['date'].' - '.$order['qty'].' - '.$order['transtype'].' - '.$order['inventory_count'].'<br />';
//}
?>
<button id="btnExport" class="btn btn-default pull-right">btnExport</button>
<?php
$this->load->library('table');
$this->table->set_heading('Reference','Reference Document','Reference batch #','Transaction date','Transaction Type','Qty','Inventory');
$tmpl = array ( 'table_open'  => '<table id="tblExport" class="table table-hover table-striped">
<thead><tr>
	<td colspan=7>'.$info.'</td>
</tr></thead>
' );
$this->table->set_template($tmpl);
echo $this->table->generate($orders);