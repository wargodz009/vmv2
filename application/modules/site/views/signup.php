
	
	<div class="row">
		<div class="span6 offset3">
			<h1>Sign up</h1>
			<div class="well">
			
				<form class="form-horizontal" method="post" action="">
					<div class="control-group">
						<label class="control-label" for="inputFullName">Full Name</label>
						<div class="controls">
							<input class=":required" type="text" id="inputFullName" value="<?php echo set_value('fullname'); ?>" name="fullname">
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label" for="inputEmail">Username</label>
						<div class="controls">
							<input class=":required" type="text" id="inputEmail" value="<?php echo set_value('username'); ?>" name="username">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputEmail">Email</label>
						<div class="controls">
							<input class=":required :email" type="text" id="inputEmail" value="<?php echo set_value('email'); ?>" name="email">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputPassword">Password</label>
						<div class="controls">
							<input class=":required" type="password" id="inputPassword" name="password">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputPassword">Retype-Password</label>
						<div class="controls">
							<input class=":required :same_as;inputPassword" type="password" id="" name="">
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<button type="submit" class="btn">Sign up</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
