<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title><?=$this->setting_model->get_setting('site_header');?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- styles -->
    <link href="<?php echo base_url(); ?>theme/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
    </style>
    <link href="<?php echo base_url(); ?>theme/css/bootstrap-responsive.css" rel="stylesheet">

    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Javascript -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
    <script src="<?php echo base_url(); ?>theme/js/bootstrap.js"></script>
	<script src="<?php echo base_url(); ?>theme/js/jquery-ui-1.10.2.custom.min.js"></script>
	
	<!-- Validation plugin -->
    <link href="<?php echo base_url(); ?>theme/css/vanadium.css" rel="stylesheet">
	<script src="<?php echo base_url(); ?>theme/js/vanadium.js"></script> 
	
	<!-- tiny mce plugin -->
	<script type="text/javascript" src="<?php echo base_url(); ?>theme/js/tinymce/tinymce.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		var btn = $.fn.button.noConflict() // reverts $.fn.button to jqueryui btn
		$.fn.btn = btn // assigns bootstrap button functionality to $.fn.btn
	});
	tinyMCE.init({
			mode : "specific_textareas",
			editor_selector : "wysiwyg"
	});
	</script>
  </head>

  <body>