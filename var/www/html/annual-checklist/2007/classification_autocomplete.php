<?php
header('Content-Type: text/xml');

require_once "connect_to_database.php" ;

// Builds the classification autocomplete query on the server from the search
// form values. (It used to be built in scripts_autocomplete.js and sent as raw SQL.)
function autocompleteValue($name) {
	if (!isset($_GET[$name]) || !is_string($_GET[$name])) {
		return "" ;
	}
	$value = trim(stripslashes(urldecode($_GET[$name]))) ;
	return str_replace("*", "%", $value) ;
}

function autocompleteQuery() {
	$taxon = autocompleteValue("rank") ;
	if ($taxon == "tax_class") {
		$taxon = "class" ;
	}
	$fields = array("kingdom", "phylum", "tax_class", "order", "superfamily", "family",
		"genus", "species", "infraspecies") ;
	$v = array() ;
	foreach ($fields as $field) {
		$v[$field] = mysql_real_escape_string(autocompleteValue($field)) ;
	}
	$browse = (autocompleteValue("page") == "browse_by_classification.php") ;

	// higher taxa: kingdom ... family, filtered by the ranks above
	$higher = array("kingdom" => "kingdom", "phylum" => "phylum", "class" => "tax_class",
		"order" => "order", "superfamily" => "superfamily", "family" => "family") ;
	if (isset($higher[$taxon])) {
		$query = "SELECT `$taxon` FROM `families` WHERE `$taxon` LIKE '" . $v[$higher[$taxon]] .
			"%' AND `is_accepted_name` = 1" ;
		foreach ($higher as $column => $field) {
			if ($column == $taxon) {
				break ;
			}
			if ($v[$field] != "") {
				$query .= " AND `$column` LIKE '" . $v[$field] . "'" ;
			}
		}
		return $query . " ORDER BY `$taxon`" ;
	}

	$lower = array("genus", "species", "infraspecies") ;
	if (!in_array($taxon, $lower, true)) {
		return "" ;
	}
	// genus+ filtered by any higher taxon (genus and species also skip superfamily here, as before)
	$filterFields = array("kingdom", "phylum", "tax_class", "order", "family") ;
	if ($taxon == "genus") {
		$filterFields[] = "superfamily" ;
	}
	$hasHigher = false ;
	foreach ($filterFields as $field) {
		$hasHigher = $hasHigher || $v[$field] != "" ;
	}
	if ($hasHigher) {
		$query = "SELECT `scientific_names`.`$taxon` FROM `scientific_names`,`families` WHERE `scientific_names`.`$taxon` LIKE '" .
			$v[$taxon] . "%' AND `scientific_names`.`family_id` = `families`.`record_id` " ;
		if ($browse) {
			$query .= " AND `scientific_names`.`is_accepted_name` = 1 " ;
		}
		foreach ($higher as $column => $field) {
			if ($v[$field] != "") {
				$query .= " AND `families`.`$column` LIKE '" . $v[$field] . "'" ;
			}
		}
		foreach ($lower as $column) {
			if ($column == $taxon) {
				break ;
			}
			if ($v[$column] != "") {
				$query .= " AND `scientific_names`.`$column` LIKE '" . $v[$column] . "'" ;
			}
		}
		return $query . " ORDER BY `scientific_names`.`$taxon`" ;
	}

	// no higher taxa: precomputed lists, unless a lower rank narrows it down
	$narrowing = ($taxon == "species" && $v["genus"] != "") ||
		($taxon == "infraspecies" && $v["genus"] . $v["species"] != "") ;
	if ($taxon == "genus" || !$narrowing) {
		return "SELECT `name` FROM `hard_coded_taxon_lists` WHERE `rank` = '$taxon' AND `name` LIKE '" .
			$v[$taxon] . "%'" . ($browse ? " AND `accepted_names_only` = 1 " : " AND `accepted_names_only` = 0 ") ;
	}
	$query = "SELECT `$taxon` FROM `scientific_names` WHERE `$taxon` LIKE '" . $v[$taxon] . "%' " ;
	if ($browse) {
		$query .= " AND `scientific_names`.`is_accepted_name` = 1 " ;
	}
	foreach ($lower as $column) {
		if ($column == $taxon) {
			break ;
		}
		if ($v[$column] != "") {
			$query .= " AND `$column` LIKE '" . $v[$column] . "'" ;
		}
	}
	return $query . " ORDER BY `$taxon`" ;
}

function getResult() {
	$query = autocompleteQuery() ;
	if ($query == "") {
		return true;
	}
	$result = mysql_query($query . " LIMIT 0,1") or die ("Error: MySQL query failed");
	$number_of_records = mysql_num_rows($result) ;
	if ($number_of_records == 0) {
		return "<record>-</record>";
	} else {
		$records = "" ;
		for ($i = 0 ; $i < $number_of_records ; $i++) {
			$row = mysql_fetch_row($result) ;
			$records .= "<record>".htmlspecialchars($row[0], ENT_QUOTES | ENT_XML1, "ISO-8859-1")."</record>";
		}
		return $records;
	}
}

?>
<?php echo '<?xml version="1.0" encoding="iso-8859-1" standalone="yes"?>'; ?> <response> <records> <?php echo getResult();?> </records> 
</response>