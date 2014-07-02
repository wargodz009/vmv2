<?php
$ctr = 1;
foreach($users as $user) {
	echo $user->first_name.'<br />';
	$clients = $this->user_model->get_all_clients_by_msr_id($user->user_id);
	echo '<table class="table table-striped table-bordered table-responsive" title="'.$user->first_name.'">
	<tbody>
	';
	if(!empty($clients)) {
		foreach($clients as $client) {
			echo '<tr>
				<td>'.get_name($client->client_id).'</td>
			</tr>';
		}
	} else {
		echo '<tr>
				<td>No Clients!</td>
			</tr>';
	}
	echo '</tbody>';
	echo '</table>';
	$ctr++;
}
?>
