<?php
	require_once 'lib/mysql.php';
	
	$link = mysql_connect("database", "root", "4358a13cbd5f0e166bac29b9ecf6e98a") or die("Error: connection failure: " . mysql_error());
	mysql_select_db("col2005ac") or die("Error: could not select database");
?>
