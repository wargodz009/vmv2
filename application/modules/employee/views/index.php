<div class="row">
	<div class="span12">
		<table class="table table-hover">
		<thead>
			<td>User Type</td>
			<td>Count</td>
			<td>Active</td>
		</thead>
		<tbody>
			<?php
			$user_types = $this->crud_model->read('role');
			foreach ($user_types as $key) {
				?>
				<tr>
					<td><?=$key->name;?></td>
					<td><?=count($this->crud_model->read('user',array(array('where','role_id',$key->role_id))));?></td>
					<td><?=count($this->crud_model->read('user',array(array('where','role_id',$key->role_id),array('where','status','active'))));?></td>
					<td></td>
					<!--td></td-->		
				</tr>
				<?php
			}
			?>
		</tbody>
		</table>
	</div>
</div>
