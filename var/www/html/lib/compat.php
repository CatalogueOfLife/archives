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
