dashboard_advance content <br>
<?php
echo 'area | msr name | sales | quota | % | end month';
echo '<br>month:'.$month .' - year:'. $year .'- area:'.$area;
?>
<nav class="navbar navbar-right">
	<!-- Single button -->
<div class="btn-group form-inline">
	<select name="month"class="form-control">
		<option value="01">Jan</option>
		<option value="02">Feb</option>
		<option value="03">Mar</option>
		<option value="04">Apr</option>
		<option value="05">May</option>
		<option value="06">Jun</option>
		<option value="07">Jul</option>
		<option value="08">Aug</option>
		<option value="09">Sep</option>
		<option value="10">Oct</option>
		<option value="11">Nov</option>
		<option value="12">Dec</option>
	</select>
	<select name="day"class="form-control">
		<?php $x = 1; while($x <= 31)  : ?>
			<option value="<?=$x;?>"><?=$x;?></option>
		<?php $x++; endwhile; ?>
	</select>
	<select name="year"class="form-control">
		<?php $x = date('Y'); while($x >= date('Y') - 5)  : ?>
			<option value="<?=$x;?>"><?=$x;?></option>
		<?php $x--; endwhile; ?>
	</select>
</nav>
<table class="table table-hover">
<thead>
	<td>a</td>
	<td>a</td>
	<td>a</td>
</thead>
<tbody>
	<tr>
		<td>2</td>
		<td>2</td>
		<td>2</td>		
	</tr>
	<tr>
		<td>2</td>
		<td>2</td>
		<td>2</td>		
	</tr>
	<tr>
		<td>2</td>
		<td>2</td>
		<td>2</td>		
	</tr>
	<tr>
		<td>2</td>
		<td>2</td>
		<td>2</td>		
	</tr>
</tbody>
</table>