<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Vintel Med Enterprises</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <!-- Javascript -->
    <script src="<?php echo base_url(); ?>assets/js/jquery.js"></script>
    <script src="<?php echo base_url(); ?>assets/js/bootstrap.min.js"></script>
    <script src="<?php echo base_url(); ?>theme/js/jquery-ui-1.10.2.custom.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/js/script.js"></script>
    <script src="<?php echo base_url(); ?>assets/js/jquery.battatech.excelexport.min.js"></script>
	
    <!-- styles -->
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/bootstrap-theme.min.css">
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <link href="<?php echo base_url(); ?>theme/css/style.css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>assets/jquery-ui-1.10.3.custom/css/custom-theme/jquery-ui-1.10.3.custom.min.css" rel="stylesheet">
    <!-- Validation plugin -->
    <link href="<?php echo base_url(); ?>theme/css/vanadium.css" rel="stylesheet">
    <script src="<?php echo base_url(); ?>theme/js/vanadium.js"></script>  

    <!-- slim scroller-->
    <script src="<?php echo base_url(); ?>theme/js/jquery.slimscroll.js"></script>  
	
    <!-- tiny mce plugin -->
    <script type="text/javascript" src="<?php echo base_url(); ?>theme/js/tinymce/tinymce.min.js"></script>
    <script type="text/javascript">
    tinyMCE.init({
    		mode : "specific_textareas",
    		editor_selector : "wysiwyg"
    });
	$(document).ready(function () {
        $("#btnExport").click(function () {
            $("#tblExport").battatech_excelexport({
                containerid: "tblExport"
               , datatype: 'table'
            });
        });
    });
    </script>
  </head>

  <body>