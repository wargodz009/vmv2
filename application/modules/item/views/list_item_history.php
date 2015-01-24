<h2>History per Product</h2>
<br>
<?=$info;?> <hr />
<?php
//foreach($orders as $order) {
//	echo $order['type'].' - '.$order['ref'].' - '.$order['batch'].' - '.$order['date'].' - '.$order['qty'].' - '.$order['transtype'].' - '.$order['inventory_count'].'<br />';
//}
?>
<?php
$this->load->library('table');
$this->table->set_heading('Reference','Reference Document','Reference batch #','transaction date','in','out','inventory');
$tmpl = array ( 'table_open'  => '<table class="table table-striped">' );
$this->table->set_template($tmpl);
echo $this->table->generate($orders);