<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title><?=$this->setting_model->get_setting('site_header');?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <!-- Javascript -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="<?php echo base_url(); ?>theme/js/jquery-ui-1.10.2.custom.min.js"></script>

    <!-- styles -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
	
	<!-- Validation plugin -->
    <link href="<?php echo base_url(); ?>theme/css/style.css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>theme/css/vanadium.css" rel="stylesheet">
	<script src="<?php echo base_url(); ?>theme/js/vanadium.js"></script> 
	
	<!-- tiny mce plugin -->
	<script type="text/javascript" src="<?php echo base_url(); ?>theme/js/tinymce/tinymce.min.js"></script>
	<script type="text/javascript">
	tinyMCE.init({
			mode : "specific_textareas",
			editor_selector : "wysiwyg"
	});
	</script>
  </head>

  <body>