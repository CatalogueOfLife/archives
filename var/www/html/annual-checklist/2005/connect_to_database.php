<?php
	require_once 'lib/mysql.php';
	
	$link = mysql_connect("database", getenv("DATABASE_USER"), getenv("DATABASE_PASSWORD")) or die("Error: connection failure: " . mysql_error());
	mysql_select_db("col2005ac") or die("Error: could not select database");
?>
