<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       Protection.php                                              ##
##  Developed by:  SlimShady                                                   ##
##  Edited by:     Dzoki & Dixie                                               ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################

//heef npc uitzondering omdat die met speciaal $_post werken
if(isset($_POST)){
	if(!isset($_POST['ft'])){
	$_POST = @array_map('$database->escape_string_query', $_POST);
	$_POST = array_map('htmlspecialchars', $_POST);
	}
}
			$rsargs=$_GET['rsargs'];
$_GET = array_map('$database->escape_string_query', $_GET);
$_GET = array_map('htmlspecialchars', $_GET);
$_GET['rsargs']=$rsargs;
$_COOKIE = array_map('$database->escape_string_query', $_COOKIE);
$_COOKIE = array_map('htmlspecialchars', $_COOKIE);
?>
