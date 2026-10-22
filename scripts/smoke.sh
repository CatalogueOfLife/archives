#!/usr/bin/env bash
# Smoke test for the Annual Checklist archives.
#
#   scripts/smoke.sh [base-url]        default http://localhost
#   EXPECT=1 scripts/smoke.sh ...      also check the content of a few well-known links (needs the real data)
#
# Every page must answer without a server error (5xx). Afterwards check the container log for PHP errors:
#   docker-compose logs checklists | grep -E 'PHP (Fatal|Warning)|Uncaught'
set -u
BASE=${1:-http://localhost}
HOST=archives.catalogueoflife.org
fail=0

check() { # path [expected text]
  local path=$1 expect=${2:-} out code
  out=$(curl -s -H "Host: $HOST" -w '\n%{http_code}' "$BASE/annual-checklist/$path")
  code=${out##*$'\n'}
  if [[ $code -ge 500 || $code == 000 ]]; then
    echo "FAIL $code $path"; fail=1
  elif [[ -n $expect && ${EXPECT:-0} == 1 ]] && ! grep -qF "$expect" <<<"$out"; then
    echo "FAIL missing '$expect' $code $path"; fail=1
  else
    echo "ok   $code $path"
  fi
}

# links as found on Wikipedia
check "2011/details/species/id/8171043" "Phyllanthus acidus"
check "2014/details/species/id/14376236" "Abies alba"
check "2019/details/species/id/12dca9c49741815f82400bb7bff50553" "Abies alba"
check "2008/show_species_details.php?record_id=3429572" "Abies alba"

for y in 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019; do
  check "$y/"
  check "$y/search/all/key/Abies+alba/match/1" "Abies alba"
  check "$y/search/all/key/Abis+alba/match/1/fuzzy/1"
  check "$y/search/scientific"
  check "$y/search/scientific/genus/Abies/species/alba"
  check "$y/search/scientific?fetch=genus&q=Abi*&p=%7B%7D"
  check "$y/search/common/key/fir"
  check "$y/search/distribution/key/Europe"
  check "$y/search/distribution?regions=1,2&submit=1"
  check "$y/browse/tree"
  check "$y/browse/tree?fetch=1&id=0"
  check "$y/browse/classification"
  check "$y/info/ac"
  check "$y/info/databases"
  check "$y/info/databases/sort/group/direction/desc"
  check "$y/details/database/id/1"
  check "$y/webservice?name=Abies+alba"
  check "$y/webservice?name=Abies&rank=genus&response=full"
done

for y in 2005 2006 2007 2008 2009; do
  check "$y/"
  check "$y/search.php"
  check "$y/search_scientific.php"
  check "$y/search_results.php?search_string=Abies+alba&search_type=search_scientific" "Abies"
  check "$y/search_results.php?genus=Abies&species=alba&search_type=search_scientific"
  check "$y/search_results.php?common_name=fir&search_type=search_by_common_name"
  check "$y/browse_taxa.php"
  check "$y/browse_taxa.php?path=1&selected_taxon=1"
  check "$y/browse_by_classification.php"
  check "$y/show_common_name_details.php?name=fir"
  check "$y/show_database_details.php?database_name=ITIS"
  check "$y/info_about_col.php"
  check "$y/standby.php?msg=Searching"
done
for y in 2006 2007 2008 2009; do
  check "$y/classification_autocomplete.php?rank=genus&page=search_scientific.php&genus=Abi"
done
check "2007/webservice/search.php?name=Abies+alba"
check "2008/webservices/search.php?name=Abies+alba"
check "2009/webservices/search.php?name=Abies+alba"

exit $fail
