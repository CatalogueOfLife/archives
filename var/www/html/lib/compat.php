<?php
/**
 * PHP 7 behaviour the 2005-2019 Annual Checklist apps rely on, for PHP 8.
 * Loaded for every request via auto_prepend_file (etc/php/archives.ini).
 */

if (!function_exists('legacy_count')) {
    /**
     * count() as in PHP 7: null counts 0 and any other non-countable value 1,
     * where PHP 8 throws a TypeError.
     */
    function legacy_count($value, $mode = COUNT_NORMAL)
    {
        if (is_countable($value)) {
            return count($value, $mode);
        }
        return $value === null ? 0 : 1;
    }
}

/*
 * Request filter for the procedural 2005-2009 apps.
 *
 * Those apps copy request values into SQL strings (almost always single-quoted)
 * and HTML without escaping, after their own trim(stripslashes(urldecode())).
 * Rather than patching every query, make each incoming value safe for both:
 * url-decode and drop \ " < > and control characters until the value no longer
 * changes (so the apps' own urldecode() cannot bring any of them back), then
 * replace ' with _ : the LIKE single-character wildcard, so name searches
 * still match "Bird's-eye", and harmless in '...' SQL strings and in
 * single-quoted HTML attributes. Unquoted numeric parameters are cast to int
 * by the apps.
 */
if (!function_exists('legacy_clean_request_value')) {
    function legacy_clean_request_value($value)
    {
        if (is_array($value)) {
            return array_map('legacy_clean_request_value', $value);
        }
        $value = (string) $value;
        for ($i = 0; $i < 10; $i++) {
            $clean = preg_replace(
                '/[\x00-\x08\x0B\x0C\x0E-\x1F\x7F\\\\"<>]/', '',
                rawurldecode($value)
            );
            if ($clean === $value) {
                break;
            }
            $value = $clean;
        }
        if ($i === 10) {
            // pathologically nested encoding
            $value = str_replace('%', '', $value);
        }
        return str_replace("'", '_', $value);
    }

    function legacy_clean_request()
    {
        foreach (array('_GET', '_POST', '_REQUEST', '_COOKIE') as $name) {
            $GLOBALS[$name] = legacy_clean_request_value($GLOBALS[$name]);
        }
        // the apps build links from these: no path info, no quotes or tags
        $_SERVER['PHP_SELF'] = $_SERVER['SCRIPT_NAME'];
        if (isset($_SERVER['QUERY_STRING'])) {
            $_SERVER['QUERY_STRING'] = str_replace(
                array("'", '"', '<', '>'), array('%27', '%22', '%3C', '%3E'),
                $_SERVER['QUERY_STRING']
            );
        }
    }

    if (isset($_SERVER['SCRIPT_FILENAME']) &&
        preg_match('#/annual-checklist/200[5-9]/#', $_SERVER['SCRIPT_FILENAME'])) {
        legacy_clean_request();
    }
}
