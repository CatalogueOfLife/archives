<?php
/*
 * The 2005 search pages used to send the complete SQL of a search to the
 * browser (hidden field "search_query") and run whatever came back. The SQL now
 * stays in the session and the browser only gets an opaque key for it.
 * Include before any output: it starts the session.
 */
if (session_id() == "") {
	session_start() ;
}

function ac_store_query($query) {
	if ($query == "") {
		return "" ;
	}
	$key = sha1($query) ;
	if (!isset($_SESSION["ac_queries"]) || !is_array($_SESSION["ac_queries"])) {
		$_SESSION["ac_queries"] = array() ;
	}
	unset($_SESSION["ac_queries"][$key]) ;
	$_SESSION["ac_queries"][$key] = $query ;
	// keep the most recent searches only
	$_SESSION["ac_queries"] = array_slice($_SESSION["ac_queries"], -20, null, true) ;
	return $key ;
}

function ac_load_query($key) {
	if (is_string($key) && isset($_SESSION["ac_queries"][$key])) {
		return $_SESSION["ac_queries"][$key] ;
	}
	return "" ;
}
?>
