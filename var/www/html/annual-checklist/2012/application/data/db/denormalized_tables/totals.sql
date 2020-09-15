INSERT INTO `totals` (`total`,`description`)

SELECT
    COUNT(t.id) AS total,
    "species" AS description

FROM
    `taxon` AS t

WHERE
    t.`taxonomic_rank_id` = 83
;

INSERT INTO `totals` (`total`,`description`)

SELECT
    COUNT(t.id) AS total,
    "infraspecies" AS description

FROM
    `taxon` AS t

WHERE
    t.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83)
;

INSERT INTO `totals` (`total`,`description`)

SELECT
    COUNT(t.id) AS total,
    "taxon" AS description

FROM
    `taxon` AS t
;

INSERT INTO `totals` (`total`,`description`)

SELECT
    COUNT(DISTINCT `id`) AS total,
    "synonymic_species" AS description

FROM
    `temp_search_table` 

WHERE
    `name_status` IN (2,3,5) AND
    `rank` = "species"
;

INSERT INTO `totals` (`total`,`description`)

SELECT
    COUNT(DISTINCT `id`) AS total,
    "synonymic_infraspecies" AS description

FROM
    `temp_search_table` 

WHERE
    `name_status` IN (2,3,5) AND
    `rank` NOT IN (
        "kingdom",
        "phylum",
        "class",
        "order",
        "superfamily",
        "family",
        "genus",
        "subgenus",
        "species"
    )
;

INSERT INTO `totals` (`total`,`description`)

SELECT
    COUNT(id) AS total,
    "synonyms" AS description

FROM
    `synonym`
;

INSERT INTO `totals` (`total`,`description`)

SELECT
    COUNT(DISTINCT `id`) AS total,
    "common_names" AS description

FROM
    `common_name`
;

INSERT INTO `totals` (`total`,`description`)

SELECT
    COUNT(DISTINCT t.`id`) + (SELECT
    COUNT(DISTINCT s.`id`) AS total

FROM
    `synonym` AS s) AS total,
    "scientific_names" AS description

FROM
    `taxon` AS t
;

INSERT INTO `totals` (`total`,`description`)

SELECT
    COUNT(sd.id) AS total,
    "source_databases" AS description

FROM
    `source_database` AS sd
;

INSERT INTO `totals` (`total`,`description`)

SELECT
    COUNT(sd.id) AS total,
    "new_source_databases" AS description

FROM
    `source_database` AS sd

WHERE 1 = 0
;